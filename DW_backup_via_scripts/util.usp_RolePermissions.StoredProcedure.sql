USE [carilion_dw]
GO
set nocount on
GO

GO
/****** Object:  StoredProcedure [util].[usp_RolePermissions]    Script Date: 6/21/2018 11:44:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[util].[usp_RolePermissions]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [util].[usp_RolePermissions] AS' 
END
GO
ALTER PROC [util].[usp_RolePermissions]
AS


SELECT distinct
    concat('{StrToMember("', dimension_unique_name, '.[Provider - UserID].&[" + iif(isempty(customdata()) = True, username(), customdata()) + "]")}') AS allowed
    ,CONCAT('{EXCEPT(', dimension_unique_name, '.[Provider - UserID].children, StrToMember("', dimension_unique_name, '.[Provider - UserID].&[" + iif(isempty(customdata()) = True, username(), customdata()) + "]"))}') AS denied
FROM
    dbo.tblCube_Dimensions
WHERE
    dimension_master_name = 'provider'
ORDER BY
    1


SELECT distinct
    concat('{StrToMember("', dimension_unique_name, '.[User - UserID].&[" + iif(isempty(customdata()) = True, username(), customdata()) + "]")}') AS allowed
    ,CONCAT('{EXCEPT(', dimension_unique_name, '.[User - UserID].children, StrToMember("', dimension_unique_name, '.[User - UserID].&[" + iif(isempty(customdata()) = True, username(), customdata()) + "]"))}') AS denied
FROM
    dbo.tblCube_Dimensions
WHERE
    dimension_master_name = 'user'
ORDER BY
    1

GO
