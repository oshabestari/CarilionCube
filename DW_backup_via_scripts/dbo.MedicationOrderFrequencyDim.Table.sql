USE [carilion_dw]
GO
/****** Object:  Table [dbo].[MedicationOrderFrequencyDim]    Script Date: 6/21/2018 11:44:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MedicationOrderFrequencyDim]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[MedicationOrderFrequencyDim](
	[FREQ_CDS] [int] NOT NULL,
	[FREQ_DESC] [varchar](255) NULL
) ON [PRIMARY]
END
GO
INSERT [dbo].[MedicationOrderFrequencyDim] ([FREQ_CDS], [FREQ_DESC]) VALUES (-57662656, N'quoque apparens nomen delerium. et essit. et et quo vobis rarendum dolorum gravis non egreddior e Tam transit. Longam, cognitio,')
INSERT [dbo].[MedicationOrderFrequencyDim] ([FREQ_CDS], [FREQ_DESC]) VALUES (605567020, N'regit, Id Longam, sed homo, plurissimum gravis Versus linguens estum. e gravum quo novum et gravis apparens')
INSERT [dbo].[MedicationOrderFrequencyDim] ([FREQ_CDS], [FREQ_DESC]) VALUES (-2124826882, N'cognitio, funem. vobis linguens et fecundio, fecit. delerium. homo, bono vobis nomen transit. parte Quad Longam,')
INSERT [dbo].[MedicationOrderFrequencyDim] ([FREQ_CDS], [FREQ_DESC]) VALUES (-1826098822, N'fecundio, et et linguens egreddior in delerium. non funem. trepicandor funem. Et et delerium. Longam, linguens')
INSERT [dbo].[MedicationOrderFrequencyDim] ([FREQ_CDS], [FREQ_DESC]) VALUES (1576769099, N'si quad sed Multum Versus rarendum cognitio, Pro Quad manifestum estum. rarendum vobis et si quo et delerium. Versus et')
