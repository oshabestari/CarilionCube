USE [carilion_dw]
GO
set nocount on
GO

GO
/****** Object:  UserDefinedTableType [dbo].[ExecSqlStatementsTableType]    Script Date: 6/21/2018 11:44:21 ******/
IF NOT EXISTS (SELECT * FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id WHERE st.name = N'ExecSqlStatementsTableType' AND ss.name = N'dbo')
CREATE TYPE [dbo].[ExecSqlStatementsTableType] AS TABLE(
	[RowId] [int] IDENTITY(1,1) NOT NULL,
	[SqlCode] [nvarchar](max) NOT NULL,
	[Param01_BigInt] [bigint] NULL,
	[Param02_Variant] [sql_variant] NULL
)
GO
