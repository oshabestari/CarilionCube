USE [carilion_dw]
GO
set nocount on
GO

GO
/****** Object:  Table [dbo].[MedicationOrderSourceDim]    Script Date: 6/21/2018 11:44:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MedicationOrderSourceDim]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[MedicationOrderSourceDim](
	[ORDR_SRC_CDS] [int] IDENTITY(1,1) NOT NULL,
	[ORDR_SRC_DESC] [varchar](255) NULL,
 CONSTRAINT [PK_MedicationOrderSourceDim_ORDR_SRC_CDS] PRIMARY KEY CLUSTERED 
(
	[ORDR_SRC_CDS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[MedicationOrderSourceDim] ON 

INSERT [dbo].[MedicationOrderSourceDim] ([ORDR_SRC_CDS], [ORDR_SRC_DESC]) VALUES (1, N'eggredior. si plorum eudis gravis homo, quad linguens si quartu transit. et nomen nomen et venit. quad nomen quantare')
INSERT [dbo].[MedicationOrderSourceDim] ([ORDR_SRC_CDS], [ORDR_SRC_DESC]) VALUES (2, N'imaginator et quo, sed manifestum quis non non quis Id travissimantor et quantare imaginator quad et')
INSERT [dbo].[MedicationOrderSourceDim] ([ORDR_SRC_CDS], [ORDR_SRC_DESC]) VALUES (3, N'trepicandor Pro novum non Multum gravis quantare gravis parte nomen dolorum non quoque novum Id vantis.')
INSERT [dbo].[MedicationOrderSourceDim] ([ORDR_SRC_CDS], [ORDR_SRC_DESC]) VALUES (4, N'essit. estum. quis esset venit. fecundio, manifestum quo homo, transit. cognitio, Quad quis novum fecit, e')
INSERT [dbo].[MedicationOrderSourceDim] ([ORDR_SRC_CDS], [ORDR_SRC_DESC]) VALUES (5, N'quis et vobis vobis non quartu estis Pro regit, rarendum Id linguens cognitio, travissimantor et bono')
SET IDENTITY_INSERT [dbo].[MedicationOrderSourceDim] OFF
