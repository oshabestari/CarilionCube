USE [carilion_dw]
GO
set nocount on
GO

GO
/****** Object:  Table [dbo].[LabTestVerificationStatusDim]    Script Date: 6/21/2018 11:44:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LabTestVerificationStatusDim]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[LabTestVerificationStatusDim](
	[VRFCTN_STS_CDS] [int] IDENTITY(1,1) NOT NULL,
	[VRFCTN_STS_DESC] [varchar](255) NULL,
 CONSTRAINT [PK_LabTestVerificationStatusDim_VRFCTN_STS_CDS] PRIMARY KEY CLUSTERED 
(
	[VRFCTN_STS_CDS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[LabTestVerificationStatusDim] ON 

INSERT [dbo].[LabTestVerificationStatusDim] ([VRFCTN_STS_CDS], [VRFCTN_STS_DESC]) VALUES (1, N'ut bono glavans plorum eggredior. e essit. plurissimum parte quantare travissimantor Et plorum estum.')
INSERT [dbo].[LabTestVerificationStatusDim] ([VRFCTN_STS_CDS], [VRFCTN_STS_DESC]) VALUES (2, N'dolorum essit. nomen nomen fecit. Sed bono rarendum habitatio glavans quad egreddior Versus homo, manifestum gravum')
INSERT [dbo].[LabTestVerificationStatusDim] ([VRFCTN_STS_CDS], [VRFCTN_STS_DESC]) VALUES (3, NULL)
INSERT [dbo].[LabTestVerificationStatusDim] ([VRFCTN_STS_CDS], [VRFCTN_STS_DESC]) VALUES (4, N'transit. quartu gravis e fecit. quo, apparens essit. quo transit. gravum gravis novum non Multum e vobis delerium.')
INSERT [dbo].[LabTestVerificationStatusDim] ([VRFCTN_STS_CDS], [VRFCTN_STS_DESC]) VALUES (5, N'quis eggredior. gravum Pro linguens venit. quad quis regit, dolorum Et imaginator volcans estum. fecundio,')
SET IDENTITY_INSERT [dbo].[LabTestVerificationStatusDim] OFF
