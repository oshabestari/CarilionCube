import untangle
import collections
import json
import operator
import os
import csv
import io

def enumerable_diffs(ea, eb):
    return [a for a in ea if a not in eb]


create_tables_using_friendly_names = True
stats_num_tables = None
stats_num_columns = None
stats_num_foreign_keys = None
stats_num_primary_keys = 0
stats_sql_lines_drop_tables = None
stats_sql_lines_create_tables = None
stats_sql_lines_add_foreign_keys = None

cube_visualstudio_path = os.path.join('..', '..', 'Contract_r')
output_folder = os.path.join('.', 'output')

SSAS_DSV_TableDef = collections.namedtuple('SSAS_DSV_TableDef', ['dsv_table_id', 'Name', 'FriendlyName', 'DbTableName', 'QueryDefinition', 'Columns'])
SSAS_DSV_ColumnDef = collections.namedtuple('SSAS_DSV_ColumnDef', ['dsv_column_id', 'dsv_table_id', 'Name', 'FriendlyName', 'DataType', 'Description', 'AllowNull', 'Length', 'DbColumnName'])
SSAS_DSV_ForeignKeyDef = collections.namedtuple('SSAS_DSV_ForeignKeyDef', ['Name', 'Parent', 'Child', 'ParentKey', 'ChildKey', 'Description'])

SSAS_DIM_TableDef = collections.namedtuple('SSAS_DIM_TableDef', ['dim_table_id', 'ID', 'Name', 'FileName', 'UnknownMember', 'UnknownMemberName', 'Columns', 'Type', 'ErrorConfiguration', 'Hierarchies'])
SSAS_DIM_ErrorConfigurationDef = collections.namedtuple('SSAS_DIM_ErrorConfigurationDef', ['dim_table_id', 'Name', 'Value'])
SSAS_DIM_ColumnDef = collections.namedtuple('SSAS_DIM_ColumnDef', ['dim_column_id', 'dim_table_id', 'ID', 'Name', 'Usage', 'OrderBy', 'IsKeyColumn', 'KeyColumns', 'NameColumn_DataType', 'NameColumn_DataSize', 'NameColumn_NullProcessing', 'NameColumn_TableName', 'NameColumn_ColumnName'])
SSAS_DIM_KeyColumnDef = collections.namedtuple('SSAS_DIM_KeyColumnDef', ['dim_column_id', 'sort_order', 'DataType', 'TableId', 'ColumnID'])
SSAS_DIM_HierarchyDef = collections.namedtuple('SSAS_DIM_HierarchyDef', ['dim_hierarchy_id', 'dim_table_id', 'sort_order', 'ID', 'Name', 'Levels'])
SSAS_DIM_LevelDef = collections.namedtuple('SSAS_DIM_LevelDef', ['dim_hierarchy_id', 'sort_order', 'ID', 'Name', 'ColumnName'])


