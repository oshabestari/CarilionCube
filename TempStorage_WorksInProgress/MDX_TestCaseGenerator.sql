USE carilion_dw
go


alter PROC dbo.usp_MeasureGenerator_TestQueries
as

DECLARE @template NVARCHAR(max) = 
N'
select
{
<<measures>>
} on 0
,{
<<dimension>>
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
    AND (
        m.measure_name LIKE N'%count'
        OR m.measure_name LIKE N'%percentage of total'
    )

--   SELECT * FROM #measures

;WITH cte AS
(
    SELECT DISTINCT
        u.cube_name
        ,u.dimension_unique_name
        ,u.hierarchy_cardinality
        ,COUNT(DISTINCT u.measure_unique_name) AS cnt
    FROM
        dbo.tblCube_Usage_Between_Dimensions_And_Facts u
        JOIN #measures m
            ON m.cube_name = u.cube_name
                AND m.measure_unique_name = u.measure_unique_name
    GROUP BY
        u.cube_name
        ,u.dimension_unique_name
        ,u.hierarchy_cardinality
)
SELECT
     c.cube_name
    ,c.dimension_unique_name
    ,c.cnt
    ,c.hierarchy_cardinality
    ,ROW_NUMBER() OVER(ORDER BY c.cnt DESC, c.hierarchy_cardinality asc) primkey
INTO #dim_cardinality
from
    cte c
ORDER BY
    primkey




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
                AND dc.dimension_unique_name = u.dimension_unique_name
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
    ,dc.dimension_unique_name
    ,dc.hierarchy_cardinality
    --,RANK() OVER(PARTITION BY c.cube_name) AS sort_cube_name
    --,ROW_NUMBER() OVER(ORDER BY c.cube_name, c.measuregroup_name, c.measure_name,
    --    dc.dimension_unique_name) AS RowNum
INTO #measures_dimensions
from
    cte c
    JOIN #dim_cardinality dc
        ON dc.cube_name = c.cube_name
            AND dc.primkey = c.primkey
ORDER by
    c.cube_name
    --,c.measuregroup_name
    ,c.measure_unique_name
    




SELECT
    REPLACE(REPLACE(REPLACE(@template, N'<<cube_name>>', md.cube_name),
        N'<<dimension>>', md.dimension_unique_name),
        N'<<measures>>', STRING_AGG(CAST(md.measure_unique_name AS NVARCHAR(MAX)), N',' + NCHAR(13) + NCHAR(10)) 
            WITHIN GROUP(ORDER BY md.measure_unique_name))
FROM
    #measures_dimensions md
GROUP BY
     md.cube_name
    ,md.dimension_unique_name







    
