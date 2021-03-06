USE [carilion_dw]
GO
set nocount on
GO

GO
/****** Object:  Table [dbo].[ProviderInternalExternalDim]    Script Date: 6/21/2018 11:44:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProviderInternalExternalDim]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ProviderInternalExternalDim](
	[INTN_EXT_CDS] [int] IDENTITY(1,1) NOT NULL,
	[INTN_EXT_DESC] [varchar](254) NULL,
 CONSTRAINT [PK_ProviderInternalExternalDim_INTN_EXT_CDS] PRIMARY KEY CLUSTERED 
(
	[INTN_EXT_CDS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[ProviderInternalExternalDim] ON 

INSERT [dbo].[ProviderInternalExternalDim] ([INTN_EXT_CDS], [INTN_EXT_DESC]) VALUES (1, N'quad quantare Id estis in quo fecit. vobis Pro si fecit, parte quantare quo imaginator quantare quo,')
INSERT [dbo].[ProviderInternalExternalDim] ([INTN_EXT_CDS], [INTN_EXT_DESC]) VALUES (2, N'e bono gravis vobis Id quad plorum quoque Quad essit. homo, si plurissimum novum e novum et quad et et')
INSERT [dbo].[ProviderInternalExternalDim] ([INTN_EXT_CDS], [INTN_EXT_DESC]) VALUES (3, N'quartu gravum imaginator imaginator linguens fecit. Quad nomen quad habitatio quis essit. quad sed quartu')
INSERT [dbo].[ProviderInternalExternalDim] ([INTN_EXT_CDS], [INTN_EXT_DESC]) VALUES (4, N'volcans travissimantor brevens, quad estis Quad fecit, nomen trepicandor si quo eggredior. pladior et vobis linguens dolorum Sed')
INSERT [dbo].[ProviderInternalExternalDim] ([INTN_EXT_CDS], [INTN_EXT_DESC]) VALUES (5, N'Et gravis plorum e gravis quoque pars quantare gravis estum. nomen travissimantor quorum manifestum plorum Sed pars')
SET IDENTITY_INSERT [dbo].[ProviderInternalExternalDim] OFF