def ParseDimensionFiles(folder_path, dimension_files: []):
    dim_table_id = 0
    dim_column_id = 0
    dim_hierarchy_id = 0
    dim_tables_asdict = collections.OrderedDict()
    for f in dimension_files:
        obj = untangle.parse(os.path.join(folder_path, f))

        dim_table_id += 1

        dim_table_def_asdict = collections.OrderedDict()
        dim_table_def_asdict['dim_table_id'] = dim_table_id
        dim_table_def_asdict['ID'] = obj.Dimension.ID.cdata
        dim_table_def_asdict['Name'] = obj.Dimension.Name.cdata
        dim_table_def_asdict['FileName'] = f
        dim_table_def_asdict['UnknownMember'] = obj.Dimension.UnknownMember.cdata if obj.Dimension.__hasattribute__('UnknownMember') else 'None'
        dim_table_def_asdict['UnknownMemberName'] = obj.Dimension.UnknownMemberName.cdata if obj.Dimension.__hasattribute__('UnknownMemberName') else None

        dim_columns_asdict = collections.OrderedDict()
        for c in obj.Dimension.Attributes.Attribute:
            dim_column_id += 1
            dim_column_def_asdict = collections.OrderedDict()
            dim_column_def_asdict['dim_column_id'] = dim_column_id
            dim_column_def_asdict['dim_table_id'] = dim_table_id
            dim_column_def_asdict['ID'] = c.ID.cdata
            dim_column_def_asdict['Name'] = c.Name.cdata
            dim_column_def_asdict['Usage'] = c.Usage.cdata if c.__hasattribute__('Usage') else 'Regular'
            dim_column_def_asdict['OrderBy'] = c.OrderBy.cdata if c.__hasattribute__('OrderBy') else 'Name'
            dim_column_def_asdict['IsKeyColumn'] =(1 if dim_column_def_asdict['Usage'] == 'Key' else 0)
            
            dim_keycolumns_def = []
            sort_order = 0
            for kc in c.KeyColumns.KeyColumn:
                sort_order += 1
                dim_keycolumn_def_asdict = collections.OrderedDict()
                dim_keycolumn_def_asdict['dim_column_id'] = dim_column_id
                dim_keycolumn_def_asdict['sort_order'] = sort_order
                dim_keycolumn_def_asdict['DataType'] = kc.DataType.cdata
                dim_keycolumn_def_asdict['TableID'] = kc.Source.TableID.cdata
                dim_keycolumn_def_asdict['ColumnID'] = kc.Source.ColumnID.cdata
                dim_keycolumns_def.append(dim_keycolumn_def_asdict)
            dim_column_def_asdict['KeyColumns'] = dim_keycolumns_def

            dim_column_def_asdict['NameColumn_DataType'] = None
            dim_column_def_asdict['NameColumn_DataSize'] = None
            dim_column_def_asdict['NameColumn_NullProcessing'] = None
            dim_column_def_asdict['NameColumn_TableName'] = None
            dim_column_def_asdict['NameColumn_ColumnName'] = None
            for nc in c.get_elements('NameColumn'):
                dim_column_def_asdict['NameColumn_DataType'] = nc.DataType.cdata if nc.__hasattribute__('DataType') else None
                dim_column_def_asdict['NameColumn_DataSize'] = nc.DataSize.cdata if nc.__hasattribute__('DataSize') else None
                dim_column_def_asdict['NameColumn_NullProcessing'] = nc.NullProcessing.cdata if nc.__hasattribute__('NullProcessing') else None
                dim_column_def_asdict['NameColumn_TableName'] = nc.Source.TableID.cdata
                dim_column_def_asdict['NameColumn_ColumnName'] = nc.Source.ColumnID.cdata
            
            dim_columns_asdict[ dim_column_def_asdict['ID'] ] = dim_column_def_asdict

        dim_table_def_asdict['Columns'] = dim_columns_asdict

        dim_column_def_asdict['Type'] = obj.Dimension.Type.cdata if obj.Dimension.__hasattribute__('Type') else None

        errorconfigs = []
        for ec in obj.Dimension.ErrorConfiguration.children:
            errorconfig = collections.OrderedDict()
            errorconfig['dim_table_id'] = dim_table_id
            errorconfig['Name'] = ec._name
            errorconfig['Value'] = ec.cdata
            errorconfigs.append(errorconfig)
        dim_table_def_asdict['ErrorConfiguration'] = errorconfigs

        hierarchies = []
        for hs in obj.Dimension.get_elements('Hierarchies'):
            h_sort_order = 0
            for h in hs.Hierarchy:
                h_sort_order += 1
                dim_hierarchy_id += 1
                dim_hierachy_def_asdict = collections.OrderedDict()
                dim_hierachy_def_asdict['dim_hierarchy_id'] = dim_hierarchy_id
                dim_hierachy_def_asdict['dim_table_id'] = dim_table_id
                dim_hierachy_def_asdict['sort_order'] = sort_order
                dim_hierachy_def_asdict['ID'] = h.ID.cdata
                dim_hierachy_def_asdict['Name'] = h.Name.cdata
                l_sort_order = 0
                levels = []
                for l in h.Levels.Level:
                    l_sort_order += 1
                    dim_level_def_asdict = collections.OrderedDict([('dim_hierarchy_id', dim_hierarchy_id), ('sort_order', sort_order), 
                        ('ID', l.ID.cdata), ('Name', l.Name.cdata), ('ColumnName', l.SourceAttributeID.cdata)])    
                    levels.append(dim_level_def_asdict)
                dim_hierachy_def_asdict['Levels'] = levels
                hierarchies.append(dim_hierachy_def_asdict)
        dim_table_def_asdict['Hierarchies'] = hierarchies

        dim_tables_asdict[f] = dim_table_def_asdict

    return dim_tables_asdict

