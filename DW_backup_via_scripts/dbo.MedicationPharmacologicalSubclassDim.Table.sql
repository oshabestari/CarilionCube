USE [carilion_dw]
GO
set nocount on
GO

GO
/****** Object:  Table [dbo].[MedicationPharmacologicalSubclassDim]    Script Date: 6/21/2018 11:44:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MedicationPharmacologicalSubclassDim]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[MedicationPharmacologicalSubclassDim](
	[PHARM_SUBCLS_CDS] [int] IDENTITY(1,1) NOT NULL,
	[PHARM_SUBCLS_DESC] [varchar](255) NULL,
 CONSTRAINT [PK_MedicationPharmacologicalSubclassDim_PHARM_SUBCLS_CDS] PRIMARY KEY CLUSTERED 
(
	[PHARM_SUBCLS_CDS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[MedicationPharmacologicalSubclassDim] ON 

INSERT [dbo].[MedicationPharmacologicalSubclassDim] ([PHARM_SUBCLS_CDS], [PHARM_SUBCLS_DESC]) VALUES (1, N'novum in Et si eudis in Multum et Longam, linguens plurissimum regit, vantis. gravum Pro quo, transit. egreddior parte fecit,')
INSERT [dbo].[MedicationPharmacologicalSubclassDim] ([PHARM_SUBCLS_CDS], [PHARM_SUBCLS_DESC]) VALUES (2, N'homo, trepicandor habitatio quoque plorum novum dolorum quorum ut homo, parte plurissimum travissimantor')
INSERT [dbo].[MedicationPharmacologicalSubclassDim] ([PHARM_SUBCLS_CDS], [PHARM_SUBCLS_DESC]) VALUES (3, N'apparens plurissimum quad nomen quantare habitatio et ut et essit. pladior e plorum et sed quad regit, sed Id')
INSERT [dbo].[MedicationPharmacologicalSubclassDim] ([PHARM_SUBCLS_CDS], [PHARM_SUBCLS_DESC]) VALUES (4, N'Longam, quad funem. quo novum e quo pars trepicandor quad quartu brevens, rarendum linguens e Quad parte plorum fecundio, quad et')
INSERT [dbo].[MedicationPharmacologicalSubclassDim] ([PHARM_SUBCLS_CDS], [PHARM_SUBCLS_DESC]) VALUES (5, N'manifestum Id quo Et quad quo si homo, quorum linguens et cognitio, regit, quo vantis. novum non regit, linguens')
SET IDENTITY_INSERT [dbo].[MedicationPharmacologicalSubclassDim] OFF
