SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblVS_dim_key_columns](
	[dim_key_column_id] [int] IDENTITY(1,1) NOT NULL,
	[dim_column_id] [int] NULL,
	[sort_order] [int] NULL,
	[DataType] [nvarchar](max) NULL,
	[TableId] [nvarchar](max) NULL,
	[ColumnID] [nvarchar](max) NULL,
 CONSTRAINT [PK_tblVS_dim_key_columns] PRIMARY KEY CLUSTERED 
(
	[dim_key_column_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
