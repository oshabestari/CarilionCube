SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ARITHABORT ON
GO
CREATE TABLE [dbo].[tblCube_Hierarchies](
	[cube_name] [nvarchar](4000) NULL,
	[dimension_unique_name] [nvarchar](4000) NULL,
	[hierarchy_name] [nvarchar](4000) NULL,
	[hierarchy_unique_name] [nvarchar](4000) NULL,
	[hierarchy_caption] [nvarchar](4000) NULL,
	[dimension_type] [smallint] NULL,
	[hierarchy_cardinality] [int] NULL,
	[default_member] [nvarchar](4000) NULL,
	[all_member] [nvarchar](4000) NULL,
	[description] [nvarchar](4000) NULL,
	[structure] [smallint] NULL,
	[is_virtual] [bit] NULL,
	[is_readwrite] [bit] NULL,
	[dimension_unique_settings] [int] NULL,
	[dimension_master_unique_name] [nvarchar](4000) NULL,
	[dimension_is_visible] [bit] NULL,
	[hierarchy_ordinal] [int] NULL,
	[dimension_is_shared] [bit] NULL,
	[hierarchy_is_visible] [bit] NULL,
	[hierarchy_origin] [int] NULL,
	[hierarchy_display_folder] [nvarchar](4000) NULL,
	[instance_selection] [int] NULL,
	[grouping_behavior] [int] NULL,
	[structure_type] [nvarchar](4000) NULL,
	[pkey]  AS (isnull(hashbytes('SHA2_512',concat([cube_name],[hierarchy_unique_name])),(0))) PERSISTED NOT NULL,
 CONSTRAINT [PK_tblCube_Hierarchies] PRIMARY KEY CLUSTERED 
(
	[pkey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