dimension_files = [f for f in os.listdir(cube_visualstudio_path) if f.lower().endswith(r'.dim') and os.path.isfile(os.path.join(cube_visualstudio_path, f))]
dimension_files.sort()
#dimension_files = ['date.dim']

dim_tables_asdict = ParseDimensionFiles(cube_visualstudio_path, dimension_files)

obj = untangle.parse( os.path.join(cube_visualstudio_path, 'Carilion.dsv') ) 

primary_keys = {}
foreign_keys = []
foreign_keys_asdict = []
for xe in obj.DataSourceView.Schema.xs_schema.xs_annotation.xs_appinfo.msdata_Relationship:
    fkey = SSAS_DSV_ForeignKeyDef(Name=xe['name'], Parent=xe['msdata:parent'], Child=xe['msdata:child'], 
        ParentKey=xe['msdata:parentkey'], ChildKey=xe['msdata:childkey'], Description=xe['msprop:Description']
        )
    foreign_keys.append(fkey)
    foreign_keys_asdict.append(fkey._asdict())
    primary_keys[fkey.Parent] = fkey.ParentKey
    #print(fkey)

foreign_keys.sort(key=lambda x: x.Name)
foreign_keys_asdict.sort(key=lambda x: x['Name'])

tables = []
tables_asdict = []
dsv_table_id = 0
dsv_column_id = 0
for xe in obj.DataSourceView.Schema.xs_schema.xs_element.xs_complexType.xs_choice.xs_element:
    dsv_table_id += 1
    cols = []
    cols_asdict = []
    for xcol in xe.xs_complexType.xs_sequence.xs_element:
        xDescription = None
        xAllowNull = False
        xLength = -1
        xDataType = None
        if xcol.get_attribute('msprop:Description') != None:
            xdescription = xcol['msprop:Description']
        if xcol.get_attribute('minOccurs') != None:
            xAllowNull = True
        if xcol.get_attribute('type') != None:
            xDataType = xcol['type']
        else:
            xDataType = xcol.xs_simpleType.xs_restriction['base']
            xLength = int(xcol.xs_simpleType.xs_restriction.xs_maxLength['value'])
        # omit the leading "xs:"
        xDataType = xDataType[3:]

        dsv_column_id += 1
        col_def = SSAS_DSV_ColumnDef(dsv_column_id=dsv_column_id, dsv_table_id=dsv_table_id, Name=xcol['name'], 
            FriendlyName=xcol['msprop:FriendlyName'], DataType=xDataType, 
            Description=xDescription, AllowNull=xAllowNull, Length=xLength, DbColumnName=xcol['msprop:DbColumnName']
            )

        cols.append(col_def)
        cols_asdict.append(col_def._asdict())
        #print(col_def)

    tabdef = SSAS_DSV_TableDef(
        dsv_table_id=dsv_table_id, Name=xe['name'], FriendlyName=xe['msprop:FriendlyName'], DbTableName=xe['msprop:DbTableName'],
        QueryDefinition=xe['msprop:QueryDefinition'], Columns=cols
        )
    tabdef_asdict = SSAS_DSV_TableDef(
        dsv_table_id=dsv_table_id, Name=tabdef.Name, FriendlyName=tabdef.FriendlyName, DbTableName=tabdef.DbTableName,
        QueryDefinition=tabdef.QueryDefinition, Columns=cols_asdict
        )
    tables.append(tabdef)
    tables_asdict.append(tabdef_asdict._asdict())
    #print(tabdef)
tables.sort(key=lambda x: x.FriendlyName)
tables_asdict.sort(key=lambda x: x['FriendlyName'])
# tables.sort(key=lambda x: x.Name)
# tables_asdict.sort(key=lambda x: x['Name'])


with open(os.path.join(output_folder, 'tables.json'), 'w') as f:
    json.dump(tables_asdict, fp=f, indent=4)

