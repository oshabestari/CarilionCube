USE [carilion_dw]
GO
set nocount on
GO

GO
/****** Object:  Table [dbo].[InpatientDischargeDispositionDim]    Script Date: 6/21/2018 11:44:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[InpatientDischargeDispositionDim]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[InpatientDischargeDispositionDim](
	[DSCRG_DSPSTN_CDS] [int] IDENTITY(1,1) NOT NULL,
	[DSCRG_DSPSTN_DESC] [varchar](255) NULL,
 CONSTRAINT [PK_InpatientDischargeDispositionDim_DSCRG_DSPSTN_CDS] PRIMARY KEY CLUSTERED 
(
	[DSCRG_DSPSTN_CDS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[InpatientDischargeDispositionDim] ON 

INSERT [dbo].[InpatientDischargeDispositionDim] ([DSCRG_DSPSTN_CDS], [DSCRG_DSPSTN_DESC]) VALUES (1, N'linguens travissimantor trepicandor vobis Sed et Quad linguens gravum regit, quo funem. Quad cognitio,')
INSERT [dbo].[InpatientDischargeDispositionDim] ([DSCRG_DSPSTN_CDS], [DSCRG_DSPSTN_DESC]) VALUES (2, N'transit. venit. vobis Versus delerium. Et non gravis dolorum cognitio, quorum fecit, habitatio homo, Pro quis')
INSERT [dbo].[InpatientDischargeDispositionDim] ([DSCRG_DSPSTN_CDS], [DSCRG_DSPSTN_DESC]) VALUES (3, N'estis Tam vobis brevens, quoque eudis delerium. travissimantor nomen pars quorum et quis nomen delerium. gravis habitatio in eggredior.')
INSERT [dbo].[InpatientDischargeDispositionDim] ([DSCRG_DSPSTN_CDS], [DSCRG_DSPSTN_DESC]) VALUES (4, N'bono estum. Versus nomen volcans vobis e Pro essit. et fecundio, quo quo plorum quartu gravis Id pladior et')
INSERT [dbo].[InpatientDischargeDispositionDim] ([DSCRG_DSPSTN_CDS], [DSCRG_DSPSTN_DESC]) VALUES (5, N'Et plorum non essit. e et homo, Tam sed plorum gravis Et brevens, et gravum pladior Versus gravum fecit, quoque et')
SET IDENTITY_INSERT [dbo].[InpatientDischargeDispositionDim] OFF
