import untangle
import collections
import json

obj = untangle.parse(r'C:\_car\CarilionCube\ContractCube\Carilion.dsv')

SSAS_DSV_TableDef = collections.namedtuple('SSAS_DSV_TableDef', ['Name', 'FriendlyName', 'DbTableName', 'QueryDefinition', 'Columns'])
SSAS_DSV_ColumnDef = collections.namedtuple('SSAS_DSV_ColumnDef', ['Name', 'FriendlyName', 'DataType', 'Description', 'AllowNull', 'Length', 'DbColumnName'])
SSAS_DSV_ForeignKeyDef = collections.namedtuple('SSAS_DSV_ForeignKeyDef', ['Name', 'Parent', 'Child', 'ParentKey', 'ChildKey', 'Description'])

foreign_keys = []
foreign_keys_asdict = []
for xe in obj.DataSourceView.Schema.xs_schema.xs_annotation.xs_appinfo.msdata_Relationship:
    fkey = SSAS_DSV_ForeignKeyDef(Name=xe['name'], Parent=xe['msdata:parent'], Child=xe['msdata:child'], 
        ParentKey=xe['msdata:parentkey'], ChildKey=xe['msdata:childkey'], Description=xe['msprop:Description']
        )
    foreign_keys.append(fkey)
    foreign_keys_asdict.append(fkey._asdict())
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
tables.sort(key=lambda x: x.Name)
tables_asdict.sort(key=lambda x: x['Name'])


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

def encode_ssas_datatype_to_sql(c):
    return ''

#Build SQL create statements
sql = []
for t in tables:
    sql.append(str.format("drop table if exists {0.Name}", t))
sql.append('\n\n\n')

for t in tables:
    sql.append(str.format("create table {0.Name}(", t))
    for c in t.Columns:
        sql.append(str.format("\t{0.DbColumnName} {1} {2} null,", 
            c,
            'null' if c.AllowNull else '',
            encode_ssas_datatype_to_sql(c)
            ))
    sql.append('\n\n\n')




