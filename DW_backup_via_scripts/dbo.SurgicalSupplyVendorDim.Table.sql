USE [carilion_dw]
GO
set nocount on
GO

GO
/****** Object:  Table [dbo].[SurgicalSupplyVendorDim]    Script Date: 6/21/2018 11:44:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SurgicalSupplyVendorDim]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SurgicalSupplyVendorDim](
	[VND_CDS] [int] IDENTITY(1,1) NOT NULL,
	[VND_DESC] [varchar](254) NULL,
 CONSTRAINT [PK_SurgicalSupplyVendorDim_VND_CDS] PRIMARY KEY CLUSTERED 
(
	[VND_CDS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[SurgicalSupplyVendorDim] ON 

INSERT [dbo].[SurgicalSupplyVendorDim] ([VND_CDS], [VND_DESC]) VALUES (1, N'regit, estum. eggredior. travissimantor gravis linguens rarendum rarendum et pladior pars dolorum funem. plorum quad')
INSERT [dbo].[SurgicalSupplyVendorDim] ([VND_CDS], [VND_DESC]) VALUES (2, N'Versus venit. quo dolorum glavans cognitio, quorum venit. quad pladior e e quartu et Et bono Id quad')
INSERT [dbo].[SurgicalSupplyVendorDim] ([VND_CDS], [VND_DESC]) VALUES (3, N'novum manifestum imaginator cognitio, non vobis imaginator quo, estis novum quad quorum gravum vobis Quad fecit, regit, Sed brevens,')
INSERT [dbo].[SurgicalSupplyVendorDim] ([VND_CDS], [VND_DESC]) VALUES (4, N'fecit, volcans dolorum novum fecundio, imaginator plurissimum eggredior. brevens, non quorum et sed fecit, Tam')
INSERT [dbo].[SurgicalSupplyVendorDim] ([VND_CDS], [VND_DESC]) VALUES (5, N'e si linguens linguens plorum e vantis. et fecundio, vobis et non bono Et Multum Sed quoque cognitio,')
SET IDENTITY_INSERT [dbo].[SurgicalSupplyVendorDim] OFF
