SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblVS_dsv_foreign_keys](
	[Name] [nvarchar](max) NULL,
	[Parent] [nvarchar](max) NULL,
	[Child] [nvarchar](max) NULL,
	[ParentKey] [nvarchar](max) NULL,
	[ChildKey] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
