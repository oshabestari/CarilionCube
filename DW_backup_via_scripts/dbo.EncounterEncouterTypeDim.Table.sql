USE [carilion_dw]
GO
set nocount on
GO

GO
/****** Object:  Table [dbo].[EncounterEncouterTypeDim]    Script Date: 6/21/2018 11:44:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EncounterEncouterTypeDim]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[EncounterEncouterTypeDim](
	[ENCNT_TYPE_CDS] [int] IDENTITY(1,1) NOT NULL,
	[ENCNT_TYPE_DESC] [varchar](254) NULL,
 CONSTRAINT [PK_EncounterEncouterTypeDim_ENCNT_TYPE_CDS] PRIMARY KEY CLUSTERED 
(
	[ENCNT_TYPE_CDS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[EncounterEncouterTypeDim] ON 

INSERT [dbo].[EncounterEncouterTypeDim] ([ENCNT_TYPE_CDS], [ENCNT_TYPE_DESC]) VALUES (1, N'et Et novum glavans eudis Et Tam gravum linguens vobis manifestum transit. eudis vobis quartu volcans glavans')
INSERT [dbo].[EncounterEncouterTypeDim] ([ENCNT_TYPE_CDS], [ENCNT_TYPE_DESC]) VALUES (2, N'esset funem. linguens egreddior gravis quad vobis fecit, egreddior sed Multum quoque in non e rarendum parte')
INSERT [dbo].[EncounterEncouterTypeDim] ([ENCNT_TYPE_CDS], [ENCNT_TYPE_DESC]) VALUES (3, N'Pro sed Tam Multum rarendum novum plorum brevens, quartu plorum ut quad cognitio, delerium. habitatio nomen')
INSERT [dbo].[EncounterEncouterTypeDim] ([ENCNT_TYPE_CDS], [ENCNT_TYPE_DESC]) VALUES (4, N'Longam, trepicandor et manifestum essit. dolorum pars si quartu fecit. homo, rarendum manifestum Et pars quoque quad Tam')
INSERT [dbo].[EncounterEncouterTypeDim] ([ENCNT_TYPE_CDS], [ENCNT_TYPE_DESC]) VALUES (5, N'et vobis quoque delerium. Quad e Et Pro vobis vobis non quad et plorum essit. non et manifestum quantare')
SET IDENTITY_INSERT [dbo].[EncounterEncouterTypeDim] OFF
