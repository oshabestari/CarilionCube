USE [carilion_dw]
GO
set nocount on
GO

GO
/****** Object:  Table [dbo].[SugicalProcedureEventWoundClassDim]    Script Date: 6/21/2018 11:44:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SugicalProcedureEventWoundClassDim]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SugicalProcedureEventWoundClassDim](
	[WND_CLASS_CDS] [int] IDENTITY(1,1) NOT NULL,
	[WND_CLASS_DESC] [varchar](255) NULL,
 CONSTRAINT [PK_SugicalProcedureEventWoundClassDim_WND_CLASS_CDS] PRIMARY KEY CLUSTERED 
(
	[WND_CLASS_CDS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[SugicalProcedureEventWoundClassDim] ON 

INSERT [dbo].[SugicalProcedureEventWoundClassDim] ([WND_CLASS_CDS], [WND_CLASS_DESC]) VALUES (1, N'nomen Id parte non novum et vobis egreddior e si quad fecit. bono quartu essit. novum in funem. trepicandor volcans')
INSERT [dbo].[SugicalProcedureEventWoundClassDim] ([WND_CLASS_CDS], [WND_CLASS_DESC]) VALUES (2, N'nomen plurissimum dolorum esset Quad et e venit. Id trepicandor gravis cognitio, et linguens quartu fecit. plorum')
INSERT [dbo].[SugicalProcedureEventWoundClassDim] ([WND_CLASS_CDS], [WND_CLASS_DESC]) VALUES (3, N'Quad et Longam, rarendum et essit. gravis quartu nomen manifestum travissimantor sed et Quad et travissimantor')
INSERT [dbo].[SugicalProcedureEventWoundClassDim] ([WND_CLASS_CDS], [WND_CLASS_DESC]) VALUES (4, N'vobis delerium. quo brevens, venit. non si regit, sed Multum Longam, quo rarendum et Versus fecit. plorum')
INSERT [dbo].[SugicalProcedureEventWoundClassDim] ([WND_CLASS_CDS], [WND_CLASS_DESC]) VALUES (5, N'non si et regit, quartu homo, plorum linguens dolorum novum ut plorum quad et e quartu et ut Id plorum')
SET IDENTITY_INSERT [dbo].[SugicalProcedureEventWoundClassDim] OFF
