SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PharmacyDim](
	[PHRM_SK] [bigint] IDENTITY(1,1) NOT NULL,
	[SRC_PHRM_ID] [varchar](255) NULL,
	[PHRM_NM] [varchar](255) NULL,
	[SYS_TYPE_DESC] [varchar](255) NULL,
	[PHY_TYPE_CDS] [int] NULL,
	[NPI_NUM] [varchar](50) NULL,
	[DEA_NUM] [varchar](50) NULL,
	[NCPDP_NUM] [varchar](50) NULL,
	[FCLT_SPRT_IND] [varchar](3) NULL,
	[RX_SUP_IND] [varchar](3) NULL,
 CONSTRAINT [PK_PharmacyDim_PHRM_SK] PRIMARY KEY CLUSTERED 
(
	[PHRM_SK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PharmacyDim]  WITH CHECK ADD  CONSTRAINT [PharmacyDim-PharmacyPhysicalTypeDim] FOREIGN KEY([PHY_TYPE_CDS])
REFERENCES [dbo].[PharmacyPhysicalTypeDim] ([PHY_TYPE_CDS])
GO
ALTER TABLE [dbo].[PharmacyDim] CHECK CONSTRAINT [PharmacyDim-PharmacyPhysicalTypeDim]
GO
