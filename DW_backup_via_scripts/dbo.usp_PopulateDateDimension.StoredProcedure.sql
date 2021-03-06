USE [carilion_dw]
GO
set nocount on
GO

GO
/****** Object:  StoredProcedure [dbo].[usp_PopulateDateDimension]    Script Date: 6/21/2018 11:44:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_PopulateDateDimension]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[usp_PopulateDateDimension] AS' 
END
GO


ALTER PROC [dbo].[usp_PopulateDateDimension]
as

DECLARE @start_date DATE = '1/1/2010'
DECLARE @end_date DATE = '12/31/2018'
DECLARE @cache_dt_1970_01_01 BIGINT = 83642

DROP TABLE IF EXISTS #dates

SELECT
    DATEADD(DAY, t.N-1, @start_date) AS TmpDate
    ,DATEADD(YEAR, -1, DATEADD(DAY, t.N-1, @start_date)) AS PrevYearDate
    ,dbo.ufn_DateToUnixEpochTimestamp(DATEADD(DAY, t.N-1, @start_date)) AS epoch          
    ,CAST(NULL AS INT) as FiscalYear
    ,CAST(NULL AS INT) as FiscalQuarter
    ,CAST(NULL AS INT) as FiscalMonth
    ,CAST(null AS date) as FiscalYear_Begin
    ,CAST(null AS date) as FiscalYear_End
    ,CAST(null AS date) as FiscalQuarter_Begin
    ,CAST(null AS date) as FiscalQuarter_End
INTO #dates
from
    util.Tally t
WHERE
    --t.N BETWEEN 1 AND 365
    t.N BETWEEN 1 AND DATEDIFF(DAY, @start_date, @end_date)+1

UPDATE #dates
SET
    FiscalYear = DATEPART(YEAR, dateadd(MONTH, 3, dbo.ufn_BOMONTH(TmpDate)))
    ,FiscalQuarter = DATEPART(QUARTER, dateadd(MONTH, 3, dbo.ufn_BOMONTH(TmpDate)))
    ,FiscalMonth = (MONTH(TmpDate) + 3 -1) % 12 +1

UPDATE #dates
SET
    FiscalYear_Begin = DATEADD(MONTH, -3, DATEFROMPARTS(FiscalYear, 1, 1))
    ,FiscalYear_End = DATEFROMPARTS(FiscalYear, 9, 30)

UPDATE #dates
SET
    FiscalQuarter_Begin = DATEADD(QUARTER, FiscalQuarter -1, FiscalYear_Begin)
    ,FiscalQuarter_End = DATEADD(DAY, -1, DATEADD(QUARTER, FiscalQuarter, FiscalYear_Begin))


-- SELECT * FROM #dates ORDER BY TmpDate

TRUNCATE TABLE dbo.DateDim

INSERT INTO dbo.DateDim(
CLNDR_DT, CLNDR_SK, CLNDR_DT_EPOCH, CLNDR_DT_FL_NM, CLNDR_DT_ABBR, CLNDR_CACHE_DT, YR_NUM, MTH_OF_YR_NUM, MTH_OF_YR_ABBR, MTH_OF_YR_NM, YR_AND_MTH_NUM, YR_AND_MTH_ABBR, YR_AND_MTH_NM, QTR_OF_YR_NUM, QTR_OF_YR_ABBR, YR_AND_QTR_NUM, YR_AND_QTR_ABBR, DY_OF_YR_NUM, DY_OF_MTH_NUM, DY_OF_WK_NUM, DY_OF_WK_ABBR, DY_OF_WK_NM, WK_OF_YR_NUM, PR_YR_NUM, PR_MTH_OF_YR_NUM, PR_MTH_OF_YR_ABBR, PR_MTH_OF_YR_NM, PR_YR_AND_MTH_NUM, PR_YR_AND_MTH_ABBR, PR_YR_AND_MTH_NM, PR_QTR_OF_YR_NUM, PR_QTR_OF_YR_ABBR, PR_YR_AND_QTR_NUM, PR_YR_AND_QTR_ABBR, FSCL_YR_NUM, FSCL_YR_BGN_DT, FSCL_YR_END_DT, FSCL_QTR_NUM, FSCL_QTR_ABBR, FSCL_QTR_BGN_DT, FSCL_QTR_END_DT, FSCL_MTH_NUM
)
SELECT 
	CLNDR_DT            = d.TmpDate
	,CLNDR_SK           = d.epoch
	,CLNDR_DT_EPOCH     = d.epoch
	,CLNDR_DT_FL_NM     = CONVERT(VARCHAR, d.TmpDate, 103)
	,CLNDR_DT_ABBR      = CONVERT(VARCHAR, d.TmpDate, 100)
	,CLNDR_CACHE_DT     = @cache_dt_1970_01_01 + DATEDIFF(DAY, '1/1/1970', d.TmpDate)
	,YR_NUM             = DATEPART(YEAR, d.TmpDate)
	,MTH_OF_YR_NUM      = DATEPART(MONTH, d.TmpDate)
	,MTH_OF_YR_ABBR     = UPPER(LEFT(DATENAME(MONTH, d.TmpDate), 3))
	,MTH_OF_YR_NM       = DATEPART(MONTH, d.TmpDate)
	,YR_AND_MTH_NUM     = DATEPART(YEAR, d.TmpDate) * 100 + DATEPART(MONTH, d.TmpDate)
	,YR_AND_MTH_ABBR    = LEFT(DATENAME(MONTH, d.TmpDate), 3) + '-' + RIGHT(DATENAME(YEAR, d.TmpDate), 2)
	,YR_AND_MTH_NM      = DATENAME(MONTH, d.TmpDate) + '-' + RIGHT(DATENAME(YEAR, d.TmpDate), 2)
	,QTR_OF_YR_NUM      = DATEPART(QUARTER, d.TmpDate)
	,QTR_OF_YR_ABBR     = 'Q' + DATENAME(QUARTER, d.TmpDate)
	,YR_AND_QTR_NUM     = DATEPART(YEAR, d.TmpDate) * 10 + DATEPART(QUARTER, d.TmpDate)
	,YR_AND_QTR_ABBR    = DATENAME(YEAR, d.TmpDate) + 'Q' + DATENAME(QUARTER, d.TmpDate)
	,DY_OF_YR_NUM       = DATEPART(DAYOFYEAR, d.TmpDate)
	,DY_OF_MTH_NUM      = DATEPART(DAY, d.TmpDate)
	,DY_OF_WK_NUM       = DATEPART(WEEKDAY, d.TmpDate)
	,DY_OF_WK_ABBR      = LEFT(DATENAME(WEEKDAY, d.TmpDate), 3)
	,DY_OF_WK_NM        = DATENAME(WEEKDAY, d.TmpDate)
	,WK_OF_YR_NUM       = DATEPART(WEEK, d.TmpDate)
	,PR_YR_NUM          = DATEPART(YEAR, d.PrevYearDate)
	,PR_MTH_OF_YR_NUM   = DATEPART(MONTH, d.PrevYearDate)
	,PR_MTH_OF_YR_ABBR  = LEFT(DATENAME(MONTH, d.PrevYearDate), 3)
	,PR_MTH_OF_YR_NM    = DATEPART(MONTH, d.PrevYearDate)
	,PR_YR_AND_MTH_NUM  = DATEPART(YEAR, d.PrevYearDate) * 100 + DATEPART(MONTH, d.PrevYearDate)
	,PR_YR_AND_MTH_ABBR = LEFT(DATENAME(MONTH, d.PrevYearDate), 3) + '-' + RIGHT(DATENAME(YEAR, d.PrevYearDate), 2)
	,PR_YR_AND_MTH_NM   = DATENAME(MONTH, d.PrevYearDate) + '-' + RIGHT(DATENAME(YEAR, d.PrevYearDate), 2)
	,PR_QTR_OF_YR_NUM   = DATEPART(QUARTER, d.PrevYearDate)
	,PR_QTR_OF_YR_ABBR  = 'Q' + DATENAME(QUARTER, d.PrevYearDate)
	,PR_YR_AND_QTR_NUM  = DATEPART(YEAR, d.PrevYearDate) * 10 + DATEPART(QUARTER, d.PrevYearDate)
	,PR_YR_AND_QTR_ABBR = DATENAME(YEAR, d.PrevYearDate) + 'Q' + DATENAME(QUARTER, d.PrevYearDate)
	,FSCL_YR_NUM        = d.FiscalYear
	,FSCL_YR_BGN_DT     = d.FiscalYear_Begin
	,FSCL_YR_END_DT     = d.FiscalYear_End
	,FSCL_QTR_NUM       = d.FiscalQuarter
	,FSCL_QTR_ABBR      = CONCAT('Q', d.FiscalQuarter)
	,FSCL_QTR_BGN_DT    = d.FiscalQuarter_Begin
	,FSCL_QTR_END_DT    = d.FiscalQuarter_End
	,FSCL_MTH_NUM       = d.FiscalMonth
FROM
    #dates d
GO
