SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [util].[usp_FixData_DepartmentDim]
as


;WITH a AS 
(
SELECT 
    CHAR(t.N) AS c
FROM 
    util.tally t
WHERE
    t.N BETWEEN ascii(0) AND ascii(9)
    OR t.N BETWEEN ascii('A') and ascii('Z')
    OR t.N = ascii(' ')
),
cte2 AS 
(
    SELECT 
        CONCAT(a1.c, a2.c, a3.c) c
        ,ROW_NUMBER() OVER(ORDER BY NEWID()) rn
    FROM
        a AS a1
        ,a AS a2
        ,a AS a3
)
UPDATE d
SET
    [RSTCT_IND] = cte2.c
FROM
    [dbo].[DepartmentDim] d
    JOIN cte2 
        ON cte2.rn = d.DEPT_SK  

GO
