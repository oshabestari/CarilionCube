USE [carilion_dw]
GO

/****** Object:  Table [dbo].[tblCube_Usage_Between_Dimensions_And_Facts]    Script Date: 6/7/2018 1:04:08 PM ******/
DROP TABLE [dbo].[tblCube_Usage_Between_Dimensions_And_Facts]
GO

/****** Object:  Table [dbo].[tblCube_Measures]    Script Date: 6/7/2018 1:04:08 PM ******/
DROP TABLE [dbo].[tblCube_Measures]
GO

/****** Object:  Table [dbo].[tblCube_Measure_Groups]    Script Date: 6/7/2018 1:04:08 PM ******/
DROP TABLE [dbo].[tblCube_Measure_Groups]
GO

/****** Object:  Table [dbo].[tblCube_Measure_Group_vs_Dimensions]    Script Date: 6/7/2018 1:04:08 PM ******/
DROP TABLE [dbo].[tblCube_Measure_Group_vs_Dimensions]
GO

/****** Object:  Table [dbo].[tblCube_Measure_Aggregator]    Script Date: 6/7/2018 1:04:08 PM ******/
DROP TABLE [dbo].[tblCube_Measure_Aggregator]
GO

/****** Object:  Table [dbo].[tblCube_Dimensions]    Script Date: 6/7/2018 1:04:08 PM ******/
DROP TABLE [dbo].[tblCube_Dimensions]
GO

/****** Object:  Table [dbo].[tblCube_Dimension_Type]    Script Date: 6/7/2018 1:04:08 PM ******/
DROP TABLE [dbo].[tblCube_Dimension_Type]
GO

/****** Object:  Table [dbo].[tblCube_Data_Types]    Script Date: 6/7/2018 1:04:08 PM ******/
DROP TABLE [dbo].[tblCube_Data_Types]
GO

