SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [dbo].[usp_MeasureGenerator_DifferenceFromSamePeriodPreviousYear_UsingScope]
AS

SET NOCOUNT ON

--********************************************************************
--********************************************************************
-- Keep in sync with usp_MeasureGenerator_GrowthFromSamePeriodPreviousYear_UsingScope
--********************************************************************
--********************************************************************


DECLARE @template_measures NVARCHAR(MAX) = 
N'


/* Procedurally generated code via sproc dbo.usp_MeasureGenerator_DifferenceFromSamePeriodPreviousYear_UsingScope */
CREATE MEMBER CURRENTCUBE.[Measures].[<<measure_name>> - Difference from Same Period Previous Year]
 AS NULL
,FORMAT_STRING = "#,###.##;-#,###.##", 
VISIBLE = 1, DISPLAY_FOLDER=''Difference'', ASSOCIATED_MEASURE_GROUP = ''<<measuregroup_name>>'';
'


DECLARE @template_scope NVARCHAR(MAX) = 
N'


/* Procedurally generated code via sproc dbo.usp_MeasureGenerator_DifferenceFromSamePeriodPreviousYear_UsingScope */
scope([Measures].[<<measure_name>> - Difference from Same Period Previous Year], DESCENDANTS(<<hierarchy_unique_name>>,,AFTER));
this = <<measure_unique_name>> - (PARALLELPERIOD(<<hierarchy_unique_name>>.[<<level_caption>>], 1, <<hierarchy_unique_name>>.CurrentMember), (<<measure_unique_name>>));
end scope;
'


DROP TABLE IF EXISTS #t


SELECT DISTINCT 
    u.measuregroup_name
    ,u.measure_name
    ,u.dimension_name
    ,u.hierarchy_unique_name 
    ,u.measure_unique_name
    ,u.dimension_unique_name
    ,u.level_caption
    ,IIF(u.level_caption like '%Fiscal%', 
        'Growth by Fiscal Year',
        'Growth by Calendar Year'
    ) AS display_folder01
    ,IIF(u.measure_name like u.measuregroup_name + ' - %',
        '\' + right(u.measure_name, LEN(u.measure_name) - len(u.measuregroup_name) - LEN(' - ') -1),
        ''
    ) AS display_folder02
INTO #t
FROM 
    dbo.tblCube_Usage_Between_Dimensions_And_Facts u
WHERE
    u.dimension_unique_name LIKE '\[date%' ESCAPE '\'
    and u.level_caption like '%Year%'
    and u.level_number = 1
    AND (
        u.measure_is_visible = 1
        and u.measure_name NOT LIKE '% - Percentage Of Total'
        AND u.measure_name not LIKE '% - Difference from Same Period Previous Year'
        AND u.measure_name not LIKE '% - Min'
        AND u.measure_name not LIKE '% - Max'
    )
    --and measure_name = 'Outpatient - Count'
ORDER BY 
     measuregroup_name
    ,measure_name
    ,dimension_name

--    select * from #t order by 1,2,3,4

;with cte as 
(
    SELECT
        REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(@template_measures, 
            N'<<measure_name>>', t.measure_name), 
            N'<<measure_unique_name>>', t.measure_unique_name), 
            N'<<measuregroup_name>>', t.measuregroup_name),
            N'<<hierarchy_unique_name>>', t.hierarchy_unique_name),
            N'<<dimension_unique_name>>', t.dimension_unique_name),
            N'<<dimension_name>>', t.dimension_name),
            N'<<display_folder01>>', t.display_folder01),
            N'<<display_folder02>>', t.display_folder02) as [--begin measure declaration]
    FROM
        #t AS t
)
select distinct
    *
from
    cte


;with cte as (
    SELECT distinct
        REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(@template_scope, 
            N'<<measure_name>>', t.measure_name), 
            N'<<measure_unique_name>>', t.measure_unique_name), 
            N'<<measuregroup_name>>', t.measuregroup_name),
            N'<<hierarchy_unique_name>>', t.hierarchy_unique_name),
            N'<<dimension_unique_name>>', t.dimension_unique_name),
            N'<<dimension_name>>', t.dimension_name),
            N'<<level_caption>>', t.level_caption),
            N'<<display_folder01>>', t.display_folder01),
            N'<<display_folder02>>', t.display_folder02) as [--begin scope declaration]
    FROM
        #t AS t
)
select distinct
    *
from
    cte

    
GO
