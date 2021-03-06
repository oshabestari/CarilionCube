USE [carilion_dw]
GO
set nocount on
GO

GO
/****** Object:  Table [dbo].[ProviderPrimarySpecialtyDim]    Script Date: 6/21/2018 11:44:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProviderPrimarySpecialtyDim]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ProviderPrimarySpecialtyDim](
	[PRMY_SPCLY_CDS] [int] IDENTITY(1,1) NOT NULL,
	[PRMY_SPCLY_DESC] [varchar](254) NULL,
 CONSTRAINT [PK_ProviderPrimarySpecialtyDim_PRMY_SPCLY_CDS] PRIMARY KEY CLUSTERED 
(
	[PRMY_SPCLY_CDS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[ProviderPrimarySpecialtyDim] ON 

INSERT [dbo].[ProviderPrimarySpecialtyDim] ([PRMY_SPCLY_CDS], [PRMY_SPCLY_DESC]) VALUES (1, N'Et delerium. rarendum ut et estum. quantare fecundio, et fecit, Id quartu gravis Quad quis quartu novum gravum')
INSERT [dbo].[ProviderPrimarySpecialtyDim] ([PRMY_SPCLY_CDS], [PRMY_SPCLY_DESC]) VALUES (2, N'quartu sed vobis delerium. quis Multum novum quo parte Longam, in Multum linguens in quantare essit.')
INSERT [dbo].[ProviderPrimarySpecialtyDim] ([PRMY_SPCLY_CDS], [PRMY_SPCLY_DESC]) VALUES (3, N'Quad Multum et quo linguens plurissimum quantare non imaginator egreddior ut delerium. regit, brevens,')
INSERT [dbo].[ProviderPrimarySpecialtyDim] ([PRMY_SPCLY_CDS], [PRMY_SPCLY_DESC]) VALUES (4, N'estis trepicandor venit. gravis funem. essit. in Quad bono brevens, egreddior non regit, Sed travissimantor et cognitio, fecit.')
INSERT [dbo].[ProviderPrimarySpecialtyDim] ([PRMY_SPCLY_CDS], [PRMY_SPCLY_DESC]) VALUES (5, N'quo, travissimantor essit. quo, estum. habitatio quo pars ut quoque funem. egreddior in Et ut eggredior.')
SET IDENTITY_INSERT [dbo].[ProviderPrimarySpecialtyDim] OFF
