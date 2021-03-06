USE [carilion_dw]
GO
set nocount on
GO

GO
/****** Object:  Table [dbo].[LabTestOrderPriorityDim]    Script Date: 6/21/2018 11:44:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LabTestOrderPriorityDim]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[LabTestOrderPriorityDim](
	[ORDR_PRTY_CDS] [int] IDENTITY(1,1) NOT NULL,
	[ORDR_PRTY_DESC] [varchar](255) NULL,
 CONSTRAINT [PK_LabTestOrderPriorityDim_ORDR_PRTY_CDS] PRIMARY KEY CLUSTERED 
(
	[ORDR_PRTY_CDS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[LabTestOrderPriorityDim] ON 

INSERT [dbo].[LabTestOrderPriorityDim] ([ORDR_PRTY_CDS], [ORDR_PRTY_DESC]) VALUES (1, N'quo, homo, in imaginator quartu Id quo non pladior travissimantor Versus parte plurissimum imaginator')
INSERT [dbo].[LabTestOrderPriorityDim] ([ORDR_PRTY_CDS], [ORDR_PRTY_DESC]) VALUES (2, N'vobis dolorum et quantare quis Pro eggredior. Sed in travissimantor homo, estum. quad linguens et bono')
INSERT [dbo].[LabTestOrderPriorityDim] ([ORDR_PRTY_CDS], [ORDR_PRTY_DESC]) VALUES (3, N'bono Versus linguens sed Longam, et gravis linguens nomen fecundio, quis et Pro et Id fecundio, quad')
INSERT [dbo].[LabTestOrderPriorityDim] ([ORDR_PRTY_CDS], [ORDR_PRTY_DESC]) VALUES (4, N'essit. quo eggredior. Quad si Et Pro estum. e et quad delerium. novum quad ut e et non vobis rarendum quo dolorum')
INSERT [dbo].[LabTestOrderPriorityDim] ([ORDR_PRTY_CDS], [ORDR_PRTY_DESC]) VALUES (5, N'Longam, quartu brevens, si ut vobis apparens fecit. funem. pladior quo, plurissimum linguens glavans gravum et')
SET IDENTITY_INSERT [dbo].[LabTestOrderPriorityDim] OFF
