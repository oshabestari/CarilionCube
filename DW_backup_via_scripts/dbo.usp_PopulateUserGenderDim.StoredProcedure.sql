USE [carilion_dw]
GO
set nocount on
GO

GO
/****** Object:  StoredProcedure [dbo].[usp_PopulateUserGenderDim]    Script Date: 6/21/2018 11:44:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_PopulateUserGenderDim]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[usp_PopulateUserGenderDim] AS' 
END
GO


ALTER PROC [dbo].[usp_PopulateUserGenderDim]
as


TRUNCATE TABLE dbo.UserGenderDim


INSERT INTO dbo.UserGenderDim(SEX_DESC)
VALUES('Male'), ('Female')
GO
