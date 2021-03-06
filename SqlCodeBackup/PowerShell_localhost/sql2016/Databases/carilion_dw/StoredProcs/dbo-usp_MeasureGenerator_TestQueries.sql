SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROC [dbo].[usp_MeasureGenerator_TestQueries]
as

SET NOCOUNT on

DECLARE @template NVARCHAR(max) = 
N'
select
{
<<measures>>
} on 0
,{
<<dimension>>.children
} on 1
from
    <<cube_name>>
'

DROP TABLE IF EXISTS #dim_cardinality
DROP TABLE IF EXISTS #measures_dimensions
DROP TABLE IF EXISTS #measures


SELECT DISTINCT
    m.cube_name
    ,m.measure_unique_name
INTO #measures
FROM
    dbo.tblCube_Measures m
where
    m.cube_name = N'analytics'
    and (
        -- Percentage of total
        --AND (
        --    m.measure_name LIKE N'%count'
        --    OR m.measure_name LIKE N'%percentage of total'
        --)
        -- Percentage of total for Sum
        (
            m.measure_name LIKE N'%sum'
            OR m.measure_name LIKE N'%sum - percentage of total'
        )
    )
--   SELECT * FROM #measures

;WITH cte AS
(
    SELECT
        u.cube_name
        ,u.hierarchy_unique_name
        ,u.hierarchy_cardinality
        ,COUNT(DISTINCT u.measure_unique_name) AS cnt
    FROM
        dbo.tblCube_Usage_Between_Dimensions_And_Facts u
        JOIN #measures m
            ON m.cube_name = u.cube_name
                AND m.measure_unique_name = u.measure_unique_name
    GROUP BY
        u.cube_name
        ,u.hierarchy_unique_name
        ,u.hierarchy_cardinality
)
SELECT
     c.cube_name
    ,c.hierarchy_unique_name
    ,c.cnt
    ,c.hierarchy_cardinality
    ,ROW_NUMBER() OVER(ORDER BY c.cnt DESC, c.hierarchy_cardinality ASC) primkey
INTO #dim_cardinality
from
    cte c
ORDER BY
    primkey

--     select * from #dim_cardinality


;WITH cte AS
(
    SELECT
         u.cube_name
        ,u.measuregroup_name
        ,u.measure_unique_name
        ,MIN(dc.primkey) AS primkey
    FROM
        #dim_cardinality dc
        JOIN dbo.tblCube_Usage_Between_Dimensions_And_Facts u
            ON u.cube_name = dc.cube_name
                AND dc.hierarchy_unique_name = u.hierarchy_unique_name
        JOIN #measures m
            ON m.cube_name = u.cube_name
                AND m.measure_unique_name = u.measure_unique_name
    GROUP BY
         u.cube_name
        ,u.measuregroup_name
        ,u.measure_unique_name
)
SELECT
     c.cube_name
    ,c.measuregroup_name
    ,c.measure_unique_name
    ,dc.hierarchy_unique_name
    ,dc.hierarchy_cardinality
INTO #measures_dimensions
from
    cte c
    JOIN #dim_cardinality dc
        ON dc.cube_name = c.cube_name
            AND dc.primkey = c.primkey
ORDER by
    c.cube_name
    ,c.measure_unique_name
    

--    select * from #measures_dimensions


drop table if exists #measures_dimensions_grouped


SELECT
    md.cube_name
    ,md.hierarchy_unique_name
    ,STUFF((
        select
             N',' + NCHAR(13) + NCHAR(10) + md2.measure_unique_name AS [text()]
        FROM 
            #measures_dimensions md2
        WHERE 
            md2.cube_name = md.cube_name
            and md2.hierarchy_unique_name = md.hierarchy_unique_name
        group by
            md2.measure_unique_name
        ORDER BY 
            md2.measure_unique_name
        for xml path(''), type).value('.', 'nvarchar(max)')
     ,1,3,'') as measure_list
into #measures_dimensions_grouped
FROM
    #measures_dimensions md
GROUP BY
     md.cube_name
    ,md.hierarchy_unique_name
order by
    md.cube_name
    ,md.hierarchy_unique_name



SELECT
    REPLACE(REPLACE(REPLACE(@template, N'<<cube_name>>', mdg.cube_name),
        N'<<dimension>>', mdg.hierarchy_unique_name),
        N'<<measures>>', mdg.measure_list)
FROM
    #measures_dimensions_grouped mdg
order BY
     mdg.cube_name
    ,mdg.hierarchy_unique_name
GO
