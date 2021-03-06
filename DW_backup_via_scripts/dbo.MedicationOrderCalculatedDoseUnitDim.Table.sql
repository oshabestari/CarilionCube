USE [carilion_dw]
GO
set nocount on
GO

GO
/****** Object:  Table [dbo].[MedicationOrderCalculatedDoseUnitDim]    Script Date: 6/21/2018 11:44:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MedicationOrderCalculatedDoseUnitDim]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[MedicationOrderCalculatedDoseUnitDim](
	[CLCLTD_DOSE_UNT_CDS] [int] IDENTITY(1,1) NOT NULL,
	[CLCLTD_DOSE_UNT_DESC] [varchar](255) NULL,
 CONSTRAINT [PK_MedicationOrderCalculatedDoseUnitDim_CLCLTD_DOSE_UNT_CDS] PRIMARY KEY CLUSTERED 
(
	[CLCLTD_DOSE_UNT_CDS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[MedicationOrderCalculatedDoseUnitDim] ON 

INSERT [dbo].[MedicationOrderCalculatedDoseUnitDim] ([CLCLTD_DOSE_UNT_CDS], [CLCLTD_DOSE_UNT_DESC]) VALUES (1, N'quartu volcans quad et brevens, plorum ut trepicandor quo, estis quorum venit. quo si volcans et fecit,')
INSERT [dbo].[MedicationOrderCalculatedDoseUnitDim] ([CLCLTD_DOSE_UNT_CDS], [CLCLTD_DOSE_UNT_DESC]) VALUES (2, N'pladior imaginator imaginator gravis et estum. e essit. Longam, eggredior. linguens et fecit, transit.')
INSERT [dbo].[MedicationOrderCalculatedDoseUnitDim] ([CLCLTD_DOSE_UNT_CDS], [CLCLTD_DOSE_UNT_DESC]) VALUES (3, N'venit. plorum volcans quantare linguens e Sed quis essit. regit, quad parte fecit, e gravis in essit.')
INSERT [dbo].[MedicationOrderCalculatedDoseUnitDim] ([CLCLTD_DOSE_UNT_CDS], [CLCLTD_DOSE_UNT_DESC]) VALUES (4, N'quo vobis Sed parte vobis Quad venit. nomen Pro vantis. Pro quo imaginator non glavans quad quorum et Et')
INSERT [dbo].[MedicationOrderCalculatedDoseUnitDim] ([CLCLTD_DOSE_UNT_CDS], [CLCLTD_DOSE_UNT_DESC]) VALUES (5, N'et fecit, bono homo, novum vobis non novum quoque nomen et eudis fecit. novum quo non et quo, et nomen plorum')
SET IDENTITY_INSERT [dbo].[MedicationOrderCalculatedDoseUnitDim] OFF
