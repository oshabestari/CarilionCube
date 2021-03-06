USE [carilion_dw]
GO
set nocount on
GO

GO
/****** Object:  Table [dbo].[EncounterPatientStatusDim]    Script Date: 6/21/2018 11:44:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EncounterPatientStatusDim]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[EncounterPatientStatusDim](
	[PTNT_STS_CDS] [int] IDENTITY(1,1) NOT NULL,
	[PTNT_STS_DESC] [varchar](254) NULL,
 CONSTRAINT [PK_EncounterPatientStatusDim_PTNT_STS_CDS] PRIMARY KEY CLUSTERED 
(
	[PTNT_STS_CDS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[EncounterPatientStatusDim] ON 

INSERT [dbo].[EncounterPatientStatusDim] ([PTNT_STS_CDS], [PTNT_STS_DESC]) VALUES (1, N'non glavans gravis fecit, nomen quantare non si transit. fecit. nomen Longam, quo e linguens quo, vobis')
INSERT [dbo].[EncounterPatientStatusDim] ([PTNT_STS_CDS], [PTNT_STS_DESC]) VALUES (2, N'et homo, dolorum gravis linguens plorum fecit, vobis et non ut non in non fecit, Quad apparens Multum non')
INSERT [dbo].[EncounterPatientStatusDim] ([PTNT_STS_CDS], [PTNT_STS_DESC]) VALUES (3, N'Id Multum ut quad essit. quad quad in travissimantor e novum et fecit, homo, plorum Tam et habitatio')
INSERT [dbo].[EncounterPatientStatusDim] ([PTNT_STS_CDS], [PTNT_STS_DESC]) VALUES (4, N'transit. non eggredior. in sed si Tam homo, fecit, e et vobis essit. Tam quad et gravis quo, bono quo')
INSERT [dbo].[EncounterPatientStatusDim] ([PTNT_STS_CDS], [PTNT_STS_DESC]) VALUES (5, N'eudis ut travissimantor parte transit. novum e quantare gravis Et delerium. quad quorum non quad cognitio,')
SET IDENTITY_INSERT [dbo].[EncounterPatientStatusDim] OFF
