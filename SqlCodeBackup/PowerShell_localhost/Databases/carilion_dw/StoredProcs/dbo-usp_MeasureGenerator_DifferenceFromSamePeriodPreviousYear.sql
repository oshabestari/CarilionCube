SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[usp_MeasureGenerator_DifferenceFromSamePeriodPreviousYear]
AS

SET NOCOUNT ON

--********************************************************************
--********************************************************************
-- Keep in sync with usp_MeasureGenerator_GrowthFromSamePeriodPreviousYear
--********************************************************************
--********************************************************************


DECLARE @template NVARCHAR(MAX) = 
N'


/* Procedurally generated code via sproc dbo.usp_MeasureGenerator_GrowthFromSamePeriodPreviousYear */
CREATE MEMBER CURRENTCUBE.[Measures].[<<measure_name>> - Difference from Same <<Fiscal>>Period Previous Year - By - <<dimension_name>>]
 AS <<measure_unique_name>> - (PARALLELPERIOD(<<dimension_unique_name>>.[<<date_hierarchy>>].[<<Fiscal>>Year], 1, <<dimension_unique_name>>.[<<date_hierarchy>>].CurrentMember) , (<<measure_unique_name>>))
,FORMAT_STRING = "#,###;-#,###", 
VISIBLE = 1, DISPLAY_FOLDER=''<<display_folder01>><<display_folder02>>'', ASSOCIATED_MEASURE_GROUP = ''<<measuregroup_name>>'';

'


DROP TABLE IF EXISTS #t


SELECT DISTINCT 
    u.measuregroup_name
    ,u.measure_name
    ,u.dimension_name
    ,f.Fiscal
    ,IIF(f.Fiscal = '', 
        'Year -  Quarter -  Month -   Date',
        'Fiscal Year - Quarter - Month - Date'
    ) AS date_hierarchy 
    ,u.measure_unique_name
    ,u.dimension_unique_name
    ,IIF(f.Fiscal = '', 
        'Difference by Calendar Year',
        'Difference by Fiscal Year'
    ) AS display_folder01
    ,IIF(u.measure_name like u.measuregroup_name + ' - %',
        '\' + right(u.measure_name, LEN(u.measure_name) - len(u.measuregroup_name) - LEN(' - ') -1),
        ''
    ) AS display_folder02
INTO #t
FROM 
    dbo.tblCube_Usage_Between_Dimensions_And_Facts u
    CROSS join (
        SELECT 'Fiscal ' AS Fiscal UNION ALL
        SELECT ''
    ) f
WHERE
    u.dimension_unique_name LIKE '\[date%' ESCAPE '\'
    AND (
        u.measure_is_visible = 1
        and u.measure_name NOT LIKE '% - Percentage Of Total'
        AND u.measure_name not LIKE '% - Growth from Same Period Previous Year'
        AND u.measure_name not LIKE '% - Min'
        AND u.measure_name not LIKE '% - Max'
    )


--    select * from #t order by 1,2,3,4


SELECT
    REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(@template, 
        N'<<measure_name>>', t.measure_name), 
        N'<<measure_unique_name>>', t.measure_unique_name), 
        N'<<measuregroup_name>>', t.measuregroup_name),
        N'<<Fiscal>>', t.Fiscal),
        N'<<date_hierarchy>>', t.date_hierarchy),
        N'<<dimension_unique_name>>', t.dimension_unique_name),
        N'<<dimension_name>>', t.dimension_name),
        N'<<display_folder01>>', t.display_folder01),
        N'<<display_folder02>>', t.display_folder02)
FROM
    #t AS t
ORDER BY 
    t.measuregroup_name
    ,t.measure_name
    ,t.dimension_name
    ,t.Fiscal

    
GO
