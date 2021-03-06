SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO











CREATE VIEW dbo.Cube_Levels_and_LevelOrigin_CustomRollupSettings
AS
--    select * from dbo.Cube_Levels_and_LevelOrigin_CustomRollupSettings

SELECT 
     l.cube_name
    ,l.dimension_unique_name
    ,l.hierarchy_unique_name
    ,l.level_name
    ,l.level_unique_name
    ,l.level_caption
    ,l.level_ordering_property
    ,l.[description]
    ,l.level_master_unique_name
    ,l.level_name_sql_column_name
    ,l.level_key_sql_column_name
    ,l.level_unique_name_sql_column_name
    ,l.level_attribute_hierarchy_name
    ,l.level_type_name
    ,l.custom_rollup_settings_name
    ,l.level_unique_settings_name
    ,l.level_origin_name
    ,l.level_number
    ,l.level_cardinality
    ,l.level_type
    ,l.custom_rollup_settings
    ,l.level_unique_settings
    ,l.level_is_visible
    ,l.level_dbtype
    ,l.level_key_cardinality
    ,l.level_origin
    ,l.pkey
    ,lbf.level_origin_bitwise_flag
    ,lbf.level_origin_description
    ,lbf.level_origin_description_plus_hex_value
    ,crs.custom_rollup_settings_bitwise_flag
    ,crs.custom_rollup_settings_description
    ,crs.custom_rollup_settings_description_plus_hex_value
FROM 
    dbo.tblCube_Levels l
    cross apply dbo.ufn_LevelOrigin_ReturnBitwiseFlagDescription(level_origin) lbf
    cross apply dbo.ufn_CustomRollupSettings_ReturnBitwiseFlagDescription(custom_rollup_settings) crs


GO
