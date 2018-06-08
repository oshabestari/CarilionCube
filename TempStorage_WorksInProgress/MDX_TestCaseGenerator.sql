

DROP TABLE IF EXISTS #t

;WITH cte AS
(
    SELECT distinct
        --REPLACE(REPLACE(@template, N'<<measure_name>>', m.measure_name), N'<<MEASURE_GROUP>>', m.measuregroup_name)
        m.dimension_unique_name
        ,m.hierarchy_cardinality
        ,COUNT(DISTINCT m.measure_unique_name) AS cnt
    FROM
        dbo.tblCube_Usage_Between_Dimensions_And_Facts m
    where
        m.cube_name = 'analytics'
        AND (
            m.measure_name LIKE '%count'
            OR m.measure_name LIKE '%percentage of total'
        )
    GROUP BY
        m.dimension_unique_name
        ,m.hierarchy_cardinality
)
SELECT
    c.dimension_unique_name
    ,ROW_NUMBER() OVER(ORDER BY c.cnt DESC, c.hierarchy_cardinality DESC) sort_order
from
    cte c
GROUP BY
    c.dimension_unique_name
--ORDER BY
--    sort_order

    
