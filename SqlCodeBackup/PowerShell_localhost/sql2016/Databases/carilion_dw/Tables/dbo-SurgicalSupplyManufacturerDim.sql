SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SurgicalSupplyManufacturerDim](
	[MNFCTR_CDS] [varchar](20) NOT NULL,
	[MNFCTR_DESC] [varchar](254) NULL,
 CONSTRAINT [PK_SurgicalSupplyManufacturerDim_MNFCTR_CDS] PRIMARY KEY CLUSTERED 
(
	[MNFCTR_CDS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
