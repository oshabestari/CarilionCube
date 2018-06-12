CREATE TYPE [dbo].[ExecSqlStatementsTableType] AS TABLE(
	[RowId] [int] IDENTITY(1,1) NOT NULL,
	[SqlCode] [nvarchar](max) NOT NULL,
	[Param01_BigInt] [bigint] NULL,
	[Param02_Variant] [sql_variant] NULL
)
GO
