USE [carilion_dw]
GO
set nocount on
GO

GO
/****** Object:  StoredProcedure [dbo].[usp_MeasureGenerator_GrowthFromSamePeriodPreviousYear]    Script Date: 6/21/2018 11:44:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_MeasureGenerator_GrowthFromSamePeriodPreviousYear]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[usp_MeasureGenerator_GrowthFromSamePeriodPreviousYear] AS' 
END
GO



ALTER PROCEDURE [dbo].[usp_MeasureGenerator_GrowthFromSamePeriodPreviousYear]
AS

SET NOCOUNT ON


DECLARE @template NVARCHAR(MAX) = 
N'


/* Procedurally generated code via sproc dbo.usp_MeasureGenerator_GrowthFromSamePeriodPreviousYear */
CREATE MEMBER CURRENTCUBE.[Measures].[<<measure_name>> - Difference from Same <<Fiscal>>Period Previous Year - By - <<dimension_name>>]
 AS <<measure_unique_name>> - (PARALLELPERIOD(<<dimension_unique_name>>.[<<date_hierarchy>>].[<<Fiscal>>Year], 1, <<dimension_unique_name>>.[<<date_hierarchy>>].CurrentMember) , (<<measure_unique_name>>))
,FORMAT_STRING = "#,###;-#,###", 
VISIBLE = 1 ,  ASSOCIATED_MEASURE_GROUP = ''<<measuregroup_name>>'';


/* Procedurally generated code via sproc dbo.usp_MeasureGenerator_GrowthFromSamePeriodPreviousYear */
CREATE MEMBER CURRENTCUBE.[Measures].[<<measure_name>> - Growth from Same <<Fiscal>>Period Previous Year - By - <<dimension_name>>]
 AS IIF ((PARALLELPERIOD(<<dimension_unique_name>>.[<<date_hierarchy>>].[<<Fiscal>>Year], 1, <<dimension_unique_name>>.[<<date_hierarchy>>].CurrentMember) , (<<measure_unique_name>>)) = 0  , NULL,
    IIF (<<measure_unique_name>> = 0, NULL,
            (
            <<measure_unique_name>> - 
            (PARALLELPERIOD(<<dimension_unique_name>>.[<<date_hierarchy>>].[<<Fiscal>>Year], 1, <<dimension_unique_name>>.[<<date_hierarchy>>].CurrentMember) , (<<measure_unique_name>>)
                            )
            )
            / (PARALLELPERIOD(<<dimension_unique_name>>.[<<date_hierarchy>>].[<<Fiscal>>Year], 1, <<dimension_unique_name>>.[<<date_hierarchy>>].CurrentMember) , (<<measure_unique_name>>)
            )
        )
) 
,FORMAT_STRING = "Percent", 
VISIBLE = 1 ,  ASSOCIATED_MEASURE_GROUP = ''<<measuregroup_name>>'';
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
        u.measure_name NOT LIKE '% - Percentage Of Total'
        AND u.measure_name not LIKE '% - Growth from Same Period Previous Year'
    )


--    select * from #t order by 1,2,3,4


SELECT
    REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(@template, 
        N'<<measure_name>>', t.measure_name), 
        N'<<measure_unique_name>>', t.measure_unique_name), 
        N'<<measuregroup_name>>', t.measuregroup_name),
        N'<<Fiscal>>', t.Fiscal),
        N'<<date_hierarchy>>', t.date_hierarchy),
        N'<<dimension_unique_name>>', t.dimension_unique_name),
        N'<<dimension_name>>', t.dimension_name)
FROM
    #t AS t
ORDER BY 
    t.measuregroup_name
    ,t.measure_name
    ,t.dimension_name
    ,t.Fiscal

    
GO
