SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblVS_dim_hierarchies](
	[dim_hierarchy_id] [int] NULL,
	[dim_table_id] [int] NULL,
	[sort_order] [int] NULL,
	[ID] [nvarchar](max) NULL,
	[Name] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
