SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE proc dbo.usp_Cube_Metadata_NamesWithTooManySpaces
as


set nocount on


declare @union_all varchar(max) = 
'

union

'


declare @template varchar(max) = 
'
<<union_all>>
select distinct
    --''<<table_name>>'' as table_name
    --,''<<column_name>>'' as column_name
    cast([<<column_name>>] as varchar(max)) as duplicate_spaces
    ,replace(replace(replace(cast([<<column_name>>] as varchar(max)), ''  '', '' ''), ''  '', '' ''), ''  '', '' '') as single_space
from
    dbo.<<table_name>>
where
    [<<column_name>>] like ''%  %''
'
   

select
    REPLACE(REPLACE(REPLACE(@template, '<<table_name>>', c.table_name),
         '<<column_name>>', c.COLUMN_NAME), 
         '<<union_all>>', IIF(row_number() over(order by c.table_name, c.column_name) = 1, '', @union_all))
    --*
from
    information_schema.columns c
where
    c.TABLE_NAME like 'tbl%'
    and (
        c.COLUMN_NAME like '%name'
        or c.COLUMN_NAME like '%caption'
    )
    and c.COLUMN_NAME not like '%unique%'
    and c.COLUMN_NAME not like '%\_sql\_%' escape '\'


print ''
print 'order by 1'

GO
