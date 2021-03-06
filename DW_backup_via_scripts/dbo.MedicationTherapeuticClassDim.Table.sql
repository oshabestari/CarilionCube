USE [carilion_dw]
GO
set nocount on
GO

GO
/****** Object:  Table [dbo].[MedicationTherapeuticClassDim]    Script Date: 6/21/2018 11:44:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MedicationTherapeuticClassDim]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[MedicationTherapeuticClassDim](
	[THRPC_CLASS_CDS] [int] IDENTITY(1,1) NOT NULL,
	[THRPC_CLASS_DESC] [varchar](255) NULL,
 CONSTRAINT [PK_MedicationTherapeuticClassDim_THRPC_CLASS_CDS] PRIMARY KEY CLUSTERED 
(
	[THRPC_CLASS_CDS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[MedicationTherapeuticClassDim] ON 

INSERT [dbo].[MedicationTherapeuticClassDim] ([THRPC_CLASS_CDS], [THRPC_CLASS_DESC]) VALUES (1, NULL)
INSERT [dbo].[MedicationTherapeuticClassDim] ([THRPC_CLASS_CDS], [THRPC_CLASS_DESC]) VALUES (2, N'Sed Longam, non sed eggredior. egreddior et quad quo habitatio quad quartu quad rarendum travissimantor et glavans')
INSERT [dbo].[MedicationTherapeuticClassDim] ([THRPC_CLASS_CDS], [THRPC_CLASS_DESC]) VALUES (3, N'in egreddior quad nomen funem. et linguens quo sed Id sed non eudis plurissimum et non Pro Id plorum')
INSERT [dbo].[MedicationTherapeuticClassDim] ([THRPC_CLASS_CDS], [THRPC_CLASS_DESC]) VALUES (4, N'regit, et et Tam vobis quo estum. non quo, travissimantor brevens, quad Pro non novum glavans estis quo')
INSERT [dbo].[MedicationTherapeuticClassDim] ([THRPC_CLASS_CDS], [THRPC_CLASS_DESC]) VALUES (5, N'egreddior plurissimum plorum pladior eudis parte linguens quantare Longam, homo, funem. Id quo, linguens')
SET IDENTITY_INSERT [dbo].[MedicationTherapeuticClassDim] OFF
