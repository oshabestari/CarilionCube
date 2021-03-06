SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO












CREATE VIEW [dbo].[Cube_Usage_Between_Dimensions_And_Facts]
AS
--    select * from dbo.Cube_Usage_Between_Dimensions_And_Facts
--
--    drop table dbo.tblCube_Usage_Between_Dimensions_And_Facts
--    select * into dbo.tblCube_Usage_Between_Dimensions_And_Facts from dbo.Cube_Usage_Between_Dimensions_And_Facts
SELECT
     cube_name                                  = mg.[cube_name]
    ,measuregroup_name                          = mg.measuregroup_name
    ,measure_display_folder                     = mg.measure_display_folder
    ,measure_name                               = mg.measure_name
    ,measure_unique_name                        = mg.measure_unique_name
    ,measure_caption                            = mg.measure_caption
    ,measure_is_visible                         = mg.measure_is_visible
    ,type_name                                  = ISNULL(dt.[type_name], 'not_specified')
    ,measure_aggregator_name                    = magg.measure_aggregator_name
    ,expression                                 = mg.expression
    ,default_format_string                      = mg.default_format_string
    ,does_measure_caption_match_measure_name    = IIF(mg.measure_caption = mg.measure_name, 1, 0)
    ,measuregroup_cardinality                   = mg_vs_d.measuregroup_cardinality
    ,dimension_unique_name                      = mg_vs_d.dimension_unique_name
    ,dimension_granularity                      = mg_vs_d.dimension_granularity
    ,dimension_cardinality                      = mg_vs_d.dimension_cardinality
    ,dimension_is_visible                       = mg_vs_d.dimension_is_visible
    ,dimension_is_fact_dimension                = mg_vs_d.dimension_is_fact_dimension
    ,hierarchy_name                             = h.hierarchy_name
    ,hierarchy_unique_name                      = h.hierarchy_unique_name
    ,hierarchy_caption                          = h.hierarchy_caption
    ,dimension_type_name                        = ISNULL(dimty.dimension_type_name, 'unknown')
    ,hierarchy_cardinality                      = h.hierarchy_cardinality
    ,default_member                             = h.default_member
    ,all_member                                 = h.all_member
    ,hierarchy_ordinal                          = h.hierarchy_ordinal
    ,dimension_is_shared                        = h.dimension_is_shared
    ,hierarchy_is_visible                       = h.hierarchy_is_visible
    ,hierarchy_origin                           = h.hierarchy_origin
    ,hierarchy_display_folder                   = h.hierarchy_display_folder
    ,dimension_name                             = d.dimension_name
    ,dimension_caption                          = d.dimension_caption
    ,default_hierarchy                          = d.default_hierarchy
    ,description                                = d.description
    ,dimension_master_name                      = d.dimension_master_name
    ,dimension_ordinal                          = d.dimension_ordinal
    ,dimension_type                             = d.dimension_type
    ,dimension_is_virtual                       = d.is_virtual
    ,dimension_is_readwrite                     = d.is_readwrite
    ,dimension_unique_settings                  = d.dimension_unique_settings
    ,level_name                                 = l.level_name
    ,level_unique_name                          = l.level_unique_name
    ,level_caption                              = l.level_caption
    ,level_ordering_property                    = l.level_ordering_property
    ,level_description                          = l.description
    ,level_master_unique_name                   = l.level_master_unique_name
    ,level_name_sql_column_name                 = l.level_name_sql_column_name
    ,level_key_sql_column_name                  = l.level_key_sql_column_name
    ,level_unique_name_sql_column_name          = l.level_unique_name_sql_column_name
    ,level_attribute_hierarchy_name             = l.level_attribute_hierarchy_name
    ,level_type_name                            = l.level_type_name
    ,custom_rollup_settings_name                = l.custom_rollup_settings_name
    ,level_unique_settings_name                 = l.level_unique_settings_name
    ,level_origin_name                          = l.level_origin_name
    ,level_number                               = l.level_number
    ,level_cardinality                          = l.level_cardinality
    ,level_type                                 = l.level_type
    ,custom_rollup_settings                     = l.custom_rollup_settings
    ,level_unique_settings                      = l.level_unique_settings
    ,level_is_visible                           = l.level_is_visible
    ,level_dbtype                               = l.level_dbtype
    ,level_key_cardinality                      = l.level_key_cardinality
    ,level_origin                               = l.level_origin
FROM 
    dbo.tblCube_Measure_Group_vs_Dimensions mg_vs_d
    
    LEFT JOIN dbo.tblCube_Measure_Groups mg
        ON mg.cube_name = mg_vs_d.cube_name
            AND mg.measuregroup_name = mg_vs_d.measuregroup_name

    LEFT JOIN dbo.tblCube_Dimensions d
        ON d.cube_name = mg_vs_d.cube_name
            AND d.dimension_unique_name = mg_vs_d.dimension_unique_name

    LEFT JOIN dbo.tblCube_Hierarchies h
        ON h.cube_name = d.cube_name
            AND h.dimension_unique_name = d.dimension_unique_name

    LEFT JOIN dbo.tblCube_Measure_Aggregator magg
        ON mg.measure_aggregator = magg.measure_aggregator
    
    LEFT JOIN dbo.tblCube_Data_Types dt
        ON mg.data_type = dt.DATA_TYPE

    LEFT JOIN dbo.tblCube_Dimension_Type dimty
        ON d.dimension_type = dimty.dimension_type

    LEFT JOIN dbo.tblCube_Levels l
        ON l.cube_name = h.cube_name
            AND l.dimension_unique_name = h.dimension_unique_name
            AND l.hierarchy_unique_name = h.hierarchy_unique_name
GO
