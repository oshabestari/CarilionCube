USE [carilion_dw]
GO
set nocount on
GO

GO
/****** Object:  Table [dbo].[EDVisitDispositionDim]    Script Date: 6/21/2018 11:44:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EDVisitDispositionDim]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[EDVisitDispositionDim](
	[ED_DSPSTN_CDS] [int] IDENTITY(1,1) NOT NULL,
	[ED_DSPSTN_DESC] [varchar](254) NULL,
 CONSTRAINT [PK_EDVisitDispositionDim_ED_DSPSTN_CDS] PRIMARY KEY CLUSTERED 
(
	[ED_DSPSTN_CDS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[EDVisitDispositionDim] ON 

INSERT [dbo].[EDVisitDispositionDim] ([ED_DSPSTN_CDS], [ED_DSPSTN_DESC]) VALUES (1, N'plorum quo nomen Quad estum. transit. manifestum sed homo, pars quo parte gravis fecit. eggredior. eggredior. novum')
INSERT [dbo].[EDVisitDispositionDim] ([ED_DSPSTN_CDS], [ED_DSPSTN_DESC]) VALUES (2, N'quad fecit. gravis novum novum quis linguens et venit. parte trepicandor regit, plorum quo, gravum gravis Sed')
INSERT [dbo].[EDVisitDispositionDim] ([ED_DSPSTN_CDS], [ED_DSPSTN_DESC]) VALUES (3, N'pladior quantare plorum eggredior. et quad Longam, venit. eudis vobis si brevens, essit. transit. homo,')
INSERT [dbo].[EDVisitDispositionDim] ([ED_DSPSTN_CDS], [ED_DSPSTN_DESC]) VALUES (4, N'pars non habitatio sed Pro parte gravis Longam, volcans fecit, gravum et venit. et quorum Longam, estis')
INSERT [dbo].[EDVisitDispositionDim] ([ED_DSPSTN_CDS], [ED_DSPSTN_DESC]) VALUES (5, N'linguens cognitio, quis manifestum nomen Sed Pro non essit. estis quo, nomen imaginator regit, Tam eudis Tam')
SET IDENTITY_INSERT [dbo].[EDVisitDispositionDim] OFF
