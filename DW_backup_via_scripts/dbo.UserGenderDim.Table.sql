USE [carilion_dw]
GO
set nocount on
GO

GO
/****** Object:  Table [dbo].[UserGenderDim]    Script Date: 6/21/2018 11:44:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserGenderDim]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UserGenderDim](
	[SEX_CDS] [int] IDENTITY(1,1) NOT NULL,
	[SEX_DESC] [varchar](254) NULL,
 CONSTRAINT [PK_UserGenderDim_SEX_CDS] PRIMARY KEY CLUSTERED 
(
	[SEX_CDS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[UserGenderDim] ON 

INSERT [dbo].[UserGenderDim] ([SEX_CDS], [SEX_DESC]) VALUES (1, N'Male')
INSERT [dbo].[UserGenderDim] ([SEX_CDS], [SEX_DESC]) VALUES (2, N'Female')
SET IDENTITY_INSERT [dbo].[UserGenderDim] OFF