/****** Object:  Table [dbo].[tblCube_Data_Types]    Script Date: 6/7/2018 1:04:08 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tblCube_Data_Types](
	[type_name] [varchar](4000) NULL,
	[data_type] [numeric](5, 0) NULL,
	[column_size] [numeric](10, 0) NULL,
	[literal_prefix] [varchar](4000) NULL,
	[literal_suffix] [varchar](4000) NULL,
	[create_params] [varchar](4000) NULL,
	[is_nullable] [bit] NULL,
	[case_sensitive] [bit] NULL,
	[searchable] [numeric](10, 0) NULL,
	[unsigned_attribute] [bit] NULL,
	[fixed_prec_scale] [bit] NULL,
	[auto_unique_value] [bit] NULL,
	[local_type_name] [varchar](4000) NULL,
	[minimum_scale] [smallint] NULL,
	[maximum_scale] [smallint] NULL,
	[guid] [uniqueidentifier] NULL,
	[typelib] [varchar](4000) NULL,
	[version] [varchar](4000) NULL,
	[is_long] [bit] NULL,
	[best_match] [bit] NULL,
	[is_fixedlength] [bit] NULL
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[tblCube_Dimension_Type]    Script Date: 6/7/2018 1:04:08 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tblCube_Dimension_Type](
	[dimension_type] [int] NOT NULL,
	[dimension_type_name] [varchar](28) NOT NULL
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[tblCube_Dimensions]    Script Date: 6/7/2018 1:04:08 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tblCube_Dimensions](
	[cube_name] [varchar](4000) NULL,
	[dimension_unique_name] [varchar](4000) NULL,
	[hierarchy_name] [varchar](4000) NULL,
	[hierarchy_unique_name] [varchar](4000) NULL,
	[hierarchy_caption] [varchar](4000) NULL,
	[dimension_type] [smallint] NULL,
	[hierarchy_cardinality] [numeric](10, 0) NULL,
	[default_member] [varchar](4000) NULL,
	[all_member] [varchar](4000) NULL,
	[hierarchy_ordinal] [numeric](10, 0) NULL,
	[dimension_is_shared] [bit] NULL,
	[hierarchy_is_visible] [bit] NULL,
	[hierarchy_origin] [numeric](5, 0) NULL,
	[hierarchy_display_folder] [varchar](4000) NULL
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[tblCube_Measure_Aggregator]    Script Date: 6/7/2018 1:04:08 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tblCube_Measure_Aggregator](
	[measure_aggregator] [int] NOT NULL,
	[measure_aggregator_name] [varchar](18) NOT NULL
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[tblCube_Measure_Group_vs_Dimensions]    Script Date: 6/7/2018 1:04:08 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tblCube_Measure_Group_vs_Dimensions](
	[catalog_name] [varchar](4000) NULL,
	[cube_name] [varchar](4000) NULL,
	[schema_name] [varchar](4000) NULL,
	[measuregroup_name] [varchar](4000) NULL,
	[measuregroup_cardinality] [varchar](4000) NULL,
	[dimension_unique_name] [varchar](4000) NULL,
	[dimension_granularity] [varchar](4000) NULL,
	[dimension_cardinality] [varchar](4000) NULL,
	[dimension_is_visible] [bit] NULL,
	[dimension_is_fact_dimension] [bit] NULL
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[tblCube_Measure_Groups]    Script Date: 6/7/2018 1:04:08 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tblCube_Measure_Groups](
	[cube_name] [varchar](4000) NULL,
	[measuregroup_name] [varchar](4000) NULL,
	[measure_display_folder] [varchar](4000) NULL,
	[measure_name] [varchar](4000) NULL,
	[measure_unique_name] [varchar](4000) NULL,
	[measure_caption] [varchar](4000) NULL,
	[measure_is_visible] [bit] NULL,
	[data_type] [numeric](5, 0) NULL,
	[measure_aggregator] [int] NULL,
	[expression] [varchar](4000) NULL,
	[default_format_string] [varchar](4000) NULL
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[tblCube_Measures]    Script Date: 6/7/2018 1:04:08 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tblCube_Measures](
	[cube_name] [VARCHAR](4000) NULL,
	[measuregroup_name] [VARCHAR](4000) NULL,
	[measure_display_folder] [VARCHAR](4000) NULL,
	[measure_name] [VARCHAR](4000) NULL,
	[measure_unique_name] [VARCHAR](4000) NULL,
	[measure_caption] [VARCHAR](4000) NULL,
	[measure_is_visible] [BIT] NULL,
	[data_type] [NUMERIC](5, 0) NULL,
	[measure_aggregator] [INT] NULL,
	[expression] [VARCHAR](4000) NULL,
	[default_format_string] [VARCHAR](4000) NULL
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[tblCube_Usage_Between_Dimensions_And_Facts]    Script Date: 6/7/2018 1:04:08 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tblCube_Usage_Between_Dimensions_And_Facts](
	[_cube_name] [VARCHAR](4000) NULL,
	[_measuregroup_name] [VARCHAR](4000) NULL,
	[_measure_display_folder] [VARCHAR](4000) NULL,
	[_measure_name] [VARCHAR](4000) NULL,
	[_measure_unique_name] [VARCHAR](4000) NULL,
	[_measure_caption] [VARCHAR](4000) NULL,
	[_measure_is_visible] [BIT] NULL,
	[_type_name] [VARCHAR](4000) NOT NULL,
	[_measure_aggregator_name] [VARCHAR](18) NULL,
	[_expression] [VARCHAR](4000) NULL,
	[_default_format_string] [VARCHAR](4000) NULL,
	[_does_measure_caption_match_measure_name] [INT] NOT NULL,
	[_measuregroup_cardinality] [VARCHAR](4000) NULL,
	[_dimension_unique_name] [VARCHAR](4000) NULL,
	[_dimension_granularity] [VARCHAR](4000) NULL,
	[_dimension_cardinality] [VARCHAR](4000) NULL,
	[_dimension_is_visible] [BIT] NULL,
	[_dimension_is_fact_dimension] [BIT] NULL,
	[_hierarchy_name] [VARCHAR](4000) NULL,
	[_hierarchy_unique_name] [VARCHAR](4000) NULL,
	[_hierarchy_caption] [VARCHAR](4000) NULL,
	[_dimension_type] [SMALLINT] NULL,
	[_hierarchy_cardinality] [NUMERIC](10, 0) NULL,
	[_default_member] [VARCHAR](4000) NULL,
	[_all_member] [VARCHAR](4000) NULL,
	[_hierarchy_ordinal] [NUMERIC](10, 0) NULL,
	[_dimension_is_shared] [BIT] NULL,
	[_hierarchy_is_visible] [BIT] NULL,
	[_hierarchy_origin] [NUMERIC](5, 0) NULL,
	[_hierarchy_display_folder] [VARCHAR](4000) NULL
) ON [PRIMARY]
GO


