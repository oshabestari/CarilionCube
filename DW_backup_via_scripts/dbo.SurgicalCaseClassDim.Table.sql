USE [carilion_dw]
GO
set nocount on
GO

GO
/****** Object:  Table [dbo].[SurgicalCaseClassDim]    Script Date: 6/21/2018 11:44:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SurgicalCaseClassDim]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SurgicalCaseClassDim](
	[CL_CDS] [int] IDENTITY(1,1) NOT NULL,
	[CL_DESC] [varchar](254) NULL,
 CONSTRAINT [PK_SurgicalCaseClassDim_CL_CDS] PRIMARY KEY CLUSTERED 
(
	[CL_CDS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[SurgicalCaseClassDim] ON 

INSERT [dbo].[SurgicalCaseClassDim] ([CL_CDS], [CL_DESC]) VALUES (1, N'non quorum et Quad et ut non glavans linguens fecundio, in habitatio venit. glavans cognitio, estum.')
INSERT [dbo].[SurgicalCaseClassDim] ([CL_CDS], [CL_DESC]) VALUES (2, N'et dolorum et trepicandor delerium. et quoque quo novum essit. Multum non quad linguens travissimantor')
INSERT [dbo].[SurgicalCaseClassDim] ([CL_CDS], [CL_DESC]) VALUES (3, N'Longam, non quo, trepicandor Pro Sed nomen Quad Id novum Sed Tam quad nomen Tam estum. esset sed vantis. quo, eggredior.')
INSERT [dbo].[SurgicalCaseClassDim] ([CL_CDS], [CL_DESC]) VALUES (4, N'linguens e novum Longam, quad regit, non habitatio trepicandor pladior imaginator habitatio novum et')
INSERT [dbo].[SurgicalCaseClassDim] ([CL_CDS], [CL_DESC]) VALUES (5, N'si gravis linguens trepicandor et si vobis quo trepicandor funem. Id quoque et brevens, Multum sed et eggredior. et si')
SET IDENTITY_INSERT [dbo].[SurgicalCaseClassDim] OFF
