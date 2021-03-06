USE [carilion_dw]
GO
set nocount on
GO

GO
/****** Object:  Table [dbo].[LabTestOrderTypeDim]    Script Date: 6/21/2018 11:44:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LabTestOrderTypeDim]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[LabTestOrderTypeDim](
	[ORDR_TYPE_CDS] [int] IDENTITY(1,1) NOT NULL,
	[ORDR_TYPE_DESC] [varchar](50) NULL,
 CONSTRAINT [PK_LabTestOrderTypeDim_ORDR_TYPE_CDS] PRIMARY KEY CLUSTERED 
(
	[ORDR_TYPE_CDS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[LabTestOrderTypeDim] ON 

INSERT [dbo].[LabTestOrderTypeDim] ([ORDR_TYPE_CDS], [ORDR_TYPE_DESC]) VALUES (1, N'e pars fecit, non gravis manifestum glavans Versus')
INSERT [dbo].[LabTestOrderTypeDim] ([ORDR_TYPE_CDS], [ORDR_TYPE_DESC]) VALUES (2, N'bono quartu sed quoque gravum homo, plorum Longam,')
INSERT [dbo].[LabTestOrderTypeDim] ([ORDR_TYPE_CDS], [ORDR_TYPE_DESC]) VALUES (3, N'et linguens Multum Longam, e venit. et plorum non')
INSERT [dbo].[LabTestOrderTypeDim] ([ORDR_TYPE_CDS], [ORDR_TYPE_DESC]) VALUES (4, N'dolorum habitatio gravis transit. si imaginator')
INSERT [dbo].[LabTestOrderTypeDim] ([ORDR_TYPE_CDS], [ORDR_TYPE_DESC]) VALUES (5, N'et Quad eggredior. volcans quoque plorum e homo,')
SET IDENTITY_INSERT [dbo].[LabTestOrderTypeDim] OFF
