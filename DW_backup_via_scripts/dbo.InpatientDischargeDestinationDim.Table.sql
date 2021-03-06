USE [carilion_dw]
GO
set nocount on
GO

GO
/****** Object:  Table [dbo].[InpatientDischargeDestinationDim]    Script Date: 6/21/2018 11:44:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[InpatientDischargeDestinationDim]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[InpatientDischargeDestinationDim](
	[DSCRG_DSTN_CDS] [int] IDENTITY(1,1) NOT NULL,
	[DSCRG_DSTN_DESC] [varchar](255) NULL,
 CONSTRAINT [PK_InpatientDischargeDestinationDim_DSCRG_DSTN_CDS] PRIMARY KEY CLUSTERED 
(
	[DSCRG_DSTN_CDS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[InpatientDischargeDestinationDim] ON 

INSERT [dbo].[InpatientDischargeDestinationDim] ([DSCRG_DSTN_CDS], [DSCRG_DSTN_DESC]) VALUES (1, N'si quad apparens plorum essit. linguens quantare nomen quad cognitio, bono imaginator plorum linguens e pladior vobis')
INSERT [dbo].[InpatientDischargeDestinationDim] ([DSCRG_DSTN_CDS], [DSCRG_DSTN_DESC]) VALUES (2, N'trepicandor et linguens novum non estum. imaginator et si in Sed parte quoque quoque linguens volcans non funem.')
INSERT [dbo].[InpatientDischargeDestinationDim] ([DSCRG_DSTN_CDS], [DSCRG_DSTN_DESC]) VALUES (3, N'quo, non fecundio, plurissimum vantis. linguens et nomen pladior vobis eggredior. novum delerium. Id novum')
INSERT [dbo].[InpatientDischargeDestinationDim] ([DSCRG_DSTN_CDS], [DSCRG_DSTN_DESC]) VALUES (4, N'imaginator quad esset eudis homo, et quad quad eudis et Versus et si vantis. novum Versus parte habitatio')
INSERT [dbo].[InpatientDischargeDestinationDim] ([DSCRG_DSTN_CDS], [DSCRG_DSTN_DESC]) VALUES (5, N'gravis Quad esset brevens, quorum transit. et gravis in plorum Pro quoque quad esset manifestum vobis')
SET IDENTITY_INSERT [dbo].[InpatientDischargeDestinationDim] OFF
