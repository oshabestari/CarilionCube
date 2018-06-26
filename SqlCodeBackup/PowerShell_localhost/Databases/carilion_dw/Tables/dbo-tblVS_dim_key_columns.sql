SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblVS_dim_key_columns](
	[dim_key_column_id] [int] NULL,
	[dim_column_id] [int] NULL,
	[sort_order] [int] NULL,
	[DataType] [nvarchar](max) NULL,
	[TableId] [nvarchar](max) NULL,
	[ColumnID] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
