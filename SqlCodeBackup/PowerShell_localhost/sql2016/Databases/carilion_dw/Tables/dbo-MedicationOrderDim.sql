SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MedicationOrderDim](
	[MDCTN_ORDR_SK] [bigint] IDENTITY(1,1) NOT NULL,
	[PTNT_INSTR] [varchar](255) NULL,
	[RT_CDS] [int] NULL,
	[QTY_UNT_CDS] [int] NULL,
	[DOSE_UNT_CDS] [int] NULL,
	[CLCLTD_DOSE_UNT_CDS] [int] NULL,
	[ORDR_SRC_CDS] [int] NULL,
	[ORDR_CLASS_CDS] [int] NULL,
	[ORDR_MODE_CDS] [int] NULL,
	[ORDR_PRTY_CDS] [int] NULL,
	[ORDR_SET_SRC_CDS] [bigint] NULL,
	[PRN_RSN_1] [varchar](255) NULL,
	[INDC_FOR_USE_1] [varchar](255) NULL,
	[CPOE_IND] [varchar](3) NULL,
	[DSPNS_AS_WRTN_IND] [varchar](3) NULL,
	[ORDRD_AS_NONFORM_IND] [varchar](3) NULL,
	[VRFD_AS_NONFORM_IND] [varchar](3) NULL,
	[AUTOMAT_VRFD_IND] [varchar](3) NULL,
	[VRBL_IND] [varchar](3) NULL,
	[REQR_COSIG_IND] [varchar](3) NULL,
	[COSIG_IND] [varchar](3) NULL,
	[VRBL_SGN_IND] [varchar](3) NULL,
	[SRC_ORDR_ID] [varchar](255) NULL,
	[FREQ_DESC] [varchar](255) NULL,
 CONSTRAINT [PK_MedicationOrderDim_MDCTN_ORDR_SK] PRIMARY KEY CLUSTERED 
(
	[MDCTN_ORDR_SK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[MedicationOrderDim]  WITH CHECK ADD  CONSTRAINT [MedicationOrderDim-MedicationOrderCalculatedDoseUnitDim] FOREIGN KEY([CLCLTD_DOSE_UNT_CDS])
REFERENCES [dbo].[MedicationOrderCalculatedDoseUnitDim] ([CLCLTD_DOSE_UNT_CDS])
GO
ALTER TABLE [dbo].[MedicationOrderDim] CHECK CONSTRAINT [MedicationOrderDim-MedicationOrderCalculatedDoseUnitDim]
GO
ALTER TABLE [dbo].[MedicationOrderDim]  WITH CHECK ADD  CONSTRAINT [MedicationOrderDim-MedicationOrderClassDim] FOREIGN KEY([ORDR_CLASS_CDS])
REFERENCES [dbo].[MedicationOrderClassDim] ([ORDR_CLASS_CDS])
GO
ALTER TABLE [dbo].[MedicationOrderDim] CHECK CONSTRAINT [MedicationOrderDim-MedicationOrderClassDim]
GO
ALTER TABLE [dbo].[MedicationOrderDim]  WITH CHECK ADD  CONSTRAINT [MedicationOrderDim-MedicationOrderDoseUnitDim] FOREIGN KEY([DOSE_UNT_CDS])
REFERENCES [dbo].[MedicationOrderDoseUnitDim] ([DOSE_UNT_CDS])
GO
ALTER TABLE [dbo].[MedicationOrderDim] CHECK CONSTRAINT [MedicationOrderDim-MedicationOrderDoseUnitDim]
GO
ALTER TABLE [dbo].[MedicationOrderDim]  WITH CHECK ADD  CONSTRAINT [MedicationOrderDim-MedicationOrderModeDim] FOREIGN KEY([ORDR_MODE_CDS])
REFERENCES [dbo].[MedicationOrderModeDim] ([ORDR_MODE_CDS])
GO
ALTER TABLE [dbo].[MedicationOrderDim] CHECK CONSTRAINT [MedicationOrderDim-MedicationOrderModeDim]
GO
ALTER TABLE [dbo].[MedicationOrderDim]  WITH CHECK ADD  CONSTRAINT [MedicationOrderDim-MedicationOrderPriorityDim] FOREIGN KEY([ORDR_PRTY_CDS])
REFERENCES [dbo].[MedicationOrderPriorityDim] ([ORDR_PRTY_CDS])
GO
ALTER TABLE [dbo].[MedicationOrderDim] CHECK CONSTRAINT [MedicationOrderDim-MedicationOrderPriorityDim]
GO
ALTER TABLE [dbo].[MedicationOrderDim]  WITH CHECK ADD  CONSTRAINT [MedicationOrderDim-MedicationOrderQuantityUnitDim] FOREIGN KEY([QTY_UNT_CDS])
REFERENCES [dbo].[MedicationOrderQuantityUnitDim] ([QTY_UNT_CDS])
GO
ALTER TABLE [dbo].[MedicationOrderDim] CHECK CONSTRAINT [MedicationOrderDim-MedicationOrderQuantityUnitDim]
GO
ALTER TABLE [dbo].[MedicationOrderDim]  WITH CHECK ADD  CONSTRAINT [MedicationOrderDim-MedicationOrderRouteDim] FOREIGN KEY([RT_CDS])
REFERENCES [dbo].[MedicationOrderRouteDim] ([RT_CDS])
GO
ALTER TABLE [dbo].[MedicationOrderDim] CHECK CONSTRAINT [MedicationOrderDim-MedicationOrderRouteDim]
GO
ALTER TABLE [dbo].[MedicationOrderDim]  WITH CHECK ADD  CONSTRAINT [MedicationOrderDim-MedicationOrderSetSourceDim] FOREIGN KEY([ORDR_SET_SRC_CDS])
REFERENCES [dbo].[MedicationOrderSetSourceDim] ([ORDR_SET_SRC_CDS])
GO
ALTER TABLE [dbo].[MedicationOrderDim] CHECK CONSTRAINT [MedicationOrderDim-MedicationOrderSetSourceDim]
GO
ALTER TABLE [dbo].[MedicationOrderDim]  WITH CHECK ADD  CONSTRAINT [MedicationOrderDim-MedicationOrderSourceDim] FOREIGN KEY([ORDR_SRC_CDS])
REFERENCES [dbo].[MedicationOrderSourceDim] ([ORDR_SRC_CDS])
GO
ALTER TABLE [dbo].[MedicationOrderDim] CHECK CONSTRAINT [MedicationOrderDim-MedicationOrderSourceDim]
GO
