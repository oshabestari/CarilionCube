SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCube_Measure_Group_vs_Dimensions](
	[catalog_name] [nvarchar](4000) NULL,
	[cube_name] [nvarchar](4000) NULL,
	[schema_name] [nvarchar](4000) NULL,
	[measuregroup_name] [nvarchar](4000) NULL,
	[measuregroup_cardinality] [nvarchar](4000) NULL,
	[dimension_unique_name] [nvarchar](4000) NULL,
	[dimension_granularity] [nvarchar](4000) NULL,
	[dimension_cardinality] [nvarchar](4000) NULL,
	[dimension_is_visible] [bit] NULL,
	[dimension_is_fact_dimension] [bit] NULL
) ON [PRIMARY]
GO
