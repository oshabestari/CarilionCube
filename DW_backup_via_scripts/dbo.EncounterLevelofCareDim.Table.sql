USE [carilion_dw]
GO
set nocount on
GO

GO
/****** Object:  Table [dbo].[EncounterLevelofCareDim]    Script Date: 6/21/2018 11:44:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EncounterLevelofCareDim]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[EncounterLevelofCareDim](
	[LEVL_OF_CARE_CDS] [int] IDENTITY(1,1) NOT NULL,
	[LEVL_OF_CARE_DESC] [varchar](254) NULL,
 CONSTRAINT [PK_EncounterLevelofCareDim_LEVL_OF_CARE_CDS] PRIMARY KEY CLUSTERED 
(
	[LEVL_OF_CARE_CDS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[EncounterLevelofCareDim] ON 

INSERT [dbo].[EncounterLevelofCareDim] ([LEVL_OF_CARE_CDS], [LEVL_OF_CARE_DESC]) VALUES (1, N'Sed Id non gravis in parte quo quad nomen glavans fecundio, volcans Pro egreddior vobis Pro plurissimum')
INSERT [dbo].[EncounterLevelofCareDim] ([LEVL_OF_CARE_CDS], [LEVL_OF_CARE_DESC]) VALUES (2, N'quo esset gravis pladior plorum parte plurissimum Quad si quantare venit. quad delerium. estis venit. esset')
INSERT [dbo].[EncounterLevelofCareDim] ([LEVL_OF_CARE_CDS], [LEVL_OF_CARE_DESC]) VALUES (3, N'et transit. esset fecundio, in egreddior regit, quo Longam, et funem. esset novum essit. delerium. in non')
INSERT [dbo].[EncounterLevelofCareDim] ([LEVL_OF_CARE_CDS], [LEVL_OF_CARE_DESC]) VALUES (4, N'brevens, homo, eudis gravum homo, quo eggredior. brevens, si non bono funem. fecit. quad in Versus parte et non')
INSERT [dbo].[EncounterLevelofCareDim] ([LEVL_OF_CARE_CDS], [LEVL_OF_CARE_DESC]) VALUES (5, N'non e et Id eggredior. pladior e habitatio si fecit, bono quorum et novum vobis vantis. funem. sed novum vobis')
SET IDENTITY_INSERT [dbo].[EncounterLevelofCareDim] OFF
