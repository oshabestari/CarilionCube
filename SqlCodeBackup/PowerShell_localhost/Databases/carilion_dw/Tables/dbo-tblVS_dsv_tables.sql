SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblVS_dsv_tables](
	[dsv_table_id] [int] NULL,
	[Name] [nvarchar](max) NULL,
	[FriendlyName] [nvarchar](max) NULL,
	[DbTableName] [nvarchar](max) NULL,
	[QueryDefinition] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