with open(os.path.join(output_folder, 'dimensions.json'), 'w') as f:
    json.dump(dim_tables_asdict, fp=f, indent=4)

with open(os.path.join(output_folder, 'foreignkeys.json'), 'w') as f:
    json.dump(foreign_keys_asdict, fp=f, indent=4)


datatypes = set()
for t in tables:
    for c in t.Columns:
        datatypes.add(c.DataType)
datatypes = list(datatypes)
datatypes.sort()
with open(os.path.join(output_folder, 'datatypes.txt'), 'w') as f:
    f.write('\n'.join(datatypes))


def GetFriendlyTableName(o):
    if isinstance(o, str):
        if create_tables_using_friendly_names:
            for t in tables:
                if o == t.Name:
                    return t.FriendlyName
            raise Exception(str.format('Could not find table with name [{0}]', o))
        else:
            return o
    elif isinstance(o, SSAS_DSV_TableDef):
        if create_tables_using_friendly_names:
            return o.FriendlyName
        else:
            return t.Name
    print('=======================ERROR=======================')
    print(o)
    print('=======================ERROR=======================')
    raise Exception(str.format('Unhandled object type [{0}] type [{1}]', o, type(o)))
        

def encode_ssas_datatype_to_sql(c):
    '''
    Map the SSAS data types to the SQL data types.
    Based on the data type currently in use.
    '''
    if c.DataType == 'boolean':
        return 'bit'
    elif c.DataType == 'dateTime':
        return 'datetime'
    elif c.DataType == 'decimal':
        return 'numeric(18,2)'
    elif c.DataType == 'double':
        return 'float'
    elif c.DataType == 'duration':
        return 'time(0)'
    elif c.DataType == 'int':
        return 'int'
    elif c.DataType == 'long':
        return 'bigint'
    elif c.DataType == 'currency':
        return 'money'
    elif c.DataType == 'short':
        return 'smallint'
    elif c.DataType == 'unsignedByte':
        return 'tinyint'
    elif c.DataType == 'string':
        return str.format('varchar({0})', c.Length)
    else:
        raise Exception(str.format('Unhandled data type [{0}]. Needs to be mapped to a SQL data type.', c.DataType))

def IsIdentityColumn(c, primary_key_column_name):
    if c.DbColumnName == primary_key_column_name and c.DataType in ['long', 'int', 'short', 'unsignedByte']:
        return True
    else:
        return False

#Build SQL create statements
sql_drop_tables = []
sql_drop_tables.append('use carilion_dw')
sql_drop_tables.append('go')
sql_drop_tables.append('\n\n\n')
sql_drop_tables.append('-- drop all foreign keys')
sql_drop_tables.append('exec dbo.usp_DropAllForeignKeyConstraints')
sql_drop_tables.append('\n\n\n')
sql_drop_tables.append('-- drop table statements')
for t in tables:
    sql_drop_tables.append(str.format("drop table if exists {0}", GetFriendlyTableName(t.Name)))


sql_create_tables = []
sql_create_tables.append('use carilion_dw')
sql_create_tables.append('go')
sql_create_tables.append('\n\n\n')
sql_create_tables.append('-- create table statements')
for t in tables:
    # if 'LabTestFact' in [t.Name, t.FriendlyName]:
    #     print('break')
    if t.Name in primary_keys.keys():
        primary_key_column_name = primary_keys[t.Name]
    else:
        primary_key_column_name = None        
    sql_create_tables.append(str.format("create table {0}(", GetFriendlyTableName(t.Name)))
    for c in t.Columns:
        sql_create_tables.append(str.format("\t{0.DbColumnName} {1} {2} {3} null,", 
            c,
            encode_ssas_datatype_to_sql(c),
            'identity(1,1)' if IsIdentityColumn(c, primary_key_column_name) else '',
            'not' if not c.AllowNull or IsIdentityColumn(c, primary_key_column_name) else ''
            ))
    if primary_key_column_name != None:
        sql_create_tables.append(str.format('\tCONSTRAINT PK_{0}_{1} PRIMARY KEY CLUSTERED ({1})', GetFriendlyTableName(t.Name), primary_key_column_name))
        stats_num_primary_keys += 1
    sql_create_tables.append(');\n\n')


