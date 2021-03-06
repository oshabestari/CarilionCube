USE [carilion_dw]
GO
set nocount on
GO

GO
/****** Object:  Table [dbo].[LabComponentResultFactLabStatusDim]    Script Date: 6/21/2018 11:44:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LabComponentResultFactLabStatusDim]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[LabComponentResultFactLabStatusDim](
	[LAB_STS_CD_SK] [bigint] IDENTITY(1,1) NOT NULL,
	[CD_DESC] [varchar](255) NULL,
 CONSTRAINT [PK_LabComponentResultFactLabStatusDim_LAB_STS_CD_SK] PRIMARY KEY CLUSTERED 
(
	[LAB_STS_CD_SK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[LabComponentResultFactLabStatusDim] ON 

INSERT [dbo].[LabComponentResultFactLabStatusDim] ([LAB_STS_CD_SK], [CD_DESC]) VALUES (1, N'egreddior transit. Multum trepicandor brevens, quad fecundio, in Sed regit, Pro estum. vobis pladior')
INSERT [dbo].[LabComponentResultFactLabStatusDim] ([LAB_STS_CD_SK], [CD_DESC]) VALUES (2, N'habitatio Versus dolorum Sed estis pladior nomen dolorum novum quorum plorum quad linguens e quad estis glavans essit.')
INSERT [dbo].[LabComponentResultFactLabStatusDim] ([LAB_STS_CD_SK], [CD_DESC]) VALUES (3, N'vobis estis e fecit, Sed si travissimantor quorum essit. quorum rarendum non plurissimum e apparens et trepicandor et')
INSERT [dbo].[LabComponentResultFactLabStatusDim] ([LAB_STS_CD_SK], [CD_DESC]) VALUES (4, N'quorum e vobis transit. esset nomen estis fecit, eggredior. et cognitio, glavans transit. novum rarendum')
INSERT [dbo].[LabComponentResultFactLabStatusDim] ([LAB_STS_CD_SK], [CD_DESC]) VALUES (5, N'imaginator volcans quad gravis apparens Tam Id quo nomen estis transit. volcans manifestum imaginator manifestum')
SET IDENTITY_INSERT [dbo].[LabComponentResultFactLabStatusDim] OFF
