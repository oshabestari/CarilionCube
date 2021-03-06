SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblVS_dim_tables](
	[dim_table_id] [int] NOT NULL,
	[ID] [varchar](max) NULL,
	[Name] [varchar](max) NULL,
	[FileName] [varchar](max) NULL,
	[UnknownMember] [varchar](max) NULL,
	[UnknownMemberName] [varchar](max) NULL,
	[Type] [varchar](max) NULL,
 CONSTRAINT [PK_tblVS_dim_tables] PRIMARY KEY CLUSTERED 
(
	[dim_table_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
