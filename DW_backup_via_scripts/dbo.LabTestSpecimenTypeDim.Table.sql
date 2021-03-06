USE [carilion_dw]
GO
set nocount on
GO

GO
/****** Object:  Table [dbo].[LabTestSpecimenTypeDim]    Script Date: 6/21/2018 11:44:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LabTestSpecimenTypeDim]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[LabTestSpecimenTypeDim](
	[SPCMN_TYPE_CDS] [int] IDENTITY(1,1) NOT NULL,
	[SPCMN_TYPE_DESC] [varchar](255) NULL,
 CONSTRAINT [PK_LabTestSpecimenTypeDim_SPCMN_TYPE_CDS] PRIMARY KEY CLUSTERED 
(
	[SPCMN_TYPE_CDS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[LabTestSpecimenTypeDim] ON 

INSERT [dbo].[LabTestSpecimenTypeDim] ([SPCMN_TYPE_CDS], [SPCMN_TYPE_DESC]) VALUES (1, N'regit, nomen quantare nomen eudis e quad Et homo, quad regit, Versus gravis quo eggredior. quad quorum')
INSERT [dbo].[LabTestSpecimenTypeDim] ([SPCMN_TYPE_CDS], [SPCMN_TYPE_DESC]) VALUES (2, N'et et quad quad quorum plurissimum vobis delerium. e si et imaginator gravis pars quoque novum fecit,')
INSERT [dbo].[LabTestSpecimenTypeDim] ([SPCMN_TYPE_CDS], [SPCMN_TYPE_DESC]) VALUES (3, N'novum Sed imaginator estum. gravum habitatio estis volcans glavans habitatio plorum quartu novum gravum quad')
INSERT [dbo].[LabTestSpecimenTypeDim] ([SPCMN_TYPE_CDS], [SPCMN_TYPE_DESC]) VALUES (4, N'si et linguens rarendum volcans non pladior vobis non gravum Et funem. Sed Et et non quad volcans quad')
INSERT [dbo].[LabTestSpecimenTypeDim] ([SPCMN_TYPE_CDS], [SPCMN_TYPE_DESC]) VALUES (5, N'parte gravum delerium. estis plorum eggredior. et pars delerium. brevens, funem. vobis Quad linguens quo')
SET IDENTITY_INSERT [dbo].[LabTestSpecimenTypeDim] OFF
