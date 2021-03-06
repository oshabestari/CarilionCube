USE [carilion_dw]
GO
set nocount on
GO

GO
/****** Object:  StoredProcedure [dbo].[usp_PopulateTally]    Script Date: 6/21/2018 11:44:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_PopulateTally]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[usp_PopulateTally] AS' 
END
GO


ALTER PROC [dbo].[usp_PopulateTally]
AS


TRUNCATE TABLE util.Tally


INSERT INTO util.Tally(N)
SELECT TOP(1000000) 
    ROW_NUMBER() OVER(ORDER BY (SELECT NULL)) AS [N]
FROM 
    dbo.syscolumns tb1,dbo.syscolumns tb2    



GO
