USE [carilion_dw]
GO
set nocount on
GO

GO
/****** Object:  Table [dbo].[SurgicalProcedureEventLateralityDim]    Script Date: 6/21/2018 11:44:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SurgicalProcedureEventLateralityDim]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SurgicalProcedureEventLateralityDim](
	[LTRLTY_CDS] [int] IDENTITY(1,1) NOT NULL,
	[LTRLTY_DESC] [varchar](255) NULL,
 CONSTRAINT [PK_SurgicalProcedureEventLateralityDim_LTRLTY_CDS] PRIMARY KEY CLUSTERED 
(
	[LTRLTY_CDS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[SurgicalProcedureEventLateralityDim] ON 

INSERT [dbo].[SurgicalProcedureEventLateralityDim] ([LTRLTY_CDS], [LTRLTY_DESC]) VALUES (1, N'et fecit. Sed quad et si linguens sed volcans et Multum imaginator essit. in pladior quo et quad plorum')
INSERT [dbo].[SurgicalProcedureEventLateralityDim] ([LTRLTY_CDS], [LTRLTY_DESC]) VALUES (2, N'plorum quo nomen non gravis bono essit. plorum gravis nomen Tam si volcans pars habitatio vantis. novum')
INSERT [dbo].[SurgicalProcedureEventLateralityDim] ([LTRLTY_CDS], [LTRLTY_DESC]) VALUES (3, N'non gravis sed Pro quad eudis nomen essit. quad brevens, si imaginator pladior et essit. et volcans sed')
INSERT [dbo].[SurgicalProcedureEventLateralityDim] ([LTRLTY_CDS], [LTRLTY_DESC]) VALUES (4, N'et plorum Longam, imaginator glavans estis Pro quad et quad brevens, e non quis estis novum novum quantare estum. habitatio regit,')
INSERT [dbo].[SurgicalProcedureEventLateralityDim] ([LTRLTY_CDS], [LTRLTY_DESC]) VALUES (5, N'venit. plorum quis linguens pars nomen fecit, plurissimum estis in essit. funem. quoque quad plurissimum')
SET IDENTITY_INSERT [dbo].[SurgicalProcedureEventLateralityDim] OFF
