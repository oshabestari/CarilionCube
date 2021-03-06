USE [carilion_dw]
GO
set nocount on
GO

GO
/****** Object:  Table [dbo].[ProviderReportingStructureDim]    Script Date: 6/21/2018 11:44:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProviderReportingStructureDim]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ProviderReportingStructureDim](
	[RPTNG_STRC_CDS] [int] IDENTITY(1,1) NOT NULL,
	[RPTNG_STRC_DESC] [varchar](254) NULL,
 CONSTRAINT [PK_ProviderReportingStructureDim_RPTNG_STRC_CDS] PRIMARY KEY CLUSTERED 
(
	[RPTNG_STRC_CDS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[ProviderReportingStructureDim] ON 

INSERT [dbo].[ProviderReportingStructureDim] ([RPTNG_STRC_CDS], [RPTNG_STRC_DESC]) VALUES (1, N'imaginator Et et plurissimum delerium. Versus Quad et nomen Multum Tam non plorum ut gravis quad estum. Quad gravum non')
INSERT [dbo].[ProviderReportingStructureDim] ([RPTNG_STRC_CDS], [RPTNG_STRC_DESC]) VALUES (2, N'non venit. sed Longam, dolorum quo Pro funem. plurissimum eggredior. vobis et vobis gravis homo, eudis')
INSERT [dbo].[ProviderReportingStructureDim] ([RPTNG_STRC_CDS], [RPTNG_STRC_DESC]) VALUES (3, N'rarendum cognitio, et manifestum brevens, homo, regit, in delerium. plurissimum in nomen fecundio, et')
INSERT [dbo].[ProviderReportingStructureDim] ([RPTNG_STRC_CDS], [RPTNG_STRC_DESC]) VALUES (4, N'volcans non quo Sed Pro fecit, Versus non non essit. gravis Sed nomen fecit. trepicandor venit. quis')
INSERT [dbo].[ProviderReportingStructureDim] ([RPTNG_STRC_CDS], [RPTNG_STRC_DESC]) VALUES (5, N'et novum novum gravis gravis estis novum quo, cognitio, linguens Sed vobis non ut in si pladior eggredior. Pro')
SET IDENTITY_INSERT [dbo].[ProviderReportingStructureDim] OFF
