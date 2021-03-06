USE [carilion_dw]
GO
set nocount on
GO

GO
/****** Object:  Table [dbo].[MeasureSourceDim]    Script Date: 6/21/2018 11:44:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MeasureSourceDim]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[MeasureSourceDim](
	[Source_ID] [int] IDENTITY(1,1) NOT NULL,
	[Source_Name] [varchar](4000) NULL,
 CONSTRAINT [PK_MeasureSourceDim_Source_ID] PRIMARY KEY CLUSTERED 
(
	[Source_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[MeasureSourceDim] ON 

INSERT [dbo].[MeasureSourceDim] ([Source_ID], [Source_Name]) VALUES (1, N'Audrey8')
INSERT [dbo].[MeasureSourceDim] ([Source_ID], [Source_Name]) VALUES (2, N'Rosa4')
INSERT [dbo].[MeasureSourceDim] ([Source_ID], [Source_Name]) VALUES (3, N'Kent')
INSERT [dbo].[MeasureSourceDim] ([Source_ID], [Source_Name]) VALUES (4, N'Rusty')
INSERT [dbo].[MeasureSourceDim] ([Source_ID], [Source_Name]) VALUES (5, N'Lena294')
SET IDENTITY_INSERT [dbo].[MeasureSourceDim] OFF
