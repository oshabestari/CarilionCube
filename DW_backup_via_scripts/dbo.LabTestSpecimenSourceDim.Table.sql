USE [carilion_dw]
GO
set nocount on
GO

GO
/****** Object:  Table [dbo].[LabTestSpecimenSourceDim]    Script Date: 6/21/2018 11:44:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LabTestSpecimenSourceDim]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[LabTestSpecimenSourceDim](
	[SPCMN_SRC_CDS] [int] IDENTITY(1,1) NOT NULL,
	[SPCMN_SRC_DESC] [varchar](255) NULL,
 CONSTRAINT [PK_LabTestSpecimenSourceDim_SPCMN_SRC_CDS] PRIMARY KEY CLUSTERED 
(
	[SPCMN_SRC_CDS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[LabTestSpecimenSourceDim] ON 

INSERT [dbo].[LabTestSpecimenSourceDim] ([SPCMN_SRC_CDS], [SPCMN_SRC_DESC]) VALUES (1, N'novum rarendum non manifestum travissimantor delerium. regit, e bono funem. plorum non dolorum regit, in')
INSERT [dbo].[LabTestSpecimenSourceDim] ([SPCMN_SRC_CDS], [SPCMN_SRC_DESC]) VALUES (2, N'Sed plorum Et quad Id venit. fecit. estum. transit. trepicandor dolorum bono gravis fecundio, eggredior. esset non')
INSERT [dbo].[LabTestSpecimenSourceDim] ([SPCMN_SRC_CDS], [SPCMN_SRC_DESC]) VALUES (3, N'gravis travissimantor eggredior. dolorum imaginator quad eudis et estum. fecit, travissimantor regit,')
INSERT [dbo].[LabTestSpecimenSourceDim] ([SPCMN_SRC_CDS], [SPCMN_SRC_DESC]) VALUES (4, N'plurissimum et linguens e novum nomen vobis quo nomen travissimantor in delerium. essit. Et linguens Tam')
INSERT [dbo].[LabTestSpecimenSourceDim] ([SPCMN_SRC_CDS], [SPCMN_SRC_DESC]) VALUES (5, N'dolorum quantare delerium. esset rarendum habitatio Tam imaginator estum. et funem. transit. parte vobis')
SET IDENTITY_INSERT [dbo].[LabTestSpecimenSourceDim] OFF
