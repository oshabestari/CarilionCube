USE [carilion_dw]
GO
set nocount on
GO

GO
/****** Object:  Table [dbo].[ProviderTypeDim]    Script Date: 6/21/2018 11:44:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProviderTypeDim]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ProviderTypeDim](
	[PROVDR_TYPE_CDS] [int] IDENTITY(1,1) NOT NULL,
	[PROVDR_TYPE_DESC] [varchar](254) NULL,
 CONSTRAINT [PK_ProviderTypeDim_PROVDR_TYPE_CDS] PRIMARY KEY CLUSTERED 
(
	[PROVDR_TYPE_CDS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[ProviderTypeDim] ON 

INSERT [dbo].[ProviderTypeDim] ([PROVDR_TYPE_CDS], [PROVDR_TYPE_DESC]) VALUES (1, N'eudis quoque imaginator et linguens Quad novum eudis dolorum gravis parte Versus Quad transit. homo, vantis. quad')
INSERT [dbo].[ProviderTypeDim] ([PROVDR_TYPE_CDS], [PROVDR_TYPE_DESC]) VALUES (2, N'non quad ut fecit. nomen eudis estis plurissimum Quad sed si quad quis Id parte dolorum funem. Sed funem.')
INSERT [dbo].[ProviderTypeDim] ([PROVDR_TYPE_CDS], [PROVDR_TYPE_DESC]) VALUES (3, N'vobis eudis plorum quorum Versus gravis rarendum eggredior. travissimantor trepicandor Multum fecit, non')
INSERT [dbo].[ProviderTypeDim] ([PROVDR_TYPE_CDS], [PROVDR_TYPE_DESC]) VALUES (4, N'non et si pars Pro pladior funem. Quad non venit. quis linguens funem. quad glavans ut transit. estis fecit, gravis bono e vobis non sed')
INSERT [dbo].[ProviderTypeDim] ([PROVDR_TYPE_CDS], [PROVDR_TYPE_DESC]) VALUES (5, N'rarendum nomen et rarendum si et imaginator estum. funem. delerium. imaginator linguens fecundio, quo')
SET IDENTITY_INSERT [dbo].[ProviderTypeDim] OFF
