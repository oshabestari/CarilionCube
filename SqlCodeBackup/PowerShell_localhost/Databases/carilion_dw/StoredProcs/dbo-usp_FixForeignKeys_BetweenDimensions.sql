SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROC [dbo].[usp_FixForeignKeys_BetweenDimensions](
    @Parent_Schema_Name     sysname 
    ,@Parent_Table_Name     sysname 
    ,@ParentKey_Column_Name sysname 
    ,@Child_Schema_Name     sysname 
    ,@Child_Table_Name      sysname 
    ,@ChildKey_Column_Name  sysname 
    ,@verbose               BIT         = 0
    )
as



DECLARE @Parent_PrimaryKey_Name sysname = (SELECT dbo.ufn_FindPrimaryKey(@Parent_Schema_Name, @Parent_Table_Name))
DECLARE @Child_PrimaryKey_Name sysname = (SELECT dbo.ufn_FindPrimaryKey(@Child_Schema_Name, @Child_Table_Name))
DECLARE @Parent_FullPath NVARCHAR(MAX) = CONCAT(@Parent_Schema_Name, '.', @Parent_Table_Name, '.', @ParentKey_Column_Name)
DECLARE @Child_FullPath NVARCHAR(MAX) = CONCAT(@Child_Schema_Name, '.', @Child_Table_Name, '.', @ChildKey_Column_Name)


IF @ChildKey_Column_Name = @Child_PrimaryKey_Name
BEGIN
    -- don't attempt to modify the primary key of the child table
    PRINT(CONCAT('Skipping: ', @Parent_FullPath, ' -> ', @Child_FullPath, '.   Child column is a primary key.'))
    return
end


-- skip self referencing hierachies, eg. 
--          EXEC dbo.usp_FixForeignKeys 'dbo', 'DiagnosisHierarchy', 'DIAG_HIR_SK', 'dbo', 'DiagnosisHierarchy', 'DIAG_PRN_SK'
IF @Parent_Schema_Name = @Child_Schema_Name AND @Parent_Table_Name = @Child_Table_Name
BEGIN
    -- skip self-referencing
    PRINT(CONCAT('Skipping: ', @Parent_FullPath, ' -> ', @Child_FullPath, 
        '.   Self referecing hierarchy. Nulls probably denote root, so leave them alone.'))
    return
end


DECLARE @template NVARCHAR(max) = 
'
DROP TABLE IF EXISTS #t

SELECT 
    p.<<ParentKey_Column_Name>> AS pk
    ,ROW_NUMBER() OVER(ORDER BY p.<<ParentKey_Column_Name>>) -1 AS join_key
INTO #t
FROM
    <<Parent_Schema_Name>>.<<Parent_Table_Name>> p
WHERE
    p.<<ParentKey_Column_Name>> IS NOT null


DECLARE @max_join_key INT = (SELECT MAX(join_key) + 1 FROM #t)



;WITH cte AS 
(
    select
        c.<<ChildKey_Column_Name>> 
        ,(ABS(CHECKSUM(*)) % @max_join_key) AS join_key
    FROM
        <<Child_Schema_Name>>.<<Child_Table_Name>> c
    where
        c.<<ChildKey_Column_Name>> IS null
        OR c.<<ChildKey_Column_Name>> NOT IN (
            SELECT 
                p.<<ParentKey_Column_Name>>
            FROM
                <<Parent_Schema_Name>>.<<Parent_Table_Name>> p
            WHERE
                p.<<ParentKey_Column_Name>> IS NOT null
        )
)
UPDATE cte
set
    cte.<<ChildKey_Column_Name>> = t.pk
FROM
    cte
    JOIN #t AS t
        ON cte.join_key = t.join_key
'


DECLARE @sql NVARCHAR(max) = REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(@template
    ,'<<Parent_Schema_Name>>', @Parent_Schema_Name)
    ,'<<Parent_Table_Name>>', @Parent_Table_Name)
    ,'<<ParentKey_Column_Name>>', @ParentKey_Column_Name)
    ,'<<Parent_PrimaryKey_Name>>', @Parent_PrimaryKey_Name)
    ,'<<Child_Schema_Name>>', @Child_Schema_Name)
    ,'<<Child_Table_Name>>', @Child_Table_Name)
    ,'<<ChildKey_Column_Name>>', @ChildKey_Column_Name)
    ,'<<Child_PrimaryKey_Name>>', @Child_PrimaryKey_Name)


IF @verbose=1
BEGIN
    PRINT(@sql)
end

declare @tblSqlCode dbo.ExecSqlStatementsTableType;
declare @GuidExecutionBatch uniqueidentifier

insert into @tblSqlCode(SqlCode)
values(@sql)


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

GO
