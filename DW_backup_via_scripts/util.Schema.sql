USE [carilion_dw]
GO
set nocount on
GO

GO
/****** Object:  Schema [util]    Script Date: 6/21/2018 11:44:21 ******/
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'util')
EXEC sys.sp_executesql N'CREATE SCHEMA [util]'
GO
