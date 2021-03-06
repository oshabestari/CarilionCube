SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblVS_dim_columns](
	[dim_column_id] [int] NOT NULL,
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
	[NameColumn_ColumnName] [nvarchar](max) NULL,
 CONSTRAINT [PK_tblVS_dim_columns] PRIMARY KEY CLUSTERED 
(
	[dim_column_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
