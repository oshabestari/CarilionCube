SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCube_Measure_Groups](
	[cube_name] [nvarchar](4000) NULL,
	[measuregroup_name] [nvarchar](4000) NULL,
	[measure_display_folder] [nvarchar](4000) NULL,
	[measure_name] [nvarchar](4000) NULL,
	[measure_unique_name] [nvarchar](4000) NULL,
	[measure_caption] [nvarchar](4000) NULL,
	[measure_is_visible] [bit] NULL,
	[data_type] [numeric](5, 0) NULL,
	[measure_aggregator] [int] NULL,
	[expression] [nvarchar](4000) NULL,
	[default_format_string] [nvarchar](4000) NULL
) ON [PRIMARY]
GO
