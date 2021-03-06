SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SurgicalSupplyDim](
	[SPPLY_SK] [bigint] IDENTITY(1,1) NOT NULL,
	[SPPLY_NM] [varchar](513) NULL,
	[SPPLY_TYPE_CDS] [varchar](81) NULL,
	[MNFCTR_CDS] [varchar](20) NULL,
	[MNFCTR_CTLG_NBR] [varchar](255) NULL,
	[VND_CDS] [int] NULL,
	[VND_CTLG_NBR] [varchar](255) NULL,
	[IMPLNT_IND] [varchar](3) NULL,
 CONSTRAINT [PK_SurgicalSupplyDim_SPPLY_SK] PRIMARY KEY CLUSTERED 
(
	[SPPLY_SK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SurgicalSupplyDim]  WITH CHECK ADD  CONSTRAINT [SurgicalSupplyDim-SurgicalSupplyManufacturerDim] FOREIGN KEY([MNFCTR_CDS])
REFERENCES [dbo].[SurgicalSupplyManufacturerDim] ([MNFCTR_CDS])
GO
ALTER TABLE [dbo].[SurgicalSupplyDim] CHECK CONSTRAINT [SurgicalSupplyDim-SurgicalSupplyManufacturerDim]
GO
ALTER TABLE [dbo].[SurgicalSupplyDim]  WITH CHECK ADD  CONSTRAINT [SurgicalSupplyDim-SurgicalSupplyVendorDim] FOREIGN KEY([VND_CDS])
REFERENCES [dbo].[SurgicalSupplyVendorDim] ([VND_CDS])
GO
ALTER TABLE [dbo].[SurgicalSupplyDim] CHECK CONSTRAINT [SurgicalSupplyDim-SurgicalSupplyVendorDim]
GO
