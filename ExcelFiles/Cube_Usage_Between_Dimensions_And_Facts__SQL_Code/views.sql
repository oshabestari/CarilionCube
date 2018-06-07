USE [carilion_dw]
GO

/****** Object:  View [dbo].[Cube_Measures]    Script Date: 6/7/2018 1:03:25 PM ******/
DROP VIEW [dbo].[Cube_Measures]
GO

/****** Object:  View [dbo].[Cube_Dimension_Type]    Script Date: 6/7/2018 1:03:25 PM ******/
DROP VIEW [dbo].[Cube_Dimension_Type]
GO

/****** Object:  View [dbo].[Cube_Usage_Between_Dimensions_And_Facts]    Script Date: 6/7/2018 1:03:25 PM ******/
DROP VIEW [dbo].[Cube_Usage_Between_Dimensions_And_Facts]
GO

/****** Object:  View [dbo].[Cube_Measure_Group_vs_Dimensions]    Script Date: 6/7/2018 1:03:25 PM ******/
DROP VIEW [dbo].[Cube_Measure_Group_vs_Dimensions]
GO

/****** Object:  View [dbo].[Cube_Measure_Aggregator]    Script Date: 6/7/2018 1:03:25 PM ******/
DROP VIEW [dbo].[Cube_Measure_Aggregator]
GO

/****** Object:  View [dbo].[Cube_Data_Types]    Script Date: 6/7/2018 1:03:25 PM ******/
DROP VIEW [dbo].[Cube_Data_Types]
GO

/****** Object:  View [dbo].[Cube_Measure_Groups]    Script Date: 6/7/2018 1:03:25 PM ******/
DROP VIEW [dbo].[Cube_Measure_Groups]
GO

/****** Object:  View [dbo].[Cube_Dimensions]    Script Date: 6/7/2018 1:03:25 PM ******/
DROP VIEW [dbo].[Cube_Dimensions]
GO

