USE [carilion_dw]
GO
set nocount on
GO

GO
/****** Object:  StoredProcedure [dbo].[usp_PopulateTimeDimension]    Script Date: 6/21/2018 11:44:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_PopulateTimeDimension]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[usp_PopulateTimeDimension] AS' 
END
GO


ALTER PROC [dbo].[usp_PopulateTimeDimension]
as


TRUNCATE TABLE dbo.TimeDim


;WITH cte60 AS
(
    SELECT
        t.N - 1 AS N
    from
        util.Tally t
    WHERE
        t.N BETWEEN 1 AND 60
),
cte24 AS
(
    SELECT
        t.N - 1 AS N
    from
        util.Tally t
    WHERE
        t.N BETWEEN 1 AND 24
)
INSERT INTO dbo.TimeDim(TM_OF_DY_SK, TM_OF_DY, HR_OF_DY, MN_OF_DY, SCND_OF_DY)
SELECT
    TM_OF_DY_SK = H.N * 10000 + M.N * 100 + S.N
    ,TM_OF_DY   = CAST(DATETIME2FROMPARTS(2000, 1, 1, H.N, M.N, S.N, 0, 0) AS TIME(0))
    ,HR_OF_DY   = H.N
    ,MN_OF_DY   = M.N
    ,SCND_OF_DY = S.N
FROM
    cte24 AS H
    CROSS JOIN cte60 AS M
    CROSS JOIN cte60 AS S

GO
