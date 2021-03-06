USE [carilion_dw]
GO
set nocount on
GO

GO
/****** Object:  StoredProcedure [util].[usp_FixData_LabTestFact]    Script Date: 6/21/2018 11:44:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[util].[usp_FixData_LabTestFact]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [util].[usp_FixData_LabTestFact] AS' 
END
GO


ALTER PROC [util].[usp_FixData_LabTestFact]
as

/*
SELECT 
    c.TABLE_NAME
    ,c.COLUMN_NAME
FROM
    INFORMATION_SCHEMA.COLUMNS c
WHERE
    (
        c.COLUMN_NAME LIKE '%usr_sk%'
        OR c.COLUMN_NAME LIKE '%PROVDR_SK%'
    ) 
    AND (
        c.TABLE_NAME NOT IN ('UserDim', 'ProviderDim')
        AND c.TABLE_NAME = 'LabTestFact'
    )


;WITH c AS 
(
SELECT 
    [LAB_TST_FACT_SK]
    ,ROW_NUMBER() OVER(ORDER BY LAB_TST_FACT_SK) AS RN
FROM
    dbo.LabTestFact
)
UPDATE c
   SET [LAB_TST_FACT_SK] = RN
 


*/


DROP TABLE IF EXISTS #t
DROP TABLE IF EXISTS #t2

SELECT 
    t.N 
INTO #t
FROM 
    util.Tally t
WHERE
    t.N BETWEEN 2 AND 3
--UNION ALL
--SELECT 
--    NULL AS N


SELECT
     AUTH_PROVDR_SK.N       as AUTH_PROVDR_SK
    ,CLCT_USR_SK.N          as CLCT_USR_SK
    ,FRST_FNL_VRFY_USR_SK.N as FRST_FNL_VRFY_USR_SK
    ,FRST_VRFY_USR_SK.N     as FRST_VRFY_USR_SK
    ,LST_FNL_VRFY_USR_SK.N  as LST_FNL_VRFY_USR_SK
    ,FRST_CORR_USR_SK.N     as FRST_CORR_USR_SK
    ,LST_CORR_USR_SK.N      as LST_CORR_USR_SK
    ,ROW_NUMBER() OVER(ORDER BY AUTH_PROVDR_SK.N, CLCT_USR_SK.N, FRST_CORR_USR_SK.N, FRST_FNL_VRFY_USR_SK.N, LST_CORR_USR_SK.N, LST_FNL_VRFY_USR_SK.N) AS rn
INTO #t2
FROM
     #t AS AUTH_PROVDR_SK
    ,#t AS CLCT_USR_SK
    ,#t AS FRST_FNL_VRFY_USR_SK
    ,#t AS FRST_VRFY_USR_SK
    ,#t AS LST_FNL_VRFY_USR_SK
    ,#t AS FRST_CORR_USR_SK
    ,#t AS LST_CORR_USR_SK
WHERE
    NOT (
        AUTH_PROVDR_SK.N       is null and 
        CLCT_USR_SK.N          is null and 
        FRST_FNL_VRFY_USR_SK.N is null and 
        FRST_VRFY_USR_SK.N     is null and 
        LST_FNL_VRFY_USR_SK.N  is null and 
        FRST_CORR_USR_SK.N     is null and 
        LST_CORR_USR_SK.N      is null
    )

--  select * from #t2



;WITH cte AS 
(
SELECT TOP(127)
     AUTH_PROVDR_SK
    ,CLCT_USR_SK
    ,FRST_FNL_VRFY_USR_SK
    ,FRST_VRFY_USR_SK
    ,LST_FNL_VRFY_USR_SK
    ,FRST_CORR_USR_SK
    ,LST_CORR_USR_SK
    ,f.LAB_TST_FACT_SK AS rn
FROM
    dbo.LabTestFact f
)
UPDATE cte
SET
     cte.AUTH_PROVDR_SK         = #t2.AUTH_PROVDR_SK
    ,cte.CLCT_USR_SK            = #t2.CLCT_USR_SK
    ,cte.FRST_FNL_VRFY_USR_SK   = #t2.FRST_FNL_VRFY_USR_SK
    ,cte.FRST_VRFY_USR_SK       = #t2.FRST_VRFY_USR_SK
    ,cte.LST_FNL_VRFY_USR_SK    = #t2.LST_FNL_VRFY_USR_SK
    ,cte.FRST_CORR_USR_SK       = #t2.FRST_CORR_USR_SK
    ,cte.LST_CORR_USR_SK        = #t2.LST_CORR_USR_SK
FROM
    cte
    JOIN #t2
        ON #t2.rn = cte.rn
GO
