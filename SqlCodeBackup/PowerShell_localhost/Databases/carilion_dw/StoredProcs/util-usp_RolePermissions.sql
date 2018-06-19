SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [util].[usp_RolePermissions]
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
