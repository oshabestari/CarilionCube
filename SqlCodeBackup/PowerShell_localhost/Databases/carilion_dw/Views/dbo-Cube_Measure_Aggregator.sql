SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE VIEW [dbo].[Cube_Measure_Aggregator]
AS
--     select * from dbo.Cube_Measure_Aggregator
SELECT 1   AS measure_aggregator, N'Sum'                AS measure_aggregator_name UNION ALL
SELECT 2   AS measure_aggregator, N'Count'              AS measure_aggregator_name UNION ALL
SELECT 3   AS measure_aggregator, N'Min'                AS measure_aggregator_name UNION ALL
SELECT 4   AS measure_aggregator, N'Max'                AS measure_aggregator_name UNION ALL
SELECT 8   AS measure_aggregator, N'DistinctCount'      AS measure_aggregator_name UNION ALL
SELECT 9   AS measure_aggregator, N'None'               AS measure_aggregator_name UNION ALL
SELECT 10  AS measure_aggregator, N'AverageOfChildren'  AS measure_aggregator_name UNION ALL
SELECT 11  AS measure_aggregator, N'FirstChild'         AS measure_aggregator_name UNION ALL
SELECT 12  AS measure_aggregator, N'LastChild'          AS measure_aggregator_name UNION ALL
SELECT 13  AS measure_aggregator, N'FirstNonEmpty'      AS measure_aggregator_name UNION ALL
SELECT 14  AS measure_aggregator, N'LastNonEmpty'       AS measure_aggregator_name UNION ALL
SELECT 15  AS measure_aggregator, N'ByAccount'          AS measure_aggregator_name UNION ALL
SELECT 127 AS measure_aggregator, N'Calculated measure' AS measure_aggregator_name


GO
