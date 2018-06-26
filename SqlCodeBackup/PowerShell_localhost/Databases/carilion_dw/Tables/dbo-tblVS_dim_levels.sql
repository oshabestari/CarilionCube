SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblVS_dim_levels](
	[dim_level_id] [int] NULL,
	[dim_hierarchy_id] [int] NULL,
	[sort_order] [int] NULL,
	[ID] [nvarchar](max) NULL,
	[Name] [nvarchar](max) NULL,
	[ColumnName] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
