import untangle
import collections
import json

create_tables_using_friendly_names = True
stats_num_tables = None
stats_num_columns = None
stats_num_foreign_keys = None
stats_num_primary_keys = 0
stats_sql_lines_drop_tables = None
stats_sql_lines_create_tables = None
stats_sql_lines_add_foreign_keys = None



obj = untangle.parse(r'..\..\Contract_r\Carilion.dsv')

SSAS_DSV_TableDef = collections.namedtuple('SSAS_DSV_TableDef', ['Name', 'FriendlyName', 'DbTableName', 'QueryDefinition', 'Columns'])
SSAS_DSV_ColumnDef = collections.namedtuple('SSAS_DSV_ColumnDef', ['Name', 'FriendlyName', 'DataType', 'Description', 'AllowNull', 'Length', 'DbColumnName'])
SSAS_DSV_ForeignKeyDef = collections.namedtuple('SSAS_DSV_ForeignKeyDef', ['Name', 'Parent', 'Child', 'ParentKey', 'ChildKey', 'Description'])

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
for xe in obj.DataSourceView.Schema.xs_schema.xs_element.xs_complexType.xs_choice.xs_element:
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

        col_def = SSAS_DSV_ColumnDef(Name=xcol['name'], FriendlyName=xcol['msprop:FriendlyName'], DataType=xDataType, 
            Description=xDescription, AllowNull=xAllowNull, Length=xLength, DbColumnName=xcol['msprop:DbColumnName']
            )

        cols.append(col_def)
        cols_asdict.append(col_def._asdict())
        #print(col_def)

    tabdef = SSAS_DSV_TableDef(
        Name=xe['name'], FriendlyName=xe['msprop:FriendlyName'], DbTableName=xe['msprop:DbTableName'],
        QueryDefinition=xe['msprop:QueryDefinition'], Columns=cols
        )
    tabdef_asdict = SSAS_DSV_TableDef(
        Name=tabdef.Name, FriendlyName=tabdef.FriendlyName, DbTableName=tabdef.DbTableName,
        QueryDefinition=tabdef.QueryDefinition, Columns=cols_asdict
        )
    tables.append(tabdef)
    tables_asdict.append(tabdef_asdict._asdict())
    #print(tabdef)
tables.sort(key=lambda x: x.FriendlyName)
tables_asdict.sort(key=lambda x: x['FriendlyName'])
# tables.sort(key=lambda x: x.Name)
# tables_asdict.sort(key=lambda x: x['Name'])


with open('./output/tables.json', 'w') as f:
    json.dump(tables_asdict, fp=f, indent=4)

with open('./output/foreignkeys.json', 'w') as f:
    json.dump(foreign_keys_asdict, fp=f, indent=4)


datatypes = set()
for t in tables:
    for c in t.Columns:
        datatypes.add(c.DataType)
datatypes = list(datatypes)
datatypes.sort()
with open('./output/datatypes.txt', 'w') as f:
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


sql_update = []
sql_update.append('use carilion_dw')
sql_update.append('go')
sql_update.append('\n\n\n')
sql_update.append('-- fix foreign keys that are not mapped to the primary key')
for fk in foreign_keys:
    if fk.Parent in primary_keys.keys() and fk.ParentKey != primary_keys[fk.Parent]:
        # sql_update.append(str.format("ALTER TABLE {1} ADD CONSTRAINT [{0.Name}] FOREIGN KEY ({0.ChildKey}) "
        #     "REFERENCES {2} ({0.ParentKey});", fk, GetFriendlyTableName(fk.Child), GetFriendlyTableName(fk.Parent)))
        print('')


with open('./output/drop_tables.sql', 'w') as f:
    for s in sql_drop_tables:
        f.write(s + '\n')

with open('./output/create_src_tables.sql', 'w') as f:
    for s in sql_create_tables:
        f.write(s + '\n')

with open('./output/add_foreign_keys.sql', 'w') as f:
    for s in sql_add_fkeys:
        f.write(s + '\n')


stats_num_tables = len(tables)
stats_num_columns = sum([len(t.Columns) for t in tables])
stats_num_foreign_keys = len(foreign_keys)
stats_sql_lines_drop_tables = len(sql_drop_tables)
stats_sql_lines_create_tables = len(sql_create_tables)
stats_sql_lines_add_foreign_keys = len(sql_add_fkeys)


with open('./output/stats.txt', 'w') as f:
    f.write(str.format('{0}: {1}\n', 'stats_num_tables', stats_num_tables))
    f.write(str.format('{0}: {1}\n', 'stats_num_columns', stats_num_columns))
    f.write(str.format('{0}: {1}\n', 'stats_num_foreign_keys', stats_num_foreign_keys))
    f.write(str.format('{0}: {1}\n', 'stats_num_primary_keys', stats_num_primary_keys))
    f.write(str.format('{0}: {1}\n', 'stats_sql_lines_drop_tables', stats_sql_lines_drop_tables))
    f.write(str.format('{0}: {1}\n', 'stats_sql_lines_create_tables', stats_sql_lines_create_tables))
    f.write(str.format('{0}: {1}\n', 'stats_sql_lines_add_foreign_keys', stats_sql_lines_add_foreign_keys))

