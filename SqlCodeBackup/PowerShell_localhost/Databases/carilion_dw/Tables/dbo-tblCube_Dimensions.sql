SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCube_Dimensions](
	[cube_name] [nvarchar](4000) NULL,
	[dimension_name] [nvarchar](4000) NULL,
	[dimension_unique_name] [nvarchar](4000) NULL,
	[dimension_caption] [nvarchar](4000) NULL,
	[default_hierarchy] [nvarchar](4000) NULL,
	[description] [nvarchar](4000) NULL,
	[dimension_master_name] [nvarchar](4000) NULL,
	[dimension_ordinal] [numeric](10, 0) NULL,
	[dimension_type] [smallint] NULL,
	[dimension_cardinality] [numeric](10, 0) NULL,
	[is_virtual] [bit] NULL,
	[is_readwrite] [bit] NULL,
	[dimension_unique_settings] [int] NULL,
	[dimension_is_visible] [bit] NULL
) ON [PRIMARY]
GO
