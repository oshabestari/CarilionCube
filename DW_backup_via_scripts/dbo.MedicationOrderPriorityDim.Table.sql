USE [carilion_dw]
GO
set nocount on
GO

GO
/****** Object:  Table [dbo].[MedicationOrderPriorityDim]    Script Date: 6/21/2018 11:44:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MedicationOrderPriorityDim]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[MedicationOrderPriorityDim](
	[ORDR_PRTY_CDS] [int] IDENTITY(1,1) NOT NULL,
	[ORDR_PRTY_DESC] [varchar](255) NULL,
 CONSTRAINT [PK_MedicationOrderPriorityDim_ORDR_PRTY_CDS] PRIMARY KEY CLUSTERED 
(
	[ORDR_PRTY_CDS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[MedicationOrderPriorityDim] ON 

INSERT [dbo].[MedicationOrderPriorityDim] ([ORDR_PRTY_CDS], [ORDR_PRTY_DESC]) VALUES (1, N'glavans vobis Quad egreddior fecit. in Pro quo quad eggredior. Longam, fecundio, Quad eggredior. et gravis')
INSERT [dbo].[MedicationOrderPriorityDim] ([ORDR_PRTY_CDS], [ORDR_PRTY_DESC]) VALUES (2, N'et quo, habitatio quorum fecit, et plorum transit. ut homo, cognitio, parte non et Et quis estis quorum novum')
INSERT [dbo].[MedicationOrderPriorityDim] ([ORDR_PRTY_CDS], [ORDR_PRTY_DESC]) VALUES (3, N'eudis quad et e et novum linguens quis pars in quad nomen pars glavans rarendum habitatio pars et novum estum. Quad')
INSERT [dbo].[MedicationOrderPriorityDim] ([ORDR_PRTY_CDS], [ORDR_PRTY_DESC]) VALUES (4, N'vantis. linguens in novum si venit. quo egreddior imaginator regit, Tam apparens Et estis manifestum parte')
INSERT [dbo].[MedicationOrderPriorityDim] ([ORDR_PRTY_CDS], [ORDR_PRTY_DESC]) VALUES (5, N'non e Quad rarendum vobis trepicandor plorum imaginator linguens fecit, quad cognitio, vobis non sed')
SET IDENTITY_INSERT [dbo].[MedicationOrderPriorityDim] OFF
