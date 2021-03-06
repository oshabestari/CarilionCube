USE [carilion_dw]
GO
set nocount on
GO

GO
/****** Object:  Table [dbo].[ProviderClinicianTitleDim]    Script Date: 6/21/2018 11:44:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProviderClinicianTitleDim]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ProviderClinicianTitleDim](
	[CLNC_TITL_CDS] [varchar](80) NOT NULL,
	[CLNC_TITL_DESC] [varchar](254) NULL,
 CONSTRAINT [PK_ProviderClinicianTitleDim_CLNC_TITL_CDS] PRIMARY KEY CLUSTERED 
(
	[CLNC_TITL_CDS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
INSERT [dbo].[ProviderClinicianTitleDim] ([CLNC_TITL_CDS], [CLNC_TITL_DESC]) VALUES (N'2PWXCGN4C27HEDE1OD3VFB0HAV6UANVSJ2ZK9RVB3CUG1PNF1LWA7', N'volcans quad si quo, quo, et Tam et venit. non parte linguens quo, fecundio, Id quoque estis plorum quad funem. gravis')
INSERT [dbo].[ProviderClinicianTitleDim] ([CLNC_TITL_CDS], [CLNC_TITL_DESC]) VALUES (N'5UNJ1A6O7SQG7J80O7PC5P', N'vobis novum quantare Tam travissimantor Tam esset non quo quad non glavans quo et manifestum fecit, fecit.')
INSERT [dbo].[ProviderClinicianTitleDim] ([CLNC_TITL_CDS], [CLNC_TITL_DESC]) VALUES (N'ASL1OL583H87WIFKEQGIZX1K86D13', N'Et non Longam, trepicandor quorum plurissimum nomen plorum in sed regit, non e egreddior habitatio non')
INSERT [dbo].[ProviderClinicianTitleDim] ([CLNC_TITL_CDS], [CLNC_TITL_DESC]) VALUES (N'FY94Z07QASMIG1TGJNTU8F7TMM3NWW1R32SY9AKDPGOY0I6', N'rarendum fecundio, delerium. quo regit, linguens linguens volcans si eudis et pars quad rarendum si delerium. Longam,')
INSERT [dbo].[ProviderClinicianTitleDim] ([CLNC_TITL_CDS], [CLNC_TITL_DESC]) VALUES (N'SAHD2C', N'non trepicandor quo, quis parte si et cognitio, novum quorum gravis volcans quantare homo, quad et essit.')
