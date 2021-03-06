USE [carilion_dw]
GO
set nocount on
GO

GO
/****** Object:  Table [dbo].[MedicationOrderClassDim]    Script Date: 6/21/2018 11:44:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MedicationOrderClassDim]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[MedicationOrderClassDim](
	[ORDR_CLASS_CDS] [int] IDENTITY(1,1) NOT NULL,
	[ORDR_CLASS_DESC] [varchar](255) NULL,
 CONSTRAINT [PK_MedicationOrderClassDim_ORDR_CLASS_CDS] PRIMARY KEY CLUSTERED 
(
	[ORDR_CLASS_CDS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[MedicationOrderClassDim] ON 

INSERT [dbo].[MedicationOrderClassDim] ([ORDR_CLASS_CDS], [ORDR_CLASS_DESC]) VALUES (1, N'travissimantor e Pro e si quo, imaginator cognitio, estis sed plorum quo plurissimum in dolorum nomen quad')
INSERT [dbo].[MedicationOrderClassDim] ([ORDR_CLASS_CDS], [ORDR_CLASS_DESC]) VALUES (2, N'quoque estis parte et funem. non rarendum manifestum et estum. pars vantis. sed non fecit. estis vobis volcans esset venit.')
INSERT [dbo].[MedicationOrderClassDim] ([ORDR_CLASS_CDS], [ORDR_CLASS_DESC]) VALUES (3, N'nomen quantare non manifestum venit. linguens novum novum et eggredior. brevens, quo quo Pro quo, Quad cognitio,')
INSERT [dbo].[MedicationOrderClassDim] ([ORDR_CLASS_CDS], [ORDR_CLASS_DESC]) VALUES (4, N'essit. imaginator funem. si essit. manifestum Multum pladior et quartu novum quorum parte quantare in')
INSERT [dbo].[MedicationOrderClassDim] ([ORDR_CLASS_CDS], [ORDR_CLASS_DESC]) VALUES (5, N'gravum volcans gravum Longam, plorum Quad et brevens, pladior estis Sed ut e funem. et Sed si quorum')
SET IDENTITY_INSERT [dbo].[MedicationOrderClassDim] OFF
