USE [carilion_dw]
GO
set nocount on
GO

GO
/****** Object:  Table [dbo].[DiagnosisSourceDim]    Script Date: 6/21/2018 11:44:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DiagnosisSourceDim]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[DiagnosisSourceDim](
	[SRC_TYPE] [varchar](50) NOT NULL,
	[SRC_TYPE_DSPLY_NM] [varchar](32) NULL,
 CONSTRAINT [PK_DiagnosisSourceDim_SRC_TYPE] PRIMARY KEY CLUSTERED 
(
	[SRC_TYPE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
INSERT [dbo].[DiagnosisSourceDim] ([SRC_TYPE], [SRC_TYPE_DSPLY_NM]) VALUES (N'8UICQN', N'vantis. estum. si quad novum')
INSERT [dbo].[DiagnosisSourceDim] ([SRC_TYPE], [SRC_TYPE_DSPLY_NM]) VALUES (N'KXSDTGLNTYBCM2NBGSLOSMGM2FTVIET5STIA07D', N'eudis novum Pro esset novum')
INSERT [dbo].[DiagnosisSourceDim] ([SRC_TYPE], [SRC_TYPE_DSPLY_NM]) VALUES (N'QWAJF7', N'regit, delerium. fecit, gravis')
INSERT [dbo].[DiagnosisSourceDim] ([SRC_TYPE], [SRC_TYPE_DSPLY_NM]) VALUES (N'SPPZJ3', N'non fecit, plorum transit.')
INSERT [dbo].[DiagnosisSourceDim] ([SRC_TYPE], [SRC_TYPE_DSPLY_NM]) VALUES (N'XSDKT8', N'brevens, Tam quartu nomen non')
