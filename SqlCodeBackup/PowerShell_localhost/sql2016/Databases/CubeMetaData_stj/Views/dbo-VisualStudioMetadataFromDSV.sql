SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE view dbo.VisualStudioMetadataFromDSV
as
--    select * from dbo.VisualStudioMetadataFromDSV

select
     t_dsv.dsv_table_id     as dsv_table_id
    ,c_dsv.dsv_column_id    as dsv_column_id
    ,t_dsv.DbTableName      as DbTableName
    ,t_dsv.FriendlyName     as TableFriendlyName
    ,t_dsv.Name             as TableName
    ,t_dsv.QueryDefinition  as TableQueryDefinition
    ,c_dsv.AllowNull        as ColumnAllowNull
    ,c_dsv.DataType         as ColumnDataType
    ,c_dsv.DbColumnName     as DbColumnName
    ,c_dsv.Description      as ColumnDescription
    ,c_dsv.FriendlyName     as ColumnFriendlyName
    ,c_dsv.Length           as ColumnLength
    ,c_dsv.Name             as ColumnName
from
    [dbo].[tblVS_dsv_tables] t_dsv
    
    left join [dbo].[tblVS_dsv_columns] c_dsv
        on t_dsv.dsv_table_id = c_dsv.dsv_table_id
GO
