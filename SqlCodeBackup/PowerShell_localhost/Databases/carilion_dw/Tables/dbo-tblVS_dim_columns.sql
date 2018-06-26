SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblVS_dim_columns](
	[dim_column_id] [int] NULL,
	[dim_table_id] [int] NULL,
	[ID] [nvarchar](max) NULL,
	[Name] [nvarchar](max) NULL,
	[Usage] [nvarchar](max) NULL,
	[OrderBy] [nvarchar](max) NULL,
	[IsKeyColumn] [bit] NULL,
	[NameColumn_DataType] [nvarchar](max) NULL,
	[NameColumn_DataSize] [nvarchar](max) NULL,
	[NameColumn_NullProcessing] [nvarchar](max) NULL,
	[NameColumn_TableName] [nvarchar](max) NULL,
	[NameColumn_ColumnName] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
