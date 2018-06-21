USE [carilion_dw]
GO
set nocount on
GO

GO
/****** Object:  Table [dbo].[tblCube_Usage_Between_Dimensions_And_Facts]    Script Date: 6/21/2018 11:44:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblCube_Usage_Between_Dimensions_And_Facts]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tblCube_Usage_Between_Dimensions_And_Facts](
	[cube_name] [nvarchar](4000) NULL,
	[measuregroup_name] [nvarchar](4000) NULL,
	[measure_display_folder] [nvarchar](4000) NULL,
	[measure_name] [nvarchar](4000) NULL,
	[measure_unique_name] [nvarchar](4000) NULL,
	[measure_caption] [nvarchar](4000) NULL,
	[measure_is_visible] [bit] NULL,
	[type_name] [nvarchar](4000) NOT NULL,
	[measure_aggregator_name] [nvarchar](18) NULL,
	[expression] [nvarchar](4000) NULL,
	[default_format_string] [nvarchar](4000) NULL,
	[does_measure_caption_match_measure_name] [int] NOT NULL,
	[measuregroup_cardinality] [nvarchar](4000) NULL,
	[dimension_unique_name] [nvarchar](4000) NULL,
	[dimension_granularity] [nvarchar](4000) NULL,
	[dimension_cardinality] [nvarchar](4000) NULL,
	[dimension_is_visible] [bit] NULL,
	[dimension_is_fact_dimension] [bit] NULL,
	[hierarchy_name] [nvarchar](4000) NULL,
	[hierarchy_unique_name] [nvarchar](4000) NULL,
	[hierarchy_caption] [nvarchar](4000) NULL,
	[dimension_type_name] [nvarchar](28) NOT NULL,
	[hierarchy_cardinality] [numeric](10, 0) NULL,
	[default_member] [nvarchar](4000) NULL,
	[all_member] [nvarchar](4000) NULL,
	[hierarchy_ordinal] [numeric](10, 0) NULL,
	[dimension_is_shared] [bit] NULL,
	[hierarchy_is_visible] [bit] NULL,
	[hierarchy_origin] [numeric](5, 0) NULL,
	[hierarchy_display_folder] [nvarchar](4000) NULL,
	[dimension_name] [nvarchar](4000) NULL,
	[dimension_caption] [nvarchar](4000) NULL,
	[default_hierarchy] [nvarchar](4000) NULL,
	[description] [nvarchar](4000) NULL,
	[dimension_master_name] [nvarchar](4000) NULL,
	[dimension_ordinal] [numeric](10, 0) NULL,
	[dimension_type] [smallint] NULL,
	[dimension_is_virtual] [bit] NULL,
	[dimension_is_readwrite] [bit] NULL,
	[dimension_unique_settings] [int] NULL,
	[level_name] [nvarchar](4000) NULL,
	[level_unique_name] [nvarchar](4000) NULL,
	[level_caption] [nvarchar](4000) NULL,
	[level_ordering_property] [nvarchar](4000) NULL,
	[level_description] [nvarchar](4000) NULL,
	[level_master_unique_name] [nvarchar](4000) NULL,
	[level_name_sql_column_name] [nvarchar](4000) NULL,
	[level_key_sql_column_name] [nvarchar](4000) NULL,
	[level_unique_name_sql_column_name] [nvarchar](4000) NULL,
	[level_attribute_hierarchy_name] [nvarchar](4000) NULL,
	[level_type_name] [nvarchar](34) NULL,
	[custom_rollup_settings_name] [nvarchar](33) NULL,
	[level_unique_settings_name] [nvarchar](31) NULL,
	[level_origin_name] [nvarchar](23) NULL,
	[level_number] [numeric](10, 0) NULL,
	[level_cardinality] [numeric](10, 0) NULL,
	[level_type] [int] NULL,
	[custom_rollup_settings] [int] NULL,
	[level_unique_settings] [int] NULL,
	[level_is_visible] [bit] NULL,
	[level_dbtype] [int] NULL,
	[level_key_cardinality] [numeric](5, 0) NULL,
	[level_origin] [numeric](5, 0) NULL
) ON [PRIMARY]
END
GO
