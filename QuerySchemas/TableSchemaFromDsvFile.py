import untangle
import collections

obj = untangle.parse(r'C:\_car\CarilionCube\ContractCube\Carilion.dsv')

SSAS_DSV_TableDef = collections.namedtuple('SSAS_DSV_TableDef', ['name', 'FriendlyName', 'DbTableName', 'QueryDefinition', 'columns'])

tables = []
for xe in obj.DataSourceView.Schema.xs_schema.xs_element.xs_complexType.xs_choice.xs_element:
    tabdef = SSAS_DSV_TableDef(
        name=xe['name'], FriendlyName=xe['msprop:FriendlyName'], DbTableName=xe['msprop:DbTableName'],
        QueryDefinition=xe['msprop:QueryDefinition'], columns=None
        )
    for xcols in xe.xs_complexType.xs_sequence.xs_element:
        print(xcols)

    print(tabdef)








