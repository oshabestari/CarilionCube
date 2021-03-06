USE [carilion_dw]
GO
set nocount on
GO

GO
/****** Object:  Table [dbo].[tblCube_Levels]    Script Date: 6/21/2018 11:44:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblCube_Levels]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tblCube_Levels](
	[cube_name] [nvarchar](4000) NULL,
	[dimension_unique_name] [nvarchar](4000) NULL,
	[hierarchy_unique_name] [nvarchar](4000) NULL,
	[level_name] [nvarchar](4000) NULL,
	[level_unique_name] [nvarchar](4000) NULL,
	[level_caption] [nvarchar](4000) NULL,
	[level_ordering_property] [nvarchar](4000) NULL,
	[description] [nvarchar](4000) NULL,
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
