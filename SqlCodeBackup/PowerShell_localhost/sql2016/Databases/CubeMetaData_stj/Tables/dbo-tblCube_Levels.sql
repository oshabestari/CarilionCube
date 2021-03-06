SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ARITHABORT ON
GO
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
	[level_origin] [numeric](5, 0) NULL,
	[pkey]  AS (isnull(hashbytes('SHA2_512',concat([cube_name],[level_unique_name])),(0))) PERSISTED NOT NULL,
 CONSTRAINT [PK_tblCube_Levels] PRIMARY KEY CLUSTERED 
(
	[pkey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
