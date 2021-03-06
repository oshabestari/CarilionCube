USE [carilion_dw]
GO
set nocount on
GO

GO
/****** Object:  Table [dbo].[MedicationAdministrationRouteDim]    Script Date: 6/21/2018 11:44:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MedicationAdministrationRouteDim]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[MedicationAdministrationRouteDim](
	[ADMN_RT_CDS] [int] IDENTITY(1,1) NOT NULL,
	[ADMN_RT_DESC] [varchar](255) NULL,
 CONSTRAINT [PK_MedicationAdministrationRouteDim_ADMN_RT_CDS] PRIMARY KEY CLUSTERED 
(
	[ADMN_RT_CDS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[MedicationAdministrationRouteDim] ON 

INSERT [dbo].[MedicationAdministrationRouteDim] ([ADMN_RT_CDS], [ADMN_RT_DESC]) VALUES (1, N'plorum imaginator quad habitatio quoque pars Id imaginator cognitio, sed plurissimum quis pars fecit, estum.')
INSERT [dbo].[MedicationAdministrationRouteDim] ([ADMN_RT_CDS], [ADMN_RT_DESC]) VALUES (2, N'estum. Quad imaginator plurissimum quantare homo, non imaginator quo, egreddior Tam plorum delerium.')
INSERT [dbo].[MedicationAdministrationRouteDim] ([ADMN_RT_CDS], [ADMN_RT_DESC]) VALUES (3, N'fecit. pars sed novum et gravum delerium. linguens funem. estis non Multum et novum pars plurissimum')
INSERT [dbo].[MedicationAdministrationRouteDim] ([ADMN_RT_CDS], [ADMN_RT_DESC]) VALUES (4, N'manifestum quoque quo, gravum eggredior. egreddior cognitio, fecit, Pro novum glavans estis novum quis')
INSERT [dbo].[MedicationAdministrationRouteDim] ([ADMN_RT_CDS], [ADMN_RT_DESC]) VALUES (5, N'pars travissimantor manifestum habitatio Longam, quo quo, nomen egreddior quartu Id non quo linguens et delerium. cognitio,')
SET IDENTITY_INSERT [dbo].[MedicationAdministrationRouteDim] OFF
