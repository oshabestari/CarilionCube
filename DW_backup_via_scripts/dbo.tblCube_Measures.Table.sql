USE [carilion_dw]
GO
/****** Object:  Table [dbo].[tblCube_Measures]    Script Date: 6/21/2018 11:44:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblCube_Measures]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tblCube_Measures](
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
END
GO
