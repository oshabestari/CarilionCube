USE [carilion_dw]
GO
set nocount on
GO

GO
/****** Object:  StoredProcedure [dbo].[usp_DropAllForeignKeyConstraints]    Script Date: 6/21/2018 11:44:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_DropAllForeignKeyConstraints]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[usp_DropAllForeignKeyConstraints] AS' 
END
GO





ALTER proc [dbo].[usp_DropAllForeignKeyConstraints](
	@verbose bit = 0
	)
as



declare @tblSqlCode dbo.ExecSqlStatementsTableType
DECLARE @GuidExecutionBatch uniqueidentifier

insert into @tblSqlCode(SqlCode)
SELECT 'ALTER TABLE [' + TABLE_SCHEMA + '].[' + TABLE_NAME + '] DROP CONSTRAINT [' + CONSTRAINT_NAME +']'
FROM information_schema.table_constraints
WHERE CONSTRAINT_TYPE = 'FOREIGN KEY' 
	--and (Table_Name like 'fact%' OR Table_Name like 'map%' OR Table_Name like 'matrix%')


exec dbo.usp_ExecSqlStatements 
    @TableSqlCode = @tblSqlCode
    ,@verbose = @verbose
    ,@GuidExecutionBatch = @GuidExecutionBatch output


GO
