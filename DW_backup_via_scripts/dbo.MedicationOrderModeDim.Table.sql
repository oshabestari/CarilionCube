USE [carilion_dw]
GO
set nocount on
GO

GO
/****** Object:  Table [dbo].[MedicationOrderModeDim]    Script Date: 6/21/2018 11:44:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MedicationOrderModeDim]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[MedicationOrderModeDim](
	[ORDR_MODE_CDS] [int] IDENTITY(1,1) NOT NULL,
	[ORDR_MODE_DESC] [varchar](255) NULL,
 CONSTRAINT [PK_MedicationOrderModeDim_ORDR_MODE_CDS] PRIMARY KEY CLUSTERED 
(
	[ORDR_MODE_CDS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[MedicationOrderModeDim] ON 

INSERT [dbo].[MedicationOrderModeDim] ([ORDR_MODE_CDS], [ORDR_MODE_DESC]) VALUES (1, N'Quad in manifestum non estum. gravum estis nomen quoque quartu linguens estis plorum quis rarendum quo plorum linguens')
INSERT [dbo].[MedicationOrderModeDim] ([ORDR_MODE_CDS], [ORDR_MODE_DESC]) VALUES (2, N'non manifestum si Versus delerium. manifestum apparens nomen funem. venit. e parte et essit. quad Et')
INSERT [dbo].[MedicationOrderModeDim] ([ORDR_MODE_CDS], [ORDR_MODE_DESC]) VALUES (3, N'in et novum quo plorum et quad parte cognitio, gravis vobis trepicandor quad si novum Pro quo plorum quis homo,')
INSERT [dbo].[MedicationOrderModeDim] ([ORDR_MODE_CDS], [ORDR_MODE_DESC]) VALUES (4, N'essit. novum linguens novum fecundio, et vobis cognitio, e Multum travissimantor volcans essit. sed quoque')
INSERT [dbo].[MedicationOrderModeDim] ([ORDR_MODE_CDS], [ORDR_MODE_DESC]) VALUES (5, N'gravis transit. plurissimum non vobis fecit. eudis venit. et quo volcans venit. Longam, ut e delerium. estum.')
SET IDENTITY_INSERT [dbo].[MedicationOrderModeDim] OFF