sql_add_fkeys = []
sql_add_fkeys.append('use carilion_dw')
sql_add_fkeys.append('go')
sql_add_fkeys.append('\n\n\n')
sql_add_fkeys.append('-- drop all foreign keys')
sql_add_fkeys.append('exec dbo.usp_DropAllForeignKeyConstraints')
sql_add_fkeys.append('\n\n\n')
sql_add_fkeys.append('-- add foreign keys')
for fk in foreign_keys:
    if fk.Parent in primary_keys.keys() and fk.ParentKey == primary_keys[fk.Parent]:
        sql_add_fkeys.append(str.format("ALTER TABLE {1} ADD CONSTRAINT [{0.Name}] FOREIGN KEY ({0.ChildKey}) "
            "REFERENCES {2} ({0.ParentKey});", fk, GetFriendlyTableName(fk.Child), GetFriendlyTableName(fk.Parent)))


foreign_keys.sort(key=lambda fk: (GetFriendlyTableName(fk.Parent), fk.ParentKey, GetFriendlyTableName(fk.Child), fk.ChildKey))
sql_update = []
sql_update.append('use carilion_dw')
sql_update.append('go')
sql_update.append('\n\n\n')
sql_update.append('-- fix foreign keys that are not mapped to the primary key')
for fk in foreign_keys:
    #if fk.Parent in primary_keys.keys() and fk.ParentKey != primary_keys[fk.Parent]:
    sql_update.append(str.format("exec dbo.usp_FixForeignKeys '{0}', '{1}', '{2}', '{3}', '{4}', '{5}'", 
        'dbo', GetFriendlyTableName(fk.Parent), fk.ParentKey, 'dbo', GetFriendlyTableName(fk.Child), fk.ChildKey))
sql_update.append('\n\n\n')


with open(os.path.join(output_folder, 'drop_tables.sql'), 'w') as f:
    for s in sql_drop_tables:
        f.write(s + '\n')

with open(os.path.join(output_folder, 'create_src_tables.sql'), 'w') as f:
    for s in sql_create_tables:
        f.write(s + '\n')

with open(os.path.join(output_folder, 'add_foreign_keys.sql'), 'w') as f:
    for s in sql_add_fkeys:
        f.write(s + '\n')

with open(os.path.join(output_folder, 'fix_foreign_keys.sql'), 'w') as f:
    for s in sql_update:
        f.write(s + '\n')


stats_num_tables = len(tables)
stats_num_columns = sum([len(t.Columns) for t in tables])
stats_num_foreign_keys = len(foreign_keys)
stats_sql_lines_drop_tables = len(sql_drop_tables)
stats_sql_lines_create_tables = len(sql_create_tables)
stats_sql_lines_add_foreign_keys = len(sql_add_fkeys)


with open(os.path.join(output_folder, 'stats.txt'), 'w') as f:
    f.write(str.format('{0}: {1}\n', 'stats_num_tables', stats_num_tables))
    f.write(str.format('{0}: {1}\n', 'stats_num_columns', stats_num_columns))
    f.write(str.format('{0}: {1}\n', 'stats_num_foreign_keys', stats_num_foreign_keys))
    f.write(str.format('{0}: {1}\n', 'stats_num_primary_keys', stats_num_primary_keys))
    f.write(str.format('{0}: {1}\n', 'stats_sql_lines_drop_tables', stats_sql_lines_drop_tables))
    f.write(str.format('{0}: {1}\n', 'stats_sql_lines_create_tables', stats_sql_lines_create_tables))
    f.write(str.format('{0}: {1}\n', 'stats_sql_lines_add_foreign_keys', stats_sql_lines_add_foreign_keys))


