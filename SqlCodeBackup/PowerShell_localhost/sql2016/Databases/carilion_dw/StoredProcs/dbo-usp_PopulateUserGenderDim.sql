SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROC [dbo].[usp_PopulateUserGenderDim]
as


TRUNCATE TABLE dbo.UserGenderDim


INSERT INTO dbo.UserGenderDim(SEX_DESC)
VALUES('Male'), ('Female')
GO
