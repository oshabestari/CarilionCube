import untangle
import collections

obj = untangle.parse(r'C:\_car\CarilionCube\ContractCube\Carilion.dsv')

SSAS_DSV_TableDef = collections.namedtuple('SSAS_DSV_TableDef', ['name', 'FriendlyName', 'DbTableName', 'QueryDefinition', 'columns'])
SSAS_DSV_ColumnDef = collections.namedtuple('SSAS_DSV_ColumnDef', ['name', 'FriendlyName', 'DataType', 'Description', 'AllowNull', 'Length', 'DbColumnName'])

tables = []
for xe in obj.DataSourceView.Schema.xs_schema.xs_element.xs_complexType.xs_choice.xs_element:
    cols = []
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

        col_def = SSAS_DSV_ColumnDef(name=xcol['name'], FriendlyName=xcol['msprop:FriendlyName'], DataType=xDataType, 
            Description=xDescription, AllowNull=xAllowNull, Length=xLength, DbColumnName=xcol['msprop:DbColumnName']
            )

        cols.append(col_def)
        #print(col_def)

    tabdef = SSAS_DSV_TableDef(
        name=xe['name'], FriendlyName=xe['msprop:FriendlyName'], DbTableName=xe['msprop:DbTableName'],
        QueryDefinition=xe['msprop:QueryDefinition'], columns=cols
        )


    print(tabdef)








