USE [carilion_dw]
GO
set nocount on
GO

GO
/****** Object:  StoredProcedure [util].[usp_FixData_LDAP_Values]    Script Date: 6/21/2018 11:44:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[util].[usp_FixData_LDAP_Values]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [util].[usp_FixData_LDAP_Values] AS' 
END
GO


ALTER PROC [util].[usp_FixData_LDAP_Values]
as


UPDATE [dbo].UserDim
SET LDAP_USR = NEWID()



;WITH cteP AS
(
    SELECT 
        PROVDR_SK
        ,LDAP_USR
        ,ROW_NUMBER() OVER(ORDER BY PROVDR_SK) rn
    FROM [dbo].ProviderDim
),
cteU AS 
(
    SELECT 
        USR_SK
        ,LDAP_USR
        ,ROW_NUMBER() OVER(ORDER BY USR_SK) rn
    FROM [dbo].UserDim
)
UPDATE cteP
SET
    ctep.LDAP_USR = cteU.LDAP_USR
FROM
    cteP
    JOIN cteU
        ON cteU.rn = cteP.rn


TRUNCATE TABLE dbo.LDAP_Dim
TRUNCATE TABLE dbo.LDAP_UserProvider_ReportingBridge


MERGE dbo.LDAP_Dim AS Tgt
USING dbo.UserDim AS Src
ON Src.LDAP_USR = Tgt.LDAP_USR
WHEN NOT MATCHED BY TARGET then
    INSERT(LDAP_USR) VALUES(Src.LDAP_USR)
;


MERGE dbo.LDAP_UserProvider_ReportingBridge AS Tgt
USING dbo.UserDim AS Src
ON Src.LDAP_USR = Tgt.LDAP_USR_Parent
    AND src.LDAP_USR = Tgt.LDAP_USR_Child
WHEN NOT MATCHED BY TARGET then
    INSERT(LDAP_USR_Parent, LDAP_USR_Child) VALUES(Src.LDAP_USR, Src.LDAP_USR)
;



;WITH cte AS
(
SELECT 
    PROVDR_SK
    ,LDAP_USR
FROM 
    dbo.ProviderDim
), cte2 AS
(
SELECT
    c1.LDAP_USR AS LDAP_USR_PARENT
    ,c2.LDAP_USR AS LDAP_USR_CHILD
FROM
    cte c1
    JOIN cte c2
        ON c2.PROVDR_SK > c1.PROVDR_SK
--ORDER BY 
--    c1.PROVDR_SK
--    ,c2.PROVDR_SK
)
MERGE dbo.LDAP_UserProvider_ReportingBridge AS Tgt
USING cte2 AS Src
ON Src.LDAP_USR_Parent = Tgt.LDAP_USR_Parent
    AND src.LDAP_USR_Child = Tgt.LDAP_USR_Child
WHEN NOT MATCHED BY TARGET then
    INSERT(LDAP_USR_Parent, LDAP_USR_Child) VALUES(Src.LDAP_USR_Parent, Src.LDAP_USR_Child)
;




GO
