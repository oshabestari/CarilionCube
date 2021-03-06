SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblExecSqlStatements_Results_TableType_V01](
	[pkey] [int] IDENTITY(1,1) NOT NULL,
	[ErrorExecuting] [bit] NOT NULL,
	[ExecuteStartTime] [datetime] NULL,
	[TotalExecutionTimeSeconds] [time](0) NULL,
	[ErrorMessage] [nvarchar](max) NULL,
	[ErrorSeverity] [int] NULL,
	[ErrorState] [int] NULL,
	[SqlCode] [nvarchar](max) NULL,
	[RowId] [int] NOT NULL,
	[GuidExecutionBatch] [uniqueidentifier] NOT NULL,
	[SPID] [int] NULL,
	[RowCreatedDate] [datetime] NOT NULL,
	[Param01_BigInt] [bigint] NULL,
	[Param02_Variant] [sql_variant] NULL,
 CONSTRAINT [PK_tblExecSqlStatements_Results_TableType_V01] PRIMARY KEY CLUSTERED 
(
	[pkey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblExecSqlStatements_Results_TableType_V01] ADD  CONSTRAINT [DF_tblExecSqlStatements_Results_TableType_V01_ErrorExecuting]  DEFAULT ((0)) FOR [ErrorExecuting]
GO
ALTER TABLE [dbo].[tblExecSqlStatements_Results_TableType_V01] ADD  CONSTRAINT [DF_tblExecSqlStatements_Results_TableType_V01_RowCreatedDate]  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
