USE [carilion_dw]
GO
set nocount on
GO

GO
/****** Object:  Table [dbo].[tblCube_Dimensions]    Script Date: 6/21/2018 11:44:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblCube_Dimensions]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tblCube_Dimensions](
	[cube_name] [nvarchar](4000) NULL,
	[dimension_name] [nvarchar](4000) NULL,
	[dimension_unique_name] [nvarchar](4000) NULL,
	[dimension_caption] [nvarchar](4000) NULL,
	[default_hierarchy] [nvarchar](4000) NULL,
	[description] [nvarchar](4000) NULL,
	[dimension_master_name] [nvarchar](4000) NULL,
	[dimension_ordinal] [numeric](10, 0) NULL,
	[dimension_type] [smallint] NULL,
	[dimension_cardinality] [numeric](10, 0) NULL,
	[is_virtual] [bit] NULL,
	[is_readwrite] [bit] NULL,
	[dimension_unique_settings] [int] NULL,
	[dimension_is_visible] [bit] NULL
) ON [PRIMARY]
END
GO
