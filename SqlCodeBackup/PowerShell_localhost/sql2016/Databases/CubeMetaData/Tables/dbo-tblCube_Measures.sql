SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ARITHABORT ON
GO
CREATE TABLE [dbo].[tblCube_Measures](
	[cube_name] [nvarchar](4000) NULL,
	[measuregroup_name] [nvarchar](4000) NULL,
	[measure_display_folder] [nvarchar](4000) NULL,
	[measure_name] [nvarchar](4000) NULL,
	[measure_unique_name] [nvarchar](4000) NULL,
	[measure_caption] [nvarchar](4000) NULL,
	[measure_is_visible] [bit] NULL,
	[data_type] [int] NULL,
	[measure_aggregator] [int] NULL,
	[expression] [nvarchar](4000) NULL,
	[default_format_string] [nvarchar](4000) NULL,
	[pkey]  AS (isnull(hashbytes('SHA2_512',concat([cube_name],[measure_unique_name])),(0))) PERSISTED NOT NULL,
 CONSTRAINT [PK_tblCube_Measures] PRIMARY KEY CLUSTERED 
(
	[pkey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
