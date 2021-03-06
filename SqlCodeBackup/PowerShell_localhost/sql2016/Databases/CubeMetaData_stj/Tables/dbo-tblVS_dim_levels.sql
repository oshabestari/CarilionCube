SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblVS_dim_levels](
	[dim_level_id] [int] IDENTITY(1,1) NOT NULL,
	[dim_hierarchy_id] [int] NULL,
	[sort_order] [int] NULL,
	[ID] [nvarchar](max) NULL,
	[Name] [nvarchar](max) NULL,
	[ColumnName] [nvarchar](max) NULL,
 CONSTRAINT [PK_tblVS_dim_levels] PRIMARY KEY CLUSTERED 
(
	[dim_level_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
