USE [carilion_dw]
GO
set nocount on
GO

GO
/****** Object:  Table [dbo].[SurgicalProcedureEventProcedureSiteDim]    Script Date: 6/21/2018 11:44:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SurgicalProcedureEventProcedureSiteDim]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SurgicalProcedureEventProcedureSiteDim](
	[PRCDR_SITE_CDS] [int] IDENTITY(1,1) NOT NULL,
	[PRCDR_SITE_DESC] [varchar](255) NULL,
 CONSTRAINT [PK_SurgicalProcedureEventProcedureSiteDim_PRCDR_SITE_CDS] PRIMARY KEY CLUSTERED 
(
	[PRCDR_SITE_CDS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[SurgicalProcedureEventProcedureSiteDim] ON 

INSERT [dbo].[SurgicalProcedureEventProcedureSiteDim] ([PRCDR_SITE_CDS], [PRCDR_SITE_DESC]) VALUES (1, N'quoque habitatio nomen quartu estis brevens, non bono et non non funem. non Versus quad gravis quo linguens Pro Et')
INSERT [dbo].[SurgicalProcedureEventProcedureSiteDim] ([PRCDR_SITE_CDS], [PRCDR_SITE_DESC]) VALUES (2, N'fecundio, trepicandor fecit. nomen linguens bono dolorum quorum quantare dolorum manifestum Et et e eggredior.')
INSERT [dbo].[SurgicalProcedureEventProcedureSiteDim] ([PRCDR_SITE_CDS], [PRCDR_SITE_DESC]) VALUES (3, N'linguens brevens, Tam nomen volcans apparens travissimantor plorum plorum non venit. e volcans estis')
INSERT [dbo].[SurgicalProcedureEventProcedureSiteDim] ([PRCDR_SITE_CDS], [PRCDR_SITE_DESC]) VALUES (4, N'linguens bono e venit. estum. linguens habitatio plurissimum transit. essit. quartu glavans brevens,')
INSERT [dbo].[SurgicalProcedureEventProcedureSiteDim] ([PRCDR_SITE_CDS], [PRCDR_SITE_DESC]) VALUES (5, N'habitatio et plorum quantare brevens, quoque fecit. vantis. quad si et vobis Quad quo, non imaginator')
SET IDENTITY_INSERT [dbo].[SurgicalProcedureEventProcedureSiteDim] OFF
