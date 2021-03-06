USE [carilion_dw]
GO
set nocount on
GO

GO
/****** Object:  Table [dbo].[ProviderAffiliationDim]    Script Date: 6/21/2018 11:44:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProviderAffiliationDim]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ProviderAffiliationDim](
	[INTN_EXT_CDS] [int] IDENTITY(1,1) NOT NULL,
	[INTN_EXT_DESC] [varchar](254) NULL,
 CONSTRAINT [PK_ProviderAffiliationDim_INTN_EXT_CDS] PRIMARY KEY CLUSTERED 
(
	[INTN_EXT_CDS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[ProviderAffiliationDim] ON 

INSERT [dbo].[ProviderAffiliationDim] ([INTN_EXT_CDS], [INTN_EXT_DESC]) VALUES (1, N'nomen quo non non gravis habitatio brevens, Sed fecit, plorum habitatio eudis essit. pars si dolorum et')
INSERT [dbo].[ProviderAffiliationDim] ([INTN_EXT_CDS], [INTN_EXT_DESC]) VALUES (2, N'quorum gravis gravis estum. ut bono pars Pro transit. estum. vantis. in venit. pladior delerium. e esset et Id')
INSERT [dbo].[ProviderAffiliationDim] ([INTN_EXT_CDS], [INTN_EXT_DESC]) VALUES (3, N'Et habitatio Tam Quad venit. et transit. pladior Sed quo quo essit. novum apparens linguens quad quantare')
INSERT [dbo].[ProviderAffiliationDim] ([INTN_EXT_CDS], [INTN_EXT_DESC]) VALUES (4, N'nomen delerium. non bono si volcans vobis Versus regit, quantare eggredior. Id novum si quorum quad regit, Longam, linguens Pro habitatio')
INSERT [dbo].[ProviderAffiliationDim] ([INTN_EXT_CDS], [INTN_EXT_DESC]) VALUES (5, N'Versus e homo, quo, Tam quoque trepicandor si nomen et bono Versus fecundio, Quad pladior Multum si et')
SET IDENTITY_INSERT [dbo].[ProviderAffiliationDim] OFF
