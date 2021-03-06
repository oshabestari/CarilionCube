SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view dbo.VisualStudioMetadataFromDimensions
as
--    select * from dbo.VisualStudioMetadataFromDimensions

select
     t_dim.dim_table_id                 as dim_table_id              
    ,t_dim.FileName                     as TableFileName                  
    ,t_dim.ID                           as TableID                        
    ,t_dim.Name                         as TableName                      
    ,t_dim.Type                         as TableType                      
    ,t_dim.UnknownMember                as UnknownMember             
    ,t_dim.UnknownMemberName            as UnknownMemberName         
    ,c_dim.dim_column_id                as dim_column_id             
    ,c_dim.ID                           as ColumnID                        
    ,c_dim.IsKeyColumn                  as IsKeyColumn               
    ,c_dim.Name                         as ColumnName                      
    ,c_dim.NameColumn_ColumnName        as NameColumn_ColumnName     
    ,c_dim.NameColumn_DataSize          as NameColumn_DataSize       
    ,c_dim.NameColumn_DataType          as NameColumn_DataType       
    ,c_dim.NameColumn_NullProcessing    as NameColumn_NullProcessing 
    ,c_dim.OrderBy                      as ColumnOrderBy                   
    ,c_dim.Usage                        as ColumnUsage    
    ,ec_dim.dim_error_config_id         as dim_error_config_id
    ,ec_dim.Name                        as ErrorConfigName
    ,ec_dim.Value                       as ErrorConfigValue
    ,h_dim.dim_hierarchy_id             as dim_hierarchy_id
    ,h_dim.ID                           as HierarchyID
    ,h_dim.Name                         as HierarchyName
    ,h_dim.sort_order                   as HierarchySortOrder
    ,l_dim.dim_level_id                 as dim_level_id
    ,l_dim.ColumnName                   as LevelColumnName
    ,l_dim.ID                           as LevelID
    ,l_dim.Name                         as LevelName
    ,l_dim.sort_order                   as LevelSortOrder
    ,kc_dim.dim_key_column_id           as dim_key_column_id
    ,kc_dim.ColumnID                    as KeyColumnColumnID
    ,kc_dim.DataType                    as KeyColumnDataType
    ,kc_dim.sort_order                  as KeyColumnSortOrder
    ,kc_dim.TableId                     as KeyColumnTableId
from
    dbo.tblVS_dim_tables t_dim
    
    left join dbo.tblVS_dim_columns c_dim
        on t_dim.dim_table_id = c_dim.dim_table_id

    left join dbo.tblVS_dim_error_configs ec_dim
        on t_dim.dim_table_id = ec_dim.dim_table_id 

    left join dbo.tblVS_dim_hierarchies h_dim
        on t_dim.dim_table_id = h_dim.dim_table_id

    left join dbo.tblVS_dim_levels l_dim
        on h_dim.dim_hierarchy_id = l_dim.dim_hierarchy_id

    left join dbo.tblVS_dim_key_columns kc_dim
        on c_dim.dim_column_id = kc_dim.dim_column_id
GO
