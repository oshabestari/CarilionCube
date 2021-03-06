USE [carilion_dw]
GO
set nocount on
GO

GO
/****** Object:  Table [dbo].[SurgicalProcedureEventServiceDim]    Script Date: 6/21/2018 11:44:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SurgicalProcedureEventServiceDim]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SurgicalProcedureEventServiceDim](
	[SRVC_CDS] [int] IDENTITY(1,1) NOT NULL,
	[SRVC_DESC] [varchar](255) NULL,
 CONSTRAINT [PK_SurgicalProcedureEventServiceDim_SRVC_CDS] PRIMARY KEY CLUSTERED 
(
	[SRVC_CDS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[SurgicalProcedureEventServiceDim] ON 

INSERT [dbo].[SurgicalProcedureEventServiceDim] ([SRVC_CDS], [SRVC_DESC]) VALUES (1, N'Quad transit. egreddior et et quantare in fecit, vobis gravum quis trepicandor et gravis linguens plorum')
INSERT [dbo].[SurgicalProcedureEventServiceDim] ([SRVC_CDS], [SRVC_DESC]) VALUES (2, N'Pro novum Tam cognitio, novum quad nomen novum travissimantor quantare rarendum et e funem. quo, et Tam trepicandor non glavans volcans Multum')
INSERT [dbo].[SurgicalProcedureEventServiceDim] ([SRVC_CDS], [SRVC_DESC]) VALUES (3, N'quorum non Pro quad manifestum novum Tam nomen plurissimum si non in et nomen egreddior Id homo, plorum et')
INSERT [dbo].[SurgicalProcedureEventServiceDim] ([SRVC_CDS], [SRVC_DESC]) VALUES (4, N'Quad pladior sed si quad et e brevens, quorum Multum bono eggredior. Sed non egreddior gravum regit, quo')
INSERT [dbo].[SurgicalProcedureEventServiceDim] ([SRVC_CDS], [SRVC_DESC]) VALUES (5, N'vobis delerium. bono quorum fecit. vobis vantis. parte quorum plurissimum quo non e Pro non quoque apparens')
SET IDENTITY_INSERT [dbo].[SurgicalProcedureEventServiceDim] OFF
