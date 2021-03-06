USE [carilion_dw]
GO
set nocount on
GO

GO
/****** Object:  Table [dbo].[SurgicalSupplyUseLogStatusDim]    Script Date: 6/21/2018 11:44:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SurgicalSupplyUseLogStatusDim]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SurgicalSupplyUseLogStatusDim](
	[LOG_STS_CDS] [int] IDENTITY(1,1) NOT NULL,
	[LOG_STS_DESC] [varchar](255) NULL,
 CONSTRAINT [PK_SurgicalSupplyUseLogStatusDim_LOG_STS_CDS] PRIMARY KEY CLUSTERED 
(
	[LOG_STS_CDS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[SurgicalSupplyUseLogStatusDim] ON 

INSERT [dbo].[SurgicalSupplyUseLogStatusDim] ([LOG_STS_CDS], [LOG_STS_DESC]) VALUES (1, N'e brevens, et plorum quartu apparens volcans pars Id apparens ut estum. gravis eggredior. eudis essit.')
INSERT [dbo].[SurgicalSupplyUseLogStatusDim] ([LOG_STS_CDS], [LOG_STS_DESC]) VALUES (2, N'et apparens venit. essit. vantis. e Sed egreddior fecit, nomen quo, dolorum quad esset Longam, habitatio')
INSERT [dbo].[SurgicalSupplyUseLogStatusDim] ([LOG_STS_CDS], [LOG_STS_DESC]) VALUES (3, N'in glavans Versus gravis eudis non et plorum gravis et esset plorum e fecit. et quad apparens e quad')
INSERT [dbo].[SurgicalSupplyUseLogStatusDim] ([LOG_STS_CDS], [LOG_STS_DESC]) VALUES (4, N'estis si e fecundio, et plorum in quorum venit. essit. quoque volcans Sed funem. bono quoque vobis dolorum')
INSERT [dbo].[SurgicalSupplyUseLogStatusDim] ([LOG_STS_CDS], [LOG_STS_DESC]) VALUES (5, N'Id si linguens brevens, imaginator et non cognitio, Sed imaginator plorum essit. quad quad novum transit. transit.')
SET IDENTITY_INSERT [dbo].[SurgicalSupplyUseLogStatusDim] OFF
