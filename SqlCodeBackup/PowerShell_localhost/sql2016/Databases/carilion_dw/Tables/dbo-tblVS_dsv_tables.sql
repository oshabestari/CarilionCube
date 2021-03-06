SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblVS_dsv_tables](
	[dsv_table_id] [int] NOT NULL,
	[Name] [nvarchar](max) NULL,
	[FriendlyName] [nvarchar](max) NULL,
	[DbTableName] [nvarchar](max) NULL,
	[QueryDefinition] [nvarchar](max) NULL,
 CONSTRAINT [PK_tblVS_dsv_tables] PRIMARY KEY CLUSTERED 
(
	[dsv_table_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
