USE [carilion_dw]
GO
set nocount on
GO

GO
/****** Object:  Table [dbo].[ProviderDim]    Script Date: 6/21/2018 11:44:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProviderDim]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ProviderDim](
	[PROVDR_SK] [bigint] IDENTITY(1,1) NOT NULL,
	[PROVDR_NM_ID] [varchar](278) NULL,
	[PROVDR_TYPE_CDS] [int] NULL,
	[PRMY_SPCLY_CDS] [int] NULL,
	[PRMY_DEPT_CDS] [int] NULL,
	[NPI] [bigint] NULL,
	[DEA_NUM] [varchar](50) NULL,
	[UPIN] [varchar](20) NULL,
	[CLNC_TITL_CDS] [varchar](80) NULL,
	[MU_FLD_OF_PRACT_CDS] [int] NULL,
	[RPTNG_STRC_CDS] [int] NULL,
	[INTN_EXT_CDS] [int] NULL,
	[RSDNT_IND] [varchar](3) NULL,
	[HSPTLST_IND] [varchar](3) NULL,
	[LDAP_USR] [varchar](50) NOT NULL,
	[PROVDR_ACTV_IND] [varchar](3) NULL,
	[PRMRY_DEPT_SK] [bigint] NULL,
	[Section_CDS] [int] NULL,
	[Section_Desc] [varchar](100) NULL,
	[PROVDR_TYPE_DESC] [varchar](254) NULL,
	[PRMY_SPCLY_DESC] [varchar](254) NULL,
	[PRMY_DEPT_NM] [varchar](254) NULL,
	[CLNC_TITL_DESC] [varchar](254) NULL,
	[MU_FLD_OF_PRACT_DESC] [varchar](254) NULL,
	[RPTNG_STRC_DESC] [varchar](254) NULL,
	[INTN_EXT_DESC] [varchar](254) NULL,
 CONSTRAINT [PK_ProviderDim_PROVDR_SK] PRIMARY KEY CLUSTERED 
(
	[PROVDR_SK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[ProviderDim] ON 

INSERT [dbo].[ProviderDim] ([PROVDR_SK], [PROVDR_NM_ID], [PROVDR_TYPE_CDS], [PRMY_SPCLY_CDS], [PRMY_DEPT_CDS], [NPI], [DEA_NUM], [UPIN], [CLNC_TITL_CDS], [MU_FLD_OF_PRACT_CDS], [RPTNG_STRC_CDS], [INTN_EXT_CDS], [RSDNT_IND], [HSPTLST_IND], [LDAP_USR], [PROVDR_ACTV_IND], [PRMRY_DEPT_SK], [Section_CDS], [Section_Desc], [PROVDR_TYPE_DESC], [PRMY_SPCLY_DESC], [PRMY_DEPT_NM], [CLNC_TITL_DESC], [MU_FLD_OF_PRACT_DESC], [RPTNG_STRC_DESC], [INTN_EXT_DESC]) VALUES (1, N'74902', 3, 2, 5, -3214158753351202816, N'29026', N'JO9PI5OAZRLXN', N'SAHD2C', 5, 4, 3, N'', N'A', N'cklenovo\carlos', N'W', -7887116442391893248, 1277460443, N'estis Multum e gravis cognitio, homo, fecit. apparens in quo in apparens funem. pladior Tam nomen', N'esset pars imaginator parte homo, Id rarendum quantare Multum venit. delerium. nomen non essit. estis Et', N'quad e egreddior linguens et in si vantis. volcans Multum e egreddior plorum quo, plurissimum plorum estis', N'NG91RFP053JKYI6XQG75Q9O46WCZP44ZGG9OPR7WMQFUK0EFJA2UK9YDR4VU2QB0YJ3H8H7Z8BIZTUJ5', N'vantis. non si quorum e Versus plorum vantis. si Quad parte novum ut quorum vantis. et e e glavans quis', N'quartu quad non cognitio, non Quad novum sed vobis plorum plorum quad linguens transit. essit. quo, Multum Quad Tam', N'ut habitatio quoque volcans pladior et estum. vantis. pladior ut et in delerium. Quad gravis imaginator', N'Multum parte ut quad non novum vantis. sed rarendum delerium. linguens in nomen quo nomen cognitio, delerium.')
INSERT [dbo].[ProviderDim] ([PROVDR_SK], [PROVDR_NM_ID], [PROVDR_TYPE_CDS], [PRMY_SPCLY_CDS], [PRMY_DEPT_CDS], [NPI], [DEA_NUM], [UPIN], [CLNC_TITL_CDS], [MU_FLD_OF_PRACT_CDS], [RPTNG_STRC_CDS], [INTN_EXT_CDS], [RSDNT_IND], [HSPTLST_IND], [LDAP_USR], [PROVDR_ACTV_IND], [PRMRY_DEPT_SK], [Section_CDS], [Section_Desc], [PROVDR_TYPE_DESC], [PRMY_SPCLY_DESC], [PRMY_DEPT_NM], [CLNC_TITL_DESC], [MU_FLD_OF_PRACT_DESC], [RPTNG_STRC_DESC], [INTN_EXT_DESC]) VALUES (2, N'65739', 2, 5, 4, 8439455361538060288, N'11608', N'F122SA', N'2PWXCGN4C27HEDE1OD3VFB0HAV6UANVSJ2ZK9RVB3CUG1PNF1LWA7', 2, 2, 2, N'5BZ', N'', N'cklenovo\SSAS_USER01', N'YB', -5808721336699810304, -1413185809, N'in gravis linguens manifestum transit. egreddior esset parte quad eggredior. glavans si regit, eudis', N'venit. quo, plorum quad Pro transit. Pro in apparens quad quo, Et et gravis non Tam egreddior fecit,', N'plurissimum Id glavans Et Longam, eudis rarendum imaginator sed quantare volcans egreddior quo et et', N'XFE1AF7HVXLVDTWEFV0XW6223M9RYKWKPB5AXZO4VZDKM3UHMKEYJ8MQCBXN5GIB0051NLHF7V1WTIGZRR4E5Y1HPEYL10ZFG1JMXTT03YRN6PXUVYWEB452Y', N'si et linguens Sed plurissimum Multum trepicandor novum funem. e pladior pladior funem. et nomen rarendum', N'gravis pladior novum bono Versus et habitatio nomen quo in gravum rarendum si e Longam, fecit. quad e', N'quis habitatio gravis quoque quorum Multum manifestum Tam quad e apparens plurissimum estis Sed Pro non funem.', N'plorum egreddior cognitio, quantare non Et Quad manifestum e plurissimum fecit. Pro quis non quis fecundio, et')
INSERT [dbo].[ProviderDim] ([PROVDR_SK], [PROVDR_NM_ID], [PROVDR_TYPE_CDS], [PRMY_SPCLY_CDS], [PRMY_DEPT_CDS], [NPI], [DEA_NUM], [UPIN], [CLNC_TITL_CDS], [MU_FLD_OF_PRACT_CDS], [RPTNG_STRC_CDS], [INTN_EXT_CDS], [RSDNT_IND], [HSPTLST_IND], [LDAP_USR], [PROVDR_ACTV_IND], [PRMRY_DEPT_SK], [Section_CDS], [Section_Desc], [PROVDR_TYPE_DESC], [PRMY_SPCLY_DESC], [PRMY_DEPT_NM], [CLNC_TITL_DESC], [MU_FLD_OF_PRACT_DESC], [RPTNG_STRC_DESC], [INTN_EXT_DESC]) VALUES (3, N'55653', 5, 1, 3, -4238876644290791424, N'10864', N'WSQ5VN4FYFC4KN', N'ASL1OL583H87WIFKEQGIZX1K86D13', 4, 3, 5, N'', N'F', N'cklenovo\SSAS_USER02', N'Q', 8468493120043761664, 504697118, N'Multum pladior venit. homo, vantis. cognitio, quad Quad quis gravum eudis quad novum linguens', N'e Tam Et gravis pars quis vantis. gravum plurissimum eggredior. e Sed et pars non pladior quad plorum', N'Sed quo linguens et in vobis e quad eggredior. nomen travissimantor dolorum et novum quo, fecit, Versus', N'C8NWE6WLFRYT1YX3B76EAZG3P33K4CWHN9GLD6KLQKA6W1WYG7TYWKDDSJ6A2BH3VG6SHCQ4NKOQPA7O754', N'Pro gravum dolorum essit. nomen plorum gravis bono e venit. Quad travissimantor Tam habitatio fecundio, quorum', N'non in dolorum volcans eggredior. travissimantor quo, gravis plurissimum rarendum nomen nomen si dolorum Versus', N'fecit, estum. vobis Pro apparens quorum bono Multum Tam vantis. quo et sed non esset et quo fecit, plorum estum. glavans', N'et et e si manifestum quo volcans non Et et bono plurissimum fecit. egreddior in egreddior et pars pars quad quad pladior quis')
INSERT [dbo].[ProviderDim] ([PROVDR_SK], [PROVDR_NM_ID], [PROVDR_TYPE_CDS], [PRMY_SPCLY_CDS], [PRMY_DEPT_CDS], [NPI], [DEA_NUM], [UPIN], [CLNC_TITL_CDS], [MU_FLD_OF_PRACT_CDS], [RPTNG_STRC_CDS], [INTN_EXT_CDS], [RSDNT_IND], [HSPTLST_IND], [LDAP_USR], [PROVDR_ACTV_IND], [PRMRY_DEPT_SK], [Section_CDS], [Section_Desc], [PROVDR_TYPE_DESC], [PRMY_SPCLY_DESC], [PRMY_DEPT_NM], [CLNC_TITL_DESC], [MU_FLD_OF_PRACT_DESC], [RPTNG_STRC_DESC], [INTN_EXT_DESC]) VALUES (4, N'44887', 4, 3, 1, 6217972947866703872, N'31074', N'6C95QQUG8861POROPG2', N'FY94Z07QASMIG1TGJNTU8F7TMM3NWW1R32SY9AKDPGOY0I6', 1, 5, 4, N'6W', N'', N'cklenovo\SSAS_USER03', N'A', -5811661009887057408, 1351641855, N'Longam, vobis quad non quartu dolorum trepicandor dolorum vobis eudis sed gravum bono et quis', N'homo, pars volcans novum plurissimum quo, regit, travissimantor eudis eudis gravum estum. si linguens manifestum', N'gravis pars cognitio, novum Tam eudis pars parte novum funem. Id eudis e fecit, quo, novum et travissimantor', N'IYL3W3TU09IE36BFV4G3HPA', N'Quad estis ut cognitio, quo essit. trepicandor esset eudis et linguens egreddior dolorum volcans regit, et Pro', N'e e plorum manifestum fecit, trepicandor eudis essit. nomen Tam brevens, plorum fecit. travissimantor si Sed', N'in fecundio, venit. regit, eudis et travissimantor fecit. Id vantis. plorum quo, eggredior. gravis quad', N'non pars manifestum fecit, plorum dolorum fecit, Multum pars gravum linguens cognitio, linguens homo,')
INSERT [dbo].[ProviderDim] ([PROVDR_SK], [PROVDR_NM_ID], [PROVDR_TYPE_CDS], [PRMY_SPCLY_CDS], [PRMY_DEPT_CDS], [NPI], [DEA_NUM], [UPIN], [CLNC_TITL_CDS], [MU_FLD_OF_PRACT_CDS], [RPTNG_STRC_CDS], [INTN_EXT_CDS], [RSDNT_IND], [HSPTLST_IND], [LDAP_USR], [PROVDR_ACTV_IND], [PRMRY_DEPT_SK], [Section_CDS], [Section_Desc], [PROVDR_TYPE_DESC], [PRMY_SPCLY_DESC], [PRMY_DEPT_NM], [CLNC_TITL_DESC], [MU_FLD_OF_PRACT_DESC], [RPTNG_STRC_DESC], [INTN_EXT_DESC]) VALUES (5, N'37945', 1, 4, 2, 5851104915810064384, N'50086', N'VIKNHKV', N'5UNJ1A6O7SQG7J80O7PC5P', 3, 1, 1, N'', N'', N'cklenovo\SSAS_USER04', N'', 5230245385471729664, 1137883509, N'gravis eudis habitatio Tam quad nomen vobis quad transit. esset quo bono trepicandor si in et', N'novum pars et esset quantare vantis. estis quoque brevens, plorum homo, quo apparens vantis. eudis quoque', N'habitatio Multum cognitio, in novum estum. quo eggredior. non cognitio, venit. regit, sed estis manifestum', N'WNOHCI3W7KKWV2VEJV3D29MIYRS2O1FTNA79EBHI5L7IMEJS81JLMX8M05JKP0865R9LVMZ8EK8G24VJ70UMHT6Q1K88SXT4D1CU5YWM2B71OSKW9ZCO6LOCKJJADQGHQ321R1E837K5M5180CYSK5YSC09LFL9BVQAKQI58K3KY0JQF', N'in plorum dolorum estum. bono gravis et fecundio, Et trepicandor plurissimum delerium. quo fecundio, venit.', N'linguens e nomen estum. vantis. si sed Multum plorum e plurissimum non esset sed in sed gravis e travissimantor', N'Id transit. novum apparens pars imaginator e quo glavans gravum in eudis cognitio, sed Versus gravis', N'gravis volcans Id Id quad sed quo, vantis. funem. gravum plorum brevens, non eggredior. et fecundio,')
SET IDENTITY_INSERT [dbo].[ProviderDim] OFF
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_ProviderDim_U_LDAP]    Script Date: 6/21/2018 11:44:28 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[ProviderDim]') AND name = N'IX_ProviderDim_U_LDAP')
CREATE UNIQUE NONCLUSTERED INDEX [IX_ProviderDim_U_LDAP] ON [dbo].[ProviderDim]
(
	[LDAP_USR] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[ProviderDim-ProviderAffiliationDim]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProviderDim]'))
ALTER TABLE [dbo].[ProviderDim]  WITH CHECK ADD  CONSTRAINT [ProviderDim-ProviderAffiliationDim] FOREIGN KEY([INTN_EXT_CDS])
REFERENCES [dbo].[ProviderAffiliationDim] ([INTN_EXT_CDS])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[ProviderDim-ProviderAffiliationDim]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProviderDim]'))
ALTER TABLE [dbo].[ProviderDim] CHECK CONSTRAINT [ProviderDim-ProviderAffiliationDim]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[ProviderDim-ProviderClinicianTitleDim]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProviderDim]'))
ALTER TABLE [dbo].[ProviderDim]  WITH CHECK ADD  CONSTRAINT [ProviderDim-ProviderClinicianTitleDim] FOREIGN KEY([CLNC_TITL_CDS])
REFERENCES [dbo].[ProviderClinicianTitleDim] ([CLNC_TITL_CDS])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[ProviderDim-ProviderClinicianTitleDim]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProviderDim]'))
ALTER TABLE [dbo].[ProviderDim] CHECK CONSTRAINT [ProviderDim-ProviderClinicianTitleDim]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[ProviderDim-ProviderFieldOfPracticeDim]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProviderDim]'))
ALTER TABLE [dbo].[ProviderDim]  WITH CHECK ADD  CONSTRAINT [ProviderDim-ProviderFieldOfPracticeDim] FOREIGN KEY([MU_FLD_OF_PRACT_CDS])
REFERENCES [dbo].[ProviderFieldOfPracticeDim] ([MU_FLD_OF_PRACT_CDS])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[ProviderDim-ProviderFieldOfPracticeDim]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProviderDim]'))
ALTER TABLE [dbo].[ProviderDim] CHECK CONSTRAINT [ProviderDim-ProviderFieldOfPracticeDim]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[ProviderDim-ProviderInternalExternalDim]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProviderDim]'))
ALTER TABLE [dbo].[ProviderDim]  WITH CHECK ADD  CONSTRAINT [ProviderDim-ProviderInternalExternalDim] FOREIGN KEY([INTN_EXT_CDS])
REFERENCES [dbo].[ProviderInternalExternalDim] ([INTN_EXT_CDS])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[ProviderDim-ProviderInternalExternalDim]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProviderDim]'))
ALTER TABLE [dbo].[ProviderDim] CHECK CONSTRAINT [ProviderDim-ProviderInternalExternalDim]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[ProviderDim-ProviderPrimaryDepartmentDim]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProviderDim]'))
ALTER TABLE [dbo].[ProviderDim]  WITH CHECK ADD  CONSTRAINT [ProviderDim-ProviderPrimaryDepartmentDim] FOREIGN KEY([PRMY_DEPT_CDS])
REFERENCES [dbo].[ProviderPrimaryDepartmentDim] ([PRMY_DEPT_CDS])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[ProviderDim-ProviderPrimaryDepartmentDim]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProviderDim]'))
ALTER TABLE [dbo].[ProviderDim] CHECK CONSTRAINT [ProviderDim-ProviderPrimaryDepartmentDim]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[ProviderDim-ProviderPrimarySpecialtyDim]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProviderDim]'))
ALTER TABLE [dbo].[ProviderDim]  WITH CHECK ADD  CONSTRAINT [ProviderDim-ProviderPrimarySpecialtyDim] FOREIGN KEY([PRMY_SPCLY_CDS])
REFERENCES [dbo].[ProviderPrimarySpecialtyDim] ([PRMY_SPCLY_CDS])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[ProviderDim-ProviderPrimarySpecialtyDim]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProviderDim]'))
ALTER TABLE [dbo].[ProviderDim] CHECK CONSTRAINT [ProviderDim-ProviderPrimarySpecialtyDim]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[ProviderDim-ProviderReportingStructureDim]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProviderDim]'))
ALTER TABLE [dbo].[ProviderDim]  WITH CHECK ADD  CONSTRAINT [ProviderDim-ProviderReportingStructureDim] FOREIGN KEY([RPTNG_STRC_CDS])
REFERENCES [dbo].[ProviderReportingStructureDim] ([RPTNG_STRC_CDS])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[ProviderDim-ProviderReportingStructureDim]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProviderDim]'))
ALTER TABLE [dbo].[ProviderDim] CHECK CONSTRAINT [ProviderDim-ProviderReportingStructureDim]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[ProviderDim-ProviderTypeDim]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProviderDim]'))
ALTER TABLE [dbo].[ProviderDim]  WITH CHECK ADD  CONSTRAINT [ProviderDim-ProviderTypeDim] FOREIGN KEY([PROVDR_TYPE_CDS])
REFERENCES [dbo].[ProviderTypeDim] ([PROVDR_TYPE_CDS])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[ProviderDim-ProviderTypeDim]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProviderDim]'))
ALTER TABLE [dbo].[ProviderDim] CHECK CONSTRAINT [ProviderDim-ProviderTypeDim]
GO
