SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCube_Hierarchies](
	[cube_name] [nvarchar](4000) NULL,
	[dimension_unique_name] [nvarchar](4000) NULL,
	[hierarchy_name] [nvarchar](4000) NULL,
	[hierarchy_unique_name] [nvarchar](4000) NULL,
	[hierarchy_caption] [nvarchar](4000) NULL,
	[dimension_type] [smallint] NULL,
	[hierarchy_cardinality] [numeric](10, 0) NULL,
	[default_member] [nvarchar](4000) NULL,
	[all_member] [nvarchar](4000) NULL,
	[description] [nvarchar](4000) NULL,
	[structure] [smallint] NULL,
	[is_virtual] [bit] NULL,
	[is_readwrite] [bit] NULL,
	[dimension_unique_settings] [int] NULL,
	[dimension_master_unique_name] [nvarchar](4000) NULL,
	[dimension_is_visible] [bit] NULL,
	[hierarchy_ordinal] [numeric](10, 0) NULL,
	[dimension_is_shared] [bit] NULL,
	[hierarchy_is_visible] [bit] NULL,
	[hierarchy_origin] [numeric](5, 0) NULL,
	[hierarchy_display_folder] [nvarchar](4000) NULL,
	[instance_selection] [numeric](5, 0) NULL,
	[grouping_behavior] [numeric](5, 0) NULL,
	[structure_type] [nvarchar](4000) NULL
) ON [PRIMARY]
GO
