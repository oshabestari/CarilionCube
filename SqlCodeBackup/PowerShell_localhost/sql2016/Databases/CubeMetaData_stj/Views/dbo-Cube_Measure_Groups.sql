SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






CREATE VIEW [dbo].[Cube_Measure_Groups]
AS
--   select * from [dbo].[Cube_Measure_Groups]
SELECT
    CAST(cube_name AS NVARCHAR(4000)) AS cube_name,
    CAST(measuregroup_name AS NVARCHAR(4000)) AS measuregroup_name,
    CAST(measure_display_folder AS NVARCHAR(4000)) AS measure_display_folder,
    CAST(measure_name AS NVARCHAR(4000)) AS measure_name,
    CAST(measure_unique_name AS NVARCHAR(4000)) AS measure_unique_name,
    CAST(measure_caption AS NVARCHAR(4000)) AS measure_caption,
    measure_is_visible,
    data_type,
    measure_aggregator,
    CAST(expression AS NVARCHAR(4000)) AS expression,
    CAST(default_format_string AS NVARCHAR(4000)) AS default_format_string
FROM
    OPENQUERY(ANALYTICS, 
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
