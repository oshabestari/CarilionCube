USE [carilion_dw]
GO
set nocount on
GO

GO
/****** Object:  Table [dbo].[MedicationOrderDoseUnitDim]    Script Date: 6/21/2018 11:44:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MedicationOrderDoseUnitDim]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[MedicationOrderDoseUnitDim](
	[DOSE_UNT_CDS] [int] IDENTITY(1,1) NOT NULL,
	[DOSE_UNT_DESC] [varchar](255) NULL,
 CONSTRAINT [PK_MedicationOrderDoseUnitDim_DOSE_UNT_CDS] PRIMARY KEY CLUSTERED 
(
	[DOSE_UNT_CDS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[MedicationOrderDoseUnitDim] ON 

INSERT [dbo].[MedicationOrderDoseUnitDim] ([DOSE_UNT_CDS], [DOSE_UNT_DESC]) VALUES (1, N'delerium. regit, bono e et fecit, cognitio, vobis e Pro travissimantor estum. sed gravis vantis. eggredior. Pro quoque')
INSERT [dbo].[MedicationOrderDoseUnitDim] ([DOSE_UNT_CDS], [DOSE_UNT_DESC]) VALUES (2, N'regit, plorum trepicandor plorum estum. quoque estum. bono et et fecit, funem. Tam quad quo pladior gravis Quad pladior manifestum')
INSERT [dbo].[MedicationOrderDoseUnitDim] ([DOSE_UNT_CDS], [DOSE_UNT_DESC]) VALUES (3, N'funem. Quad e Id linguens apparens Tam quartu pars linguens Longam, sed funem. linguens quo delerium. cognitio,')
INSERT [dbo].[MedicationOrderDoseUnitDim] ([DOSE_UNT_CDS], [DOSE_UNT_DESC]) VALUES (4, N'Versus rarendum vobis et homo, fecit, linguens essit. e linguens et brevens, e parte quorum pars ut imaginator Quad')
INSERT [dbo].[MedicationOrderDoseUnitDim] ([DOSE_UNT_CDS], [DOSE_UNT_DESC]) VALUES (5, N'in bono quo, e in novum volcans cognitio, quoque in linguens sed plorum estis si quad Sed e parte Id')
SET IDENTITY_INSERT [dbo].[MedicationOrderDoseUnitDim] OFF
