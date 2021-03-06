USE [carilion_dw]
GO
set nocount on
GO

GO
/****** Object:  Table [dbo].[SurgicalCaseProcedureLevelDim]    Script Date: 6/21/2018 11:44:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SurgicalCaseProcedureLevelDim]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SurgicalCaseProcedureLevelDim](
	[PRCDR_LEVL_CDS] [int] IDENTITY(1,1) NOT NULL,
	[PRCDR_LEVL_DESC] [varchar](254) NULL,
 CONSTRAINT [PK_SurgicalCaseProcedureLevelDim_PRCDR_LEVL_CDS] PRIMARY KEY CLUSTERED 
(
	[PRCDR_LEVL_CDS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[SurgicalCaseProcedureLevelDim] ON 

INSERT [dbo].[SurgicalCaseProcedureLevelDim] ([PRCDR_LEVL_CDS], [PRCDR_LEVL_DESC]) VALUES (1, N'quartu quad quad volcans Quad glavans et parte si non vobis ut quad Pro nomen parte et esset transit.')
INSERT [dbo].[SurgicalCaseProcedureLevelDim] ([PRCDR_LEVL_CDS], [PRCDR_LEVL_DESC]) VALUES (2, N'novum si manifestum Pro fecit, si nomen esset ut Sed vobis pars gravum et et travissimantor Longam, imaginator')
INSERT [dbo].[SurgicalCaseProcedureLevelDim] ([PRCDR_LEVL_CDS], [PRCDR_LEVL_DESC]) VALUES (3, N'in quad trepicandor et funem. egreddior plurissimum delerium. dolorum Id travissimantor Quad nomen estis')
INSERT [dbo].[SurgicalCaseProcedureLevelDim] ([PRCDR_LEVL_CDS], [PRCDR_LEVL_DESC]) VALUES (4, N'egreddior estum. e ut quartu habitatio fecit, si fecundio, Pro essit. pars bono quartu delerium. delerium.')
INSERT [dbo].[SurgicalCaseProcedureLevelDim] ([PRCDR_LEVL_CDS], [PRCDR_LEVL_DESC]) VALUES (5, N'manifestum novum quad apparens gravis et ut fecit, e e esset esset quoque quantare trepicandor non dolorum habitatio')
SET IDENTITY_INSERT [dbo].[SurgicalCaseProcedureLevelDim] OFF
