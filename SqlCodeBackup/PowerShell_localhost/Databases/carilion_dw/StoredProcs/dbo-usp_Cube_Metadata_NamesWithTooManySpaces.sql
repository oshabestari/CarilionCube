SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE proc [dbo].[usp_Cube_Metadata_NamesWithTooManySpaces]
as


set nocount on


drop table if exists #t

create table #t(
    duplicate_spaces nvarchar(max),
    single_space nvarchar(max),
    hashcode binary(64)
)
CREATE UNIQUE NONCLUSTERED INDEX [IX_UniqueColNames] ON #t
(
	hashcode ASC
) WITH IGNORE_DUP_KEY



declare @template varchar(max) = 
'
;with cte as 
(
select distinct
    cast([<<column_name>>] as varchar(max)) as duplicate_spaces
    ,replace(replace(replace(cast([<<column_name>>] as varchar(max)), ''  '', '' ''), ''  '', '' ''), ''  '', '' '') as single_space
from
    dbo.<<table_name>>
where
    [<<column_name>>] like ''%  %''
)
insert into #t(duplicate_spaces, single_space, hashcode)
select
    duplicate_spaces
    ,single_space
    ,hashbytes(''SHA2_512'',concat(upper(duplicate_spaces),''~|@'',upper(single_space)))
from
    cte
'
   


declare @tblSqlCode dbo.ExecSqlStatementsTableType;
declare @GuidExecutionBatch uniqueidentifier

insert into @tblSqlCode(SqlCode)
select
    REPLACE(REPLACE(@template, '<<table_name>>', c.table_name),
         '<<column_name>>', c.COLUMN_NAME)
    --*
from
    information_schema.columns c
where
    c.TABLE_NAME like 'tblCube%'
    and (
        c.COLUMN_NAME like '%name'
        or c.COLUMN_NAME like '%caption'
    )
    and c.COLUMN_NAME not like '%unique%'
    and c.COLUMN_NAME not like '%\_sql\_%' escape '\'


exec dbo.usp_ExecSqlStatements @TableSqlCode=@tblSqlCode
	,@verbose = 0
	,@ExecSql = 1
	,@UseTransactions = 0
	,@StopOnError = 1
	,@RaiseError = 0
    ,@GuidExecutionBatch = @GuidExecutionBatch output

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


IF EXISTS(SELECT TOP 1 1 FROM dbo.tblExecSqlStatements_Results_TableType_V01 r WHERE r.GuidExecutionBatch = @GuidExecutionBatch and r.ErrorExecuting = 1)
BEGIN
    --RAISERROR('Error executing code', 18, 0)
	print 'Error detected'
end



select
    *
from
    #t
order by 1



GO
