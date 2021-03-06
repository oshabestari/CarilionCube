SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







CREATE VIEW [dbo].[Cube_Measure_Group_vs_Dimensions]
AS
--   select * from [dbo].[Cube_Measure_Group_vs_Dimensions]
SELECT
    CAST(catalog_name AS NVARCHAR(4000)) AS catalog_name,
    CAST(cube_name AS NVARCHAR(4000)) AS cube_name,
    CAST(schema_name AS NVARCHAR(4000)) AS schema_name,
    CAST(measuregroup_name AS NVARCHAR(4000)) AS measuregroup_name,
    CAST(measuregroup_cardinality AS NVARCHAR(4000)) AS measuregroup_cardinality,
    CAST(dimension_unique_name AS NVARCHAR(4000)) AS dimension_unique_name,
    CAST(dimension_granularity AS NVARCHAR(4000)) AS dimension_granularity,
    CAST(dimension_cardinality AS NVARCHAR(4000)) AS dimension_cardinality,
    dimension_is_visible,
    dimension_is_fact_dimension
FROM
    OPENQUERY(ANALYTICS, 
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
