USE [carilion_dw]
GO
set nocount on
GO

GO
/****** Object:  Table [dbo].[MedicationFormDim]    Script Date: 6/21/2018 11:44:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MedicationFormDim]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[MedicationFormDim](
	[MDCTN_FORM_CDS] [int] IDENTITY(1,1) NOT NULL,
	[MDCTN_FORM_DESC] [varchar](255) NULL,
 CONSTRAINT [PK_MedicationFormDim_MDCTN_FORM_CDS] PRIMARY KEY CLUSTERED 
(
	[MDCTN_FORM_CDS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[MedicationFormDim] ON 

INSERT [dbo].[MedicationFormDim] ([MDCTN_FORM_CDS], [MDCTN_FORM_DESC]) VALUES (1, N'estum. et venit. quad Quad cognitio, et quad manifestum rarendum imaginator trepicandor essit. venit.')
INSERT [dbo].[MedicationFormDim] ([MDCTN_FORM_CDS], [MDCTN_FORM_DESC]) VALUES (2, N'et quartu venit. dolorum quoque transit. et novum quo vobis regit, non non Et cognitio, homo, novum pladior transit. glavans')
INSERT [dbo].[MedicationFormDim] ([MDCTN_FORM_CDS], [MDCTN_FORM_DESC]) VALUES (3, N'vobis gravum glavans quo, Tam Sed linguens pladior si novum non fecundio, eggredior. Longam, Pro gravis pladior')
INSERT [dbo].[MedicationFormDim] ([MDCTN_FORM_CDS], [MDCTN_FORM_DESC]) VALUES (4, N'gravis quad Sed manifestum et si imaginator et gravum plorum non venit. gravis plurissimum habitatio')
INSERT [dbo].[MedicationFormDim] ([MDCTN_FORM_CDS], [MDCTN_FORM_DESC]) VALUES (5, N'in fecit. fecundio, si Et quad manifestum novum Versus transit. Quad e et eggredior. gravum non gravis')
SET IDENTITY_INSERT [dbo].[MedicationFormDim] OFF
