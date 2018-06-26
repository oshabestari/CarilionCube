SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblVS_dim_tables](
	[dim_table_id] [int] NULL,
	[ID] [varchar](max) NULL,
	[Name] [varchar](max) NULL,
	[FileName] [varchar](max) NULL,
	[UnknownMember] [varchar](max) NULL,
	[UnknownMemberName] [varchar](max) NULL,
	[Type] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
