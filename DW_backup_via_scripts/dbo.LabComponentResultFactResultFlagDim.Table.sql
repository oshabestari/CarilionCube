USE [carilion_dw]
GO
set nocount on
GO

GO
/****** Object:  Table [dbo].[LabComponentResultFactResultFlagDim]    Script Date: 6/21/2018 11:44:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LabComponentResultFactResultFlagDim]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[LabComponentResultFactResultFlagDim](
	[RSLT_FLG_CD_SK] [bigint] IDENTITY(1,1) NOT NULL,
	[CD_DESC] [varchar](255) NULL,
 CONSTRAINT [PK_LabComponentResultFactResultFlagDim_RSLT_FLG_CD_SK] PRIMARY KEY CLUSTERED 
(
	[RSLT_FLG_CD_SK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[LabComponentResultFactResultFlagDim] ON 

INSERT [dbo].[LabComponentResultFactResultFlagDim] ([RSLT_FLG_CD_SK], [CD_DESC]) VALUES (1, N'sed quorum quoque rarendum si quo et pladior essit. in eggredior. vantis. vantis. vobis pars imaginator')
INSERT [dbo].[LabComponentResultFactResultFlagDim] ([RSLT_FLG_CD_SK], [CD_DESC]) VALUES (2, N'quoque non gravis bono habitatio quartu imaginator parte non plorum venit. non gravum si novum ut ut')
INSERT [dbo].[LabComponentResultFactResultFlagDim] ([RSLT_FLG_CD_SK], [CD_DESC]) VALUES (3, N'travissimantor funem. trepicandor sed quis Longam, esset fecundio, Longam, et quad Pro quad quo travissimantor')
INSERT [dbo].[LabComponentResultFactResultFlagDim] ([RSLT_FLG_CD_SK], [CD_DESC]) VALUES (4, N'volcans quartu et plorum non quartu e travissimantor si quorum si apparens estis manifestum eudis si in')
INSERT [dbo].[LabComponentResultFactResultFlagDim] ([RSLT_FLG_CD_SK], [CD_DESC]) VALUES (5, N'quoque vobis parte Longam, vobis et trepicandor et ut et vobis eggredior. quoque funem. delerium. novum dolorum')
SET IDENTITY_INSERT [dbo].[LabComponentResultFactResultFlagDim] OFF