class SqlDictWriter:
    _is_first = True
    _dictwriter = None
    _f = None
    _dialect = None
    _membuf = None
    _lineterminator = '\n'

    def __init__(self, f, fieldnames, restval="", extrasaction="raise",
                 dialect="excel", *args, **kwds):
        self._membuf = io.StringIO()
        self._dictwriter = csv.DictWriter(self._membuf, fieldnames, restval, extrasaction, dialect, *args, **kwds)
        self._f = f
        self._dialect = csv.get_dialect(dialect)

    def writeheader(self, table_name):
        header = str.format('truncate table {0}{1}', table_name, self._lineterminator)
        self._f.write(header)

        header = str.format('insert into {0}({1}) values{2}', 
            table_name, 
            ', '.join(['[' + x + ']' for x in self._dictwriter.fieldnames]),
            self._lineterminator
            )
        self._f.write(header)

    def writerow(self, rowdict):
        self._membuf.seek(io.SEEK_SET)
        self._membuf.truncate()
        self._dictwriter.writerow(rowdict)
        if self._is_first:
            self._f.write('(' + self._membuf.getvalue() + ')' + self._lineterminator)
        else:
            self._f.write(',(' + self._membuf.getvalue() + ')' + self._lineterminator)
        self._is_first = False


csv.register_dialect('sql_values', 
    delimiter = ',',
    skipinitialspace = 0,
    doublequote = 1,
    quoting = csv.QUOTE_NONNUMERIC,
    quotechar = "'",
    lineterminator = '',
    escapechar = None
    )


def WriteToCsvSql_DimensionTables_Helper(dim_tables_asdict, 
    ftables, ferror_configs, fcolumns, fkey_columns, fhierarchies, flevels, 
    ftables_sql, ferror_configs_sql, fcolumns_sql, fkey_columns_sql, fhierarchies_sql, flevels_sql
    ):

    fields = enumerable_diffs(SSAS_DIM_TableDef._fields, ['Columns', 'ErrorConfiguration', 'Hierarchies'])
    csv_tables = csv.DictWriter(ftables, fields, extrasaction='ignore', dialect=csv.unix_dialect)
    csv_tables.writeheader()
    sql_tables = SqlDictWriter(ftables_sql, fields, extrasaction='ignore', dialect='sql_values')
    sql_tables.writeheader('[dbo].[tblVS_dim_tables]')
    
    fields = SSAS_DIM_ErrorConfigurationDef._fields
    csv_error_configs = csv.DictWriter(ferror_configs, fields, extrasaction='ignore', dialect=csv.unix_dialect)
    csv_error_configs.writeheader()
    sql_error_configs = SqlDictWriter(ferror_configs_sql, fields, extrasaction='ignore', dialect='sql_values')
    sql_error_configs.writeheader('[dbo].[tblVS_dim_error_configs]')
    
    fields = enumerable_diffs(SSAS_DIM_ColumnDef._fields, ['KeyColumns'])
    csv_columns = csv.DictWriter(fcolumns, fields, extrasaction='ignore', dialect=csv.unix_dialect)
    csv_columns.writeheader()
    sql_columns = SqlDictWriter(fcolumns_sql, fields, extrasaction='ignore', dialect='sql_values')
    sql_columns.writeheader('[dbo].[tblVS_dim_columns]')
    
    fields = SSAS_DIM_KeyColumnDef._fields
    csv_key_columns = csv.DictWriter(fkey_columns, fields, extrasaction='ignore', dialect=csv.unix_dialect)
    csv_key_columns.writeheader()
    sql_key_columns = SqlDictWriter(fkey_columns_sql, fields, extrasaction='ignore', dialect='sql_values')
    sql_key_columns.writeheader('[dbo].[tblVS_dim_key_columns]')
    
    fields = enumerable_diffs(SSAS_DIM_HierarchyDef._fields, ['Levels'])
    csv_hierarchies = csv.DictWriter(fhierarchies, fields, extrasaction='ignore', dialect=csv.unix_dialect)
    csv_hierarchies.writeheader()
    sql_hierarchies = SqlDictWriter(fhierarchies_sql, fields, extrasaction='ignore', dialect='sql_values')
    sql_hierarchies.writeheader('[dbo].[tblVS_dim_hierarchies]')
    
    fields = SSAS_DIM_LevelDef._fields
    csv_levels = csv.DictWriter(flevels, fields, extrasaction='ignore', dialect=csv.unix_dialect)
    csv_levels.writeheader()
    sql_levels = SqlDictWriter(flevels_sql, fields, extrasaction='ignore', dialect='sql_values')
    sql_levels.writeheader('[dbo].[tblVS_dim_levels]')


    for tk, tv in dim_tables_asdict.items():
        csv_tables.writerow(tv)
        sql_tables.writerow(tv)

        for ec in tv['ErrorConfiguration']:
            csv_error_configs.writerow(ec)
            sql_error_configs.writerow(ec)

        for ck, cv in tv['Columns'].items():
            csv_columns.writerow(cv)
            sql_columns.writerow(cv)
            for k in cv['KeyColumns']:
                csv_key_columns.writerow(k)
                sql_key_columns.writerow(k)
        
        for h in tv['Hierarchies']:
            csv_hierarchies.writerow(h)
            sql_hierarchies.writerow(h)
            for l in h['Levels']:
                csv_levels.writerow(l)
                sql_levels.writerow(l)


