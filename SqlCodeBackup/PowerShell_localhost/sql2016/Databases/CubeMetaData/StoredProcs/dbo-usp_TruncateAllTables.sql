SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE proc dbo.usp_TruncateAllTables
as

truncate table [dbo].[tblExecSqlStatements_Results_TableType_V01]




declare @tblSqlCode dbo.ExecSqlStatementsTableType;
declare @GuidExecutionBatch uniqueidentifier

insert into @tblSqlCode(SqlCode)
select
    concat('truncate table ', QUOTENAME(t.table_schema), '.', quotename(t.table_name))
from
    INFORMATION_SCHEMA.TABLES t
where
    t.TABLE_TYPE = 'base table'

exec dbo.usp_ExecSqlStatements @TableSqlCode=@tblSqlCode
	,@verbose = 0
	,@ExecSql = 1
	,@UseTransactions = 0
	,@StopOnError = 1
	,@RaiseError = 0
    ,@GuidExecutionBatch = @GuidExecutionBatch output

IF EXISTS(SELECT TOP 1 1 FROM dbo.tblExecSqlStatements_Results_TableType_V01 r WHERE r.GuidExecutionBatch = @GuidExecutionBatch and r.ErrorExecuting = 1)
BEGIN
    SELECT 
	     r.RowId
	    ,r.SqlCode
	    ,r.ExecuteStartTime 
	    ,r.TotalExecutionTimeSeconds 
	    ,r.ErrorExecuting
	    ,r.ErrorMessage 
	    ,r.ErrorSeverity 
	    ,r.ErrorState
        ,r.*
    FROM 
	    dbo.tblExecSqlStatements_Results_TableType_V01 r
    where
        r.GuidExecutionBatch = @GuidExecutionBatch
        and r.ErrorExecuting = 1

    --RAISERROR('Error executing code', 18, 0)
	print 'Error detected'
end



GO
