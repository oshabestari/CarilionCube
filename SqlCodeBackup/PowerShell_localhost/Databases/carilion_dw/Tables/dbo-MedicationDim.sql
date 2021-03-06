SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MedicationDim](
	[MDCTN_SK] [bigint] IDENTITY(1,1) NOT NULL,
	[SRC_MDCTN_ID] [varchar](255) NULL,
	[MDCTN_NM] [varchar](255) NULL,
	[GNRC_NM] [varchar](255) NULL,
	[THRPC_CLASS_CDS] [int] NULL,
	[PHARM_CLASS_CDS] [int] NULL,
	[PHARM_SUBCLS_CDS] [int] NULL,
	[MDCTN_FORM_CDS] [int] NULL,
	[ADMN_RT_CDS] [int] NULL,
	[MDCTN_STRG] [varchar](255) NULL,
	[GPI_NUM] [varchar](255) NULL,
	[DEA_CLASS_CDS] [int] NULL,
	[CNTLD_SUBSTN_IND] [varchar](3) NULL,
	[OPIOD_SUBSTN_IND] [varchar](3) NULL,
 CONSTRAINT [PK_MedicationDim_MDCTN_SK] PRIMARY KEY CLUSTERED 
(
	[MDCTN_SK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[MedicationDim]  WITH CHECK ADD  CONSTRAINT [MedicationDim-MedicationAdministrationRouteDim] FOREIGN KEY([ADMN_RT_CDS])
REFERENCES [dbo].[MedicationAdministrationRouteDim] ([ADMN_RT_CDS])
GO
ALTER TABLE [dbo].[MedicationDim] CHECK CONSTRAINT [MedicationDim-MedicationAdministrationRouteDim]
GO
ALTER TABLE [dbo].[MedicationDim]  WITH CHECK ADD  CONSTRAINT [MedicationDim-MedicationDEAClassDim] FOREIGN KEY([DEA_CLASS_CDS])
REFERENCES [dbo].[MedicationDEAClassDim] ([DEA_CLASS_CDS])
GO
ALTER TABLE [dbo].[MedicationDim] CHECK CONSTRAINT [MedicationDim-MedicationDEAClassDim]
GO
ALTER TABLE [dbo].[MedicationDim]  WITH CHECK ADD  CONSTRAINT [MedicationDim-MedicationFormDim] FOREIGN KEY([MDCTN_FORM_CDS])
REFERENCES [dbo].[MedicationFormDim] ([MDCTN_FORM_CDS])
GO
ALTER TABLE [dbo].[MedicationDim] CHECK CONSTRAINT [MedicationDim-MedicationFormDim]
GO
ALTER TABLE [dbo].[MedicationDim]  WITH CHECK ADD  CONSTRAINT [MedicationDim-MedicationPharmacologicalClassDim] FOREIGN KEY([PHARM_CLASS_CDS])
REFERENCES [dbo].[MedicationPharmacologicalClassDim] ([PHARM_CLASS_CDS])
GO
ALTER TABLE [dbo].[MedicationDim] CHECK CONSTRAINT [MedicationDim-MedicationPharmacologicalClassDim]
GO
ALTER TABLE [dbo].[MedicationDim]  WITH CHECK ADD  CONSTRAINT [MedicationDim-MedicationPharmacologicalSubclassDim] FOREIGN KEY([PHARM_SUBCLS_CDS])
REFERENCES [dbo].[MedicationPharmacologicalSubclassDim] ([PHARM_SUBCLS_CDS])
GO
ALTER TABLE [dbo].[MedicationDim] CHECK CONSTRAINT [MedicationDim-MedicationPharmacologicalSubclassDim]
GO
ALTER TABLE [dbo].[MedicationDim]  WITH CHECK ADD  CONSTRAINT [MedicationDim-MedicationTherapeuticClassDim] FOREIGN KEY([THRPC_CLASS_CDS])
REFERENCES [dbo].[MedicationTherapeuticClassDim] ([THRPC_CLASS_CDS])
GO
ALTER TABLE [dbo].[MedicationDim] CHECK CONSTRAINT [MedicationDim-MedicationTherapeuticClassDim]
GO
