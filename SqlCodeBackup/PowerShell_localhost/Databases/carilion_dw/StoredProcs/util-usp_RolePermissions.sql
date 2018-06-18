SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC util.usp_RolePermissions
AS


SELECT distinct
    concat('{StrToMember("', dimension_unique_name, '.[Provider - UserID].&[" + iif(isempty(customdata()) = True, username(), customdata()) + "]")}') AS a
FROM
    dbo.tblCube_Dimensions
WHERE
    dimension_master_name = 'provider'
ORDER BY
    a


SELECT distinct
    concat('{StrToMember("', dimension_unique_name, '.[Provider - UserID].&[" + iif(isempty(customdata()) = True, username(), customdata()) + "]")}') AS a
FROM
    dbo.tblCube_Dimensions
WHERE
    dimension_master_name = 'user'
ORDER BY
    a

GO
