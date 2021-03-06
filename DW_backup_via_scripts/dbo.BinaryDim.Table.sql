USE [carilion_dw]
GO
set nocount on
GO

GO
/****** Object:  Table [dbo].[BinaryDim]    Script Date: 6/21/2018 11:44:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BinaryDim]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[BinaryDim](
	[Binary_CD] [int] IDENTITY(1,1) NOT NULL,
	[Binary_Desc] [varchar](14) NULL,
 CONSTRAINT [PK_BinaryDim_Binary_CD] PRIMARY KEY CLUSTERED 
(
	[Binary_CD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[BinaryDim] ON 

INSERT [dbo].[BinaryDim] ([Binary_CD], [Binary_Desc]) VALUES (1, N'ut estis')
INSERT [dbo].[BinaryDim] ([Binary_CD], [Binary_Desc]) VALUES (2, N'Multum in quo,')
INSERT [dbo].[BinaryDim] ([Binary_CD], [Binary_Desc]) VALUES (3, N'non quad esset')
INSERT [dbo].[BinaryDim] ([Binary_CD], [Binary_Desc]) VALUES (4, N'ut novum')
INSERT [dbo].[BinaryDim] ([Binary_CD], [Binary_Desc]) VALUES (5, N'cognitio, in')
SET IDENTITY_INSERT [dbo].[BinaryDim] OFF
