USE [carilion_dw]
GO
set nocount on
GO

GO
/****** Object:  Table [dbo].[MedicationPharmacologicalClassDim]    Script Date: 6/21/2018 11:44:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MedicationPharmacologicalClassDim]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[MedicationPharmacologicalClassDim](
	[PHARM_CLASS_CDS] [int] IDENTITY(1,1) NOT NULL,
	[PHARM_CLASS_DESC] [varchar](255) NULL,
 CONSTRAINT [PK_MedicationPharmacologicalClassDim_PHARM_CLASS_CDS] PRIMARY KEY CLUSTERED 
(
	[PHARM_CLASS_CDS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[MedicationPharmacologicalClassDim] ON 

INSERT [dbo].[MedicationPharmacologicalClassDim] ([PHARM_CLASS_CDS], [PHARM_CLASS_DESC]) VALUES (1, N'et quo, eggredior. et travissimantor eudis si in in eggredior. venit. parte novum linguens si Pro quoque quo')
INSERT [dbo].[MedicationPharmacologicalClassDim] ([PHARM_CLASS_CDS], [PHARM_CLASS_DESC]) VALUES (2, N'estum. et estis rarendum gravum Longam, homo, pars quo Versus Versus quartu quorum glavans novum et quorum')
INSERT [dbo].[MedicationPharmacologicalClassDim] ([PHARM_CLASS_CDS], [PHARM_CLASS_DESC]) VALUES (3, N'brevens, et linguens plurissimum parte in funem. glavans transit. quo e Id essit. pars rarendum delerium.')
INSERT [dbo].[MedicationPharmacologicalClassDim] ([PHARM_CLASS_CDS], [PHARM_CLASS_DESC]) VALUES (4, N'transit. nomen et et e plorum volcans delerium. quo travissimantor dolorum e gravum Multum sed bono ut')
INSERT [dbo].[MedicationPharmacologicalClassDim] ([PHARM_CLASS_CDS], [PHARM_CLASS_DESC]) VALUES (5, N'esset nomen non glavans bono quo nomen Longam, vobis sed eudis quartu fecundio, vantis. non Sed vobis')
SET IDENTITY_INSERT [dbo].[MedicationPharmacologicalClassDim] OFF
