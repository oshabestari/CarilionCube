USE [carilion_dw]
GO
set nocount on
GO

GO
/****** Object:  StoredProcedure [dbo].[usp_FixForeignKeys]    Script Date: 6/21/2018 11:44:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_FixForeignKeys]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[usp_FixForeignKeys] AS' 
END
GO




ALTER PROC [dbo].[usp_FixForeignKeys](
    @Parent_Schema_Name     sysname 
    ,@Parent_Table_Name     sysname 
    ,@ParentKey_Column_Name sysname 
    ,@Child_Schema_Name     sysname 
    ,@Child_Table_Name      sysname 
    ,@ChildKey_Column_Name  sysname 
    ,@verbose               BIT         = 0
    )
as

DECLARE @Parent_FullPath NVARCHAR(MAX) = CONCAT_WS('.', @Parent_Schema_Name, @Parent_Table_Name, @ParentKey_Column_Name)
DECLARE @Child_FullPath NVARCHAR(MAX) = CONCAT_WS('.', @Child_Schema_Name, @Child_Table_Name, @ChildKey_Column_Name)


IF (
        @Parent_Table_Name like '%Dim' or
        @Parent_Table_Name LIKE '%Hierarchy' OR
        @Parent_Table_Name IN ('EDVisitFinancialClass', 'ProcedureOrderSetDm')
    ) AND  (
        RIGHT(@Child_Table_Name, 3) = 'Dim' or
        @Child_Table_Name LIKE '%Hierarchy' OR
        @Child_Table_Name IN ('EDVisitFinancialClass', 'ProcedureOrderSetDm')
    )
BEGIN
    PRINT 'fix Dims'
    EXEC dbo.usp_FixForeignKeys_BetweenDimensions 
        @Parent_Schema_Name, 
        @Parent_Table_Name, 
        @ParentKey_Column_Name, 
        @Child_Schema_Name, 
        @Child_Table_Name,
        @ChildKey_Column_Name,
        @verbose
        
    RETURN
END
ELSE IF (
        @Parent_Table_Name like '%Dim' or
        @Parent_Table_Name LIKE '%Bridge' or
        @Parent_Table_Name LIKE '%Fact' or
        @Parent_Table_Name LIKE '%Hierarchy' OR
        @Parent_Table_Name IN ('EDVisitFinancialClass', 'ProcedureOrderSetDm')
    ) AND  (
        @Child_Table_Name like '%Fact' OR
        @Child_Table_Name LIKE '%Bridge'
    ) 
BEGIN
    PRINT 'fix Dims-Facts'
    EXEC dbo.usp_FixForeignKeys_FactsDimensions 
        @Parent_Schema_Name, 
        @Parent_Table_Name, 
        @ParentKey_Column_Name, 
        @Child_Schema_Name, 
        @Child_Table_Name,
        @ChildKey_Column_Name,
        @verbose

    return
END


DECLARE @err NVARCHAR(2000) = CONCAT('Unhandled condition in [dbo].[usp_FixForeignKeys] between ', @Parent_FullPath, ' -> ', @Child_FullPath)
RAISERROR(@err, 18, 0)

GO
