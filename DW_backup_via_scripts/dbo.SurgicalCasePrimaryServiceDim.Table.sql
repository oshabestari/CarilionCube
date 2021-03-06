USE [carilion_dw]
GO
set nocount on
GO

GO
/****** Object:  Table [dbo].[SurgicalCasePrimaryServiceDim]    Script Date: 6/21/2018 11:44:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SurgicalCasePrimaryServiceDim]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SurgicalCasePrimaryServiceDim](
	[PRMY_SRVC_CDS] [int] IDENTITY(1,1) NOT NULL,
	[PRMY_SRVC_DESC] [varchar](254) NULL,
 CONSTRAINT [PK_SurgicalCasePrimaryServiceDim_PRMY_SRVC_CDS] PRIMARY KEY CLUSTERED 
(
	[PRMY_SRVC_CDS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[SurgicalCasePrimaryServiceDim] ON 

INSERT [dbo].[SurgicalCasePrimaryServiceDim] ([PRMY_SRVC_CDS], [PRMY_SRVC_DESC]) VALUES (1, N'estum. Multum venit. eggredior. non gravis transit. quad quorum et sed gravum si non habitatio nomen')
INSERT [dbo].[SurgicalCasePrimaryServiceDim] ([PRMY_SRVC_CDS], [PRMY_SRVC_DESC]) VALUES (2, N'estum. vobis linguens novum manifestum cognitio, apparens plurissimum e essit. fecit, venit. habitatio')
INSERT [dbo].[SurgicalCasePrimaryServiceDim] ([PRMY_SRVC_CDS], [PRMY_SRVC_DESC]) VALUES (3, N'eggredior. eudis quantare manifestum novum estis apparens quo quorum estis quorum sed delerium. quo linguens')
INSERT [dbo].[SurgicalCasePrimaryServiceDim] ([PRMY_SRVC_CDS], [PRMY_SRVC_DESC]) VALUES (4, N'delerium. trepicandor e quoque gravum essit. funem. sed eudis Et vantis. rarendum brevens, quantare parte linguens')
INSERT [dbo].[SurgicalCasePrimaryServiceDim] ([PRMY_SRVC_CDS], [PRMY_SRVC_DESC]) VALUES (5, N'et Multum bono et Sed apparens si manifestum plurissimum plurissimum et quo pars eggredior. Multum vobis')
SET IDENTITY_INSERT [dbo].[SurgicalCasePrimaryServiceDim] OFF
