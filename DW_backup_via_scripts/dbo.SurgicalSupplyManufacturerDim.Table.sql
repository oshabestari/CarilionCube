USE [carilion_dw]
GO
set nocount on
GO

GO
/****** Object:  Table [dbo].[SurgicalSupplyManufacturerDim]    Script Date: 6/21/2018 11:44:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SurgicalSupplyManufacturerDim]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SurgicalSupplyManufacturerDim](
	[MNFCTR_CDS] [varchar](20) NOT NULL,
	[MNFCTR_DESC] [varchar](254) NULL,
 CONSTRAINT [PK_SurgicalSupplyManufacturerDim_MNFCTR_CDS] PRIMARY KEY CLUSTERED 
(
	[MNFCTR_CDS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
INSERT [dbo].[SurgicalSupplyManufacturerDim] ([MNFCTR_CDS], [MNFCTR_DESC]) VALUES (N'6IZU3C', N'apparens in delerium. habitatio quo eudis sed Id nomen quo, novum bono quantare imaginator linguens dolorum Quad')
INSERT [dbo].[SurgicalSupplyManufacturerDim] ([MNFCTR_CDS], [MNFCTR_DESC]) VALUES (N'CILFMF', N'cognitio, egreddior Tam gravum estum. quad estum. quo linguens funem. glavans nomen quartu fecundio, transit. estum. fecit, et')
INSERT [dbo].[SurgicalSupplyManufacturerDim] ([MNFCTR_CDS], [MNFCTR_DESC]) VALUES (N'KMKBTT4FD', N'quo, Pro vobis quo, fecit. bono regit, delerium. esset transit. Tam quo quantare non glavans volcans')
INSERT [dbo].[SurgicalSupplyManufacturerDim] ([MNFCTR_CDS], [MNFCTR_DESC]) VALUES (N'P1AEOS', N'funem. quad plorum glavans vobis non non sed quad quo dolorum funem. homo, et pladior ut quantare vobis')
INSERT [dbo].[SurgicalSupplyManufacturerDim] ([MNFCTR_CDS], [MNFCTR_DESC]) VALUES (N'RIH9Y0', N'si non et esset essit. Tam habitatio quo non Et estum. sed e pladior quo, vantis. essit. si travissimantor eudis')