def WriteToCsv_DimensionTables(dim_tables_asdict, output_folder):
    with open(os.path.join(output_folder, 'dim_tables.csv'), 'w') as ftables:
        with open(os.path.join(output_folder, 'dim_error_configs.csv'), 'w') as ferror_configs:
            with open(os.path.join(output_folder, 'dim_columns.csv'), 'w') as fcolumns:
                with open(os.path.join(output_folder, 'dim_key_columns.csv'), 'w') as fkey_columns:
                    with open(os.path.join(output_folder, 'dim_hierarchies.csv'), 'w') as fhierarchies:
                        with open(os.path.join(output_folder, 'dim_levels.csv'), 'w') as flevels:

                            with open(os.path.join(output_folder, 'dim_tables.sql'), 'w') as ftables_sql:
                                with open(os.path.join(output_folder, 'dim_error_configs.sql'), 'w') as ferror_configs_sql:
                                    with open(os.path.join(output_folder, 'dim_columns.sql'), 'w') as fcolumns_sql:
                                        with open(os.path.join(output_folder, 'dim_key_columns.sql'), 'w') as fkey_columns_sql:
                                            with open(os.path.join(output_folder, 'dim_hierarchies.sql'), 'w') as fhierarchies_sql:
                                                with open(os.path.join(output_folder, 'dim_levels.sql'), 'w') as flevels_sql:

                                                     WriteToCsvSql_DimensionTables_Helper(dim_tables_asdict, 
                                                        ftables, ferror_configs, fcolumns, fkey_columns, fhierarchies, flevels, 
                                                        ftables_sql, ferror_configs_sql, fcolumns_sql, fkey_columns_sql, fhierarchies_sql, flevels_sql
                                                        )


WriteToCsv_DimensionTables(dim_tables_asdict, output_folder)


def WriteToCsv_DsvTables_Helper(tables_asdict, foreign_keys_asdict, csv_tables, csv_columns, csv_foreign_keys):
    for fk in foreign_keys_asdict:
        csv_foreign_keys.writerow(fk)

    for t in tables_asdict:
        csv_tables.writerow(t)
        for c in t['Columns']:
            csv_columns.writerow(c)


def WriteToCsv_DsvTables(tables_asdict, foreign_keys_asdict, output_folder):
    with open(os.path.join(output_folder, 'dsv_tables.csv'), 'w') as ftables:
        with open(os.path.join(output_folder, 'dsv_columns.csv'), 'w') as fcolumns:
            with open(os.path.join(output_folder, 'dsv_foreign_keys.csv'), 'w') as fforeign_keys:
                fields = enumerable_diffs(SSAS_DSV_TableDef._fields, ['Columns'])
                csv_tables = csv.DictWriter(ftables, fields, extrasaction='ignore', dialect=csv.unix_dialect)
                csv_tables.writeheader()
                
                fields = SSAS_DSV_ColumnDef._fields
                csv_columns = csv.DictWriter(fcolumns, fields, extrasaction='ignore', dialect=csv.unix_dialect)
                csv_columns.writeheader()
                
                fields = SSAS_DSV_ForeignKeyDef._fields
                csv_foreign_keys = csv.DictWriter(fforeign_keys, fields, extrasaction='ignore', dialect=csv.unix_dialect)
                csv_foreign_keys.writeheader()

                WriteToCsv_DsvTables_Helper(tables_asdict, foreign_keys_asdict, csv_tables, csv_columns, csv_foreign_keys)


WriteToCsv_DsvTables(tables_asdict, foreign_keys_asdict, output_folder)


