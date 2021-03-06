SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROC [dbo].[usp_PopulateDiagnosisHierarchy]
as


TRUNCATE TABLE dbo.DiagnosisHierarchy

DROP TABLE IF EXISTS #c

CREATE TABLE #c(
    c VARCHAR(1) NOT NULL
)

INSERT INTO #c(c)
VALUES('A'), ('B'), ('C'), ('D'), ('E')

INSERT INTO dbo.DiagnosisHierarchy(DIAG_PRN_SK, DIAG_CLS_DESC)
SELECT distinct
    NULL AS DIAG_PRN_SK
    ,CONCAT('L1', '_', c.c) AS DIAG_CLS_DESC
FROM
    #c c
    

INSERT INTO dbo.DiagnosisHierarchy(DIAG_PRN_SK, DIAG_CLS_DESC)
SELECT distinct
    dh.DIAG_HIR_SK
    ,q.child
FROM
    dbo.DiagnosisHierarchy dh
    JOIN (
        SELECT
            CONCAT('L1', '_', c1.c) AS parent
            ,CONCAT('L2', '_', c1.c, '_', c2.c) AS child
        from
            #c c1,
            #c c2
    ) q
        ON dh.DIAG_CLS_DESC = q.parent
    

INSERT INTO dbo.DiagnosisHierarchy(DIAG_PRN_SK, DIAG_CLS_DESC)
SELECT distinct
    dh.DIAG_HIR_SK
    ,q.child
FROM
    dbo.DiagnosisHierarchy dh
    JOIN (
        SELECT
            CONCAT('L2', '_', c1.c, '_', c2.c) AS parent
            ,CONCAT('L3', '_', c1.c, '_', c2.c, '_', c3.c) AS child
        from
            #c c1,
            #c c2,
            #c c3
    ) q
        ON dh.DIAG_CLS_DESC = q.parent


SELECT * FROM dbo.DiagnosisHierarchy
GO
