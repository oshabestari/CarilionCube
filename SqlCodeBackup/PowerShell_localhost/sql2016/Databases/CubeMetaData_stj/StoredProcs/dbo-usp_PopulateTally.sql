SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROC [dbo].[usp_PopulateTally]
AS


TRUNCATE TABLE util.Tally


INSERT INTO util.Tally(N)
SELECT TOP(1000000) 
    ROW_NUMBER() OVER(ORDER BY (SELECT NULL)) AS [N]
FROM 
    dbo.syscolumns tb1,dbo.syscolumns tb2
GO
