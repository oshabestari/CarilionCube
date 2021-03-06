USE [carilion_dw]
GO
set nocount on
GO

GO
/****** Object:  Table [dbo].[MedicationOrderQuantityUnitDim]    Script Date: 6/21/2018 11:44:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MedicationOrderQuantityUnitDim]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[MedicationOrderQuantityUnitDim](
	[QTY_UNT_CDS] [int] IDENTITY(1,1) NOT NULL,
	[QTY_UNT_DESC] [varchar](255) NULL,
 CONSTRAINT [PK_MedicationOrderQuantityUnitDim_QTY_UNT_CDS] PRIMARY KEY CLUSTERED 
(
	[QTY_UNT_CDS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[MedicationOrderQuantityUnitDim] ON 

INSERT [dbo].[MedicationOrderQuantityUnitDim] ([QTY_UNT_CDS], [QTY_UNT_DESC]) VALUES (1, N'et et vobis novum venit. rarendum quartu egreddior essit. linguens egreddior eudis quorum fecit. pars egreddior')
INSERT [dbo].[MedicationOrderQuantityUnitDim] ([QTY_UNT_CDS], [QTY_UNT_DESC]) VALUES (2, NULL)
INSERT [dbo].[MedicationOrderQuantityUnitDim] ([QTY_UNT_CDS], [QTY_UNT_DESC]) VALUES (3, N'si quo rarendum venit. plorum gravis e quo habitatio si dolorum plorum e plurissimum gravis Multum quo quoque et plorum novum')
INSERT [dbo].[MedicationOrderQuantityUnitDim] ([QTY_UNT_CDS], [QTY_UNT_DESC]) VALUES (4, N'linguens gravis bono travissimantor apparens esset linguens transit. quartu si quad linguens sed dolorum habitatio fecundio,')
INSERT [dbo].[MedicationOrderQuantityUnitDim] ([QTY_UNT_CDS], [QTY_UNT_DESC]) VALUES (5, N'linguens bono linguens in cognitio, imaginator homo, eggredior. plorum linguens e quorum cognitio, Et dolorum Tam trepicandor')
SET IDENTITY_INSERT [dbo].[MedicationOrderQuantityUnitDim] OFF
