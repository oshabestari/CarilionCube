SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO









CREATE VIEW [dbo].[Cube_Usage_Between_Dimensions_And_Facts__Excel_Compatible]
AS
--    select * from dbo.Cube_Usage_Between_Dimensions_And_Facts__Excel_Compatible
SELECT 
     cube_name                                  AS _cube_name
    ,measuregroup_name                          AS _measuregroup_name
    ,measure_display_folder                     AS _measure_display_folder
    ,measure_name                               AS _measure_name
    ,measure_unique_name                        AS _measure_unique_name
    ,measure_caption                            AS _measure_caption
    ,measure_is_visible                         AS _measure_is_visible
    ,type_name                                  AS _type_name
    ,measure_aggregator_name                    AS _measure_aggregator_name
    ,expression                                 AS _expression
    ,default_format_string                      AS _default_format_string
    ,does_measure_caption_match_measure_name    AS _does_measure_caption_match_measure_name
    ,measuregroup_cardinality                   AS _measuregroup_cardinality
    ,dimension_unique_name                      AS _dimension_unique_name
    ,dimension_granularity                      AS _dimension_granularity
    ,dimension_cardinality                      AS _dimension_cardinality
    ,dimension_is_visible                       AS _dimension_is_visible
    ,dimension_is_fact_dimension                AS _dimension_is_fact_dimension
    ,hierarchy_name                             AS _hierarchy_name
    ,hierarchy_unique_name                      AS _hierarchy_unique_name
    ,hierarchy_caption                          AS _hierarchy_caption
    ,dimension_type_name                        AS _dimension_type_name
    ,hierarchy_cardinality                      AS _hierarchy_cardinality
    ,default_member                             AS _default_member
    ,all_member                                 AS _all_member
    ,hierarchy_ordinal                          AS _hierarchy_ordinal
    ,dimension_is_shared                        AS _dimension_is_shared
    ,hierarchy_is_visible                       AS _hierarchy_is_visible
    ,hierarchy_origin                           AS _hierarchy_origin
    ,hierarchy_display_folder                   AS _hierarchy_display_folder
    ,dimension_name                             AS _dimension_name
    ,dimension_caption                          AS _dimension_caption
    ,default_hierarchy                          AS _default_hierarchy
    ,description                                AS _description
    ,dimension_master_name                      AS _dimension_master_name
    ,dimension_ordinal                          AS _dimension_ordinal
    ,dimension_type                             AS _dimension_type
    ,dimension_is_virtual                       AS _dimension_is_virtual
    ,dimension_is_readwrite                     AS _dimension_is_readwrite
    ,dimension_unique_settings                  AS _dimension_unique_settings
    ,level_name                                 AS _level_name
    ,level_unique_name                          AS _level_unique_name
    ,level_caption                              AS _level_caption
    ,level_ordering_property                    AS _level_ordering_property
    ,level_description                          AS _level_description
    ,level_master_unique_name                   AS _level_master_unique_name
    ,level_name_sql_column_name                 AS _level_name_sql_column_name
    ,level_key_sql_column_name                  AS _level_key_sql_column_name
    ,level_unique_name_sql_column_name          AS _level_unique_name_sql_column_name
    ,level_attribute_hierarchy_name             AS _level_attribute_hierarchy_name
    ,level_type_name                            AS _level_type_name
    ,custom_rollup_settings_name                AS _custom_rollup_settings_name
    ,level_unique_settings_name                 AS _level_unique_settings_name
    ,level_origin_name                          AS _level_origin_name
    ,level_number                               AS _level_number
    ,level_cardinality                          AS _level_cardinality
    ,level_type                                 AS _level_type
    ,custom_rollup_settings                     AS _custom_rollup_settings
    ,level_unique_settings                      AS _level_unique_settings
    ,level_is_visible                           AS _level_is_visible
    ,level_dbtype                               AS _level_dbtype
    ,level_key_cardinality                      AS _level_key_cardinality
    ,level_origin                               AS _level_origin
FROM 
    dbo.tblCube_Usage_Between_Dimensions_And_Facts
GO
