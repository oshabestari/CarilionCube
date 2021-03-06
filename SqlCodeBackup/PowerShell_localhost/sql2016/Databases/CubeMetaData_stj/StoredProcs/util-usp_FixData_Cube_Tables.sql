SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE proc [util].[usp_FixData_Cube_Tables]
as



declare @template varchar(max) =
'
update <<table_schema>>.<<table_name>>
set
    <<column_name>> = null
where
    <<column_name>> = ''''
'


declare @tblSqlCode dbo.ExecSqlStatementsTableType;
declare @GuidExecutionBatch uniqueidentifier


;with cte as 
(
    select
         quotename( table_schema ) as table_schema
        ,quotename( table_name   ) as table_name  
        ,quotename( column_name  ) as column_name 
    from
        INFORMATION_SCHEMA.COLUMNS c
    where
        c.TABLE_NAME like 'tblCube%'
        and c.DATA_TYPE in ('varchar', 'nvarchar')
)
insert into @tblSqlCode(SqlCode)
select
    REPLACE(REPLACE(REPLACE(@template, 
        '<<table_schema>>', table_schema),
        '<<table_name>>',   table_name),
        '<<column_name>>',  column_name)
from
    cte



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