/****** Object:  View [dbo].[Cube_Dimensions]    Script Date: 6/7/2018 1:03:25 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





CREATE VIEW [dbo].[Cube_Dimensions]
AS
--   select * from [dbo].[Cube_Dimensions]

SELECT
    cast(cube_name as varchar(4000)) as cube_name,
    cast(dimension_unique_name as varchar(4000)) as dimension_unique_name,
    cast(hierarchy_name as varchar(4000)) as hierarchy_name,
    cast(hierarchy_unique_name as varchar(4000)) as hierarchy_unique_name,
    cast(hierarchy_caption as varchar(4000)) as hierarchy_caption,
    dimension_type,
    hierarchy_cardinality,
    cast(default_member as varchar(4000)) as default_member,
    cast(all_member as varchar(4000)) as all_member,
    hierarchy_ordinal,
    dimension_is_shared,
    hierarchy_is_visible,
    hierarchy_origin,
    cast(hierarchy_display_folder as varchar(4000)) as hierarchy_display_folder
FROM
    OPENQUERY(SSAS_LH_ANALYTICS, 
'SELECT cube_name,
[dimension_unique_name],
hierarchy_name,
[hierarchy_unique_name],
hierarchy_caption,
dimension_type,
hierarchy_cardinality,
[default_member],
all_member,
hierarchy_ordinal,
dimension_is_shared,
hierarchy_is_visible,
hierarchy_origin,
hierarchy_display_folder
FROM   $system.mdschema_hierarchies
WHERE  cube_name = ''Analytics'' or cube_name = ''Census'';'
)


GO

/****** Object:  View [dbo].[Cube_Measure_Groups]    Script Date: 6/7/2018 1:03:25 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





CREATE VIEW [dbo].[Cube_Measure_Groups]
AS
--   select * from [dbo].[Cube_Measure_Groups]
SELECT
    cast(cube_name as varchar(4000)) as cube_name,
    cast(measuregroup_name as varchar(4000)) as measuregroup_name,
    cast(measure_display_folder as varchar(4000)) as measure_display_folder,
    cast(measure_name as varchar(4000)) as measure_name,
    cast(measure_unique_name as varchar(4000)) as measure_unique_name,
    cast(measure_caption as varchar(4000)) as measure_caption,
    measure_is_visible,
    data_type,
    measure_aggregator,
    cast(expression as varchar(4000)) as expression,
    cast(default_format_string as varchar(4000)) as default_format_string
FROM
    OPENQUERY(SSAS_LH_ANALYTICS, 
'SELECT cube_name,
measuregroup_name,
measure_display_folder,
measure_name,
measure_unique_name,
measure_caption,
measure_is_visible,
data_type,
measure_aggregator,
expression,
default_format_string
FROM   $system.mdschema_measures
WHERE  cube_name = ''Analytics'' or cube_name = ''Census'';'
)


GO

/****** Object:  View [dbo].[Cube_Data_Types]    Script Date: 6/7/2018 1:03:25 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO







CREATE VIEW [dbo].[Cube_Data_Types]
AS
-- select * from [dbo].[Cube_Data_Types]

SELECT 
    cast(type_name as varchar(4000)) as type_name,
    data_type,
    column_size,
    cast(literal_prefix as varchar(4000)) as literal_prefix,
    cast(literal_suffix as varchar(4000)) as literal_suffix,
    cast(create_params as varchar(4000)) as create_params,
    is_nullable,
    case_sensitive,
    searchable,
    unsigned_attribute,
    fixed_prec_scale,
    auto_unique_value,
    cast(local_type_name as varchar(4000)) as local_type_name,
    minimum_scale,
    maximum_scale,
    guid,
    cast(typelib as varchar(4000)) as typelib,
    cast(version as varchar(4000)) as version,
    is_long,
    best_match,
    is_fixedlength
FROM
    OPENQUERY(SSAS_LH_ANALYTICS, 
'select
*
FROM
$system.DBSCHEMA_PROVIDER_TYPES;'
)


GO

/****** Object:  View [dbo].[Cube_Measure_Aggregator]    Script Date: 6/7/2018 1:03:25 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dbo].[Cube_Measure_Aggregator]
as
--     select * from dbo.Cube_Measure_Aggregator
select 1   as measure_aggregator, 'Sum'                as measure_aggregator_name union all
select 2   as measure_aggregator, 'Count'              as measure_aggregator_name union all
select 3   as measure_aggregator, 'Min'                as measure_aggregator_name union all
select 4   as measure_aggregator, 'Max'                as measure_aggregator_name union all
select 8   as measure_aggregator, 'DistinctCount'      as measure_aggregator_name union all
select 9   as measure_aggregator, 'None'               as measure_aggregator_name union all
select 10  as measure_aggregator, 'AverageOfChildren'  as measure_aggregator_name union all
select 11  as measure_aggregator, 'FirstChild'         as measure_aggregator_name union all
select 12  as measure_aggregator, 'LastChild'          as measure_aggregator_name union all
select 13  as measure_aggregator, 'FirstNonEmpty'      as measure_aggregator_name union all
select 14  as measure_aggregator, 'LastNonEmpty'       as measure_aggregator_name union all
select 15  as measure_aggregator, 'ByAccount'          as measure_aggregator_name union all
select 127 as measure_aggregator, 'Calculated measure' as measure_aggregator_name


GO

/****** Object:  View [dbo].[Cube_Measure_Group_vs_Dimensions]    Script Date: 6/7/2018 1:03:25 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO






CREATE VIEW [dbo].[Cube_Measure_Group_vs_Dimensions]
AS
--   select * from [dbo].[Cube_Measure_Group_vs_Dimensions]
SELECT
    cast(catalog_name as varchar(4000)) as catalog_name,
    cast(cube_name as varchar(4000)) as cube_name,
    cast(schema_name as varchar(4000)) as schema_name,
    cast(measuregroup_name as varchar(4000)) as measuregroup_name,
    cast(measuregroup_cardinality as varchar(4000)) as measuregroup_cardinality,
    cast(dimension_unique_name as varchar(4000)) as dimension_unique_name,
    cast(dimension_granularity as varchar(4000)) as dimension_granularity,
    cast(dimension_cardinality as varchar(4000)) as dimension_cardinality,
    dimension_is_visible,
    dimension_is_fact_dimension
FROM
    OPENQUERY(SSAS_LH_ANALYTICS, 
'SELECT 
[catalog_name],
[cube_name],
[schema_name],
[measuregroup_name],
[measuregroup_cardinality],
[dimension_unique_name],
[dimension_granularity],
[dimension_cardinality],
[dimension_is_visible],
[dimension_is_fact_dimension]
FROM   $system.mdschema_measuregroup_dimensions
WHERE  cube_name = ''Analytics'' or cube_name = ''Census'';'
)


GO

/****** Object:  View [dbo].[Cube_Usage_Between_Dimensions_And_Facts]    Script Date: 6/7/2018 1:03:25 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dbo].[Cube_Usage_Between_Dimensions_And_Facts]
as
--    select * from dbo.Cube_Usage_Between_Dimensions_And_Facts
SELECT
     _cube_name                               = mg.[cube_name]
    ,_measuregroup_name                       = mg.measuregroup_name
    ,_measure_display_folder                  = mg.measure_display_folder
    ,_measure_name                            = mg.measure_name
    ,_measure_unique_name                     = mg.measure_unique_name
    ,_measure_caption                         = mg.measure_caption
    ,_measure_is_visible                      = mg.measure_is_visible
    ,_type_name                               = ISNULL(dt.[type_name], 'not_specified')
    ,_measure_aggregator_name                 = magg.measure_aggregator_name
    ,_expression                              = mg.expression
    ,_default_format_string                   = mg.default_format_string
    ,_does_measure_caption_match_measure_name = IIF(mg.measure_caption = mg.measure_name, 1, 0)
    ,_measuregroup_cardinality                = mg_vs_d.measuregroup_cardinality
    ,_dimension_unique_name                   = mg_vs_d.dimension_unique_name
    ,_dimension_granularity                   = mg_vs_d.dimension_granularity
    ,_dimension_cardinality                   = mg_vs_d.dimension_cardinality
    ,_dimension_is_visible                    = mg_vs_d.dimension_is_visible
    ,_dimension_is_fact_dimension             = mg_vs_d.dimension_is_fact_dimension
    ,_hierarchy_name                          = d.hierarchy_name
    ,_hierarchy_unique_name                   = d.hierarchy_unique_name
    ,_hierarchy_caption                       = d.hierarchy_caption
    ,_dimension_type                          = d.dimension_type
    ,_hierarchy_cardinality                   = d.hierarchy_cardinality
    ,_default_member                          = d.default_member
    ,_all_member                              = d.all_member
    ,_hierarchy_ordinal                       = d.hierarchy_ordinal
    ,_dimension_is_shared                     = d.dimension_is_shared
    ,_hierarchy_is_visible                    = d.hierarchy_is_visible
    ,_hierarchy_origin                        = d.hierarchy_origin
    ,_hierarchy_display_folder                = d.hierarchy_display_folder
FROM 
    dbo.Cube_Measure_Groups mg
    
    JOIN dbo.Cube_Measure_Group_vs_Dimensions mg_vs_d
        ON mg.cube_name = mg_vs_d.cube_name
            AND mg.measuregroup_name = mg_vs_d.measuregroup_name

    JOIN dbo.Cube_Dimensions d
        ON d.cube_name = mg_vs_d.cube_name
            AND d.dimension_unique_name = mg_vs_d.dimension_unique_name

    LEFT JOIN dbo.Cube_Measure_Aggregator magg
        ON mg.measure_aggregator = magg.measure_aggregator
    
    LEFT JOIN dbo.Cube_Data_Types dt
        ON mg.data_type = dt.DATA_TYPE


GO

/****** Object:  View [dbo].[Cube_Dimension_Type]    Script Date: 6/7/2018 1:03:25 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dbo].[Cube_Dimension_Type]
AS
--     select * from dbo.Cube_Dimension_Type
SELECT 0  AS dimension_type, 'MD_DIMTYPE_UNKNOWN'               AS dimension_type_name UNION ALL
SELECT 1  AS dimension_type, 'MD_DIMTYPE_TIME'                  AS dimension_type_name UNION ALL
SELECT 2  AS dimension_type, 'MD_DIMTYPE_MEASURE'               AS dimension_type_name UNION ALL
SELECT 3  AS dimension_type, 'MD_DIMTYPE_OTHER'                 AS dimension_type_name UNION ALL
SELECT 5  AS dimension_type, 'MD_DIMTYPE_QUANTITATIVE'          AS dimension_type_name UNION ALL
SELECT 6  AS dimension_type, 'MD_DIMTYPE_ACCOUNTS'              AS dimension_type_name UNION ALL
SELECT 7  AS dimension_type, 'MD_DIMTYPE_CUSTOMERS'             AS dimension_type_name UNION ALL
SELECT 8  AS dimension_type, 'MD_DIMTYPE_PRODUCTS'              AS dimension_type_name UNION ALL
SELECT 9  AS dimension_type, 'MD_DIMTYPE_SCENARIO'              AS dimension_type_name UNION ALL
SELECT 10 AS dimension_type, 'MD_DIMTYPE_UTILIY'                AS dimension_type_name UNION ALL
SELECT 11 AS dimension_type, 'MD_DIMTYPE_CURRENCY'              AS dimension_type_name UNION ALL
SELECT 12 AS dimension_type, 'MD_DIMTYPE_RATES'                 AS dimension_type_name UNION ALL
SELECT 13 AS dimension_type, 'MD_DIMTYPE_CHANNEL'               AS dimension_type_name UNION ALL
SELECT 14 AS dimension_type, 'MD_DIMTYPE_PROMOTION'             AS dimension_type_name UNION ALL
SELECT 15 AS dimension_type, 'MD_DIMTYPE_ORGANIZATION'          AS dimension_type_name UNION ALL
SELECT 16 AS dimension_type, 'MD_DIMTYPE_BILL_OF_MATERIALS'     AS dimension_type_name UNION ALL
SELECT 17 AS dimension_type, 'MD_DIMTYPE_GEOGRAPHY'             AS dimension_type_name



GO

/****** Object:  View [dbo].[Cube_Measures]    Script Date: 6/7/2018 1:03:25 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





CREATE VIEW [dbo].[Cube_Measures]
AS
--    select * from [dbo].[Cube_Measures]
SELECT
    CAST(cube_name AS VARCHAR(4000)) AS cube_name,
    CAST(measuregroup_name AS VARCHAR(4000)) AS measuregroup_name,
    CAST(measure_display_folder AS VARCHAR(4000)) AS measure_display_folder,
    CAST(measure_name AS VARCHAR(4000)) AS measure_name,
    CAST(measure_unique_name AS VARCHAR(4000)) AS measure_unique_name,
    CAST(measure_caption AS VARCHAR(4000)) AS measure_caption,
    measure_is_visible,
    data_type,
    measure_aggregator,
    CAST(expression AS VARCHAR(4000)) AS expression,
    CAST(default_format_string AS VARCHAR(4000)) AS default_format_string
FROM
    OPENQUERY(SSAS_LH_ANALYTICS, 
'SELECT cube_name,
measuregroup_name,
measure_display_folder,
measure_name,
measure_unique_name,
measure_caption,
measure_is_visible,
data_type,
measure_aggregator,
expression,
default_format_string
FROM   $system.mdschema_measures
WHERE  cube_name = ''Analytics'' or cube_name = ''Census'';'
)


GO


