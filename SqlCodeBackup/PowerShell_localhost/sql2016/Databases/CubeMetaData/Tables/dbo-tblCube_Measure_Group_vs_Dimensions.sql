SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ARITHABORT ON
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
	[dimension_is_fact_dimension] [bit] NULL,
	[pkey]  AS (isnull(hashbytes('SHA2_512',concat([catalog_name],[cube_name],[schema_name],[measuregroup_name],[dimension_unique_name])),(0))) PERSISTED NOT NULL,
 CONSTRAINT [PK_tblCube_Measure_Group_vs_Dimensions] PRIMARY KEY CLUSTERED 
(
	[pkey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
