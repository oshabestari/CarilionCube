SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
GO
SET ANSI_PADDING ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_ProviderDim_U_LDAP] ON [dbo].[ProviderDim]
(
	[LDAP_USR] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ProviderDim]  WITH CHECK ADD  CONSTRAINT [ProviderDim-ProviderAffiliationDim] FOREIGN KEY([INTN_EXT_CDS])
REFERENCES [dbo].[ProviderAffiliationDim] ([INTN_EXT_CDS])
GO
ALTER TABLE [dbo].[ProviderDim] CHECK CONSTRAINT [ProviderDim-ProviderAffiliationDim]
GO
ALTER TABLE [dbo].[ProviderDim]  WITH CHECK ADD  CONSTRAINT [ProviderDim-ProviderClinicianTitleDim] FOREIGN KEY([CLNC_TITL_CDS])
REFERENCES [dbo].[ProviderClinicianTitleDim] ([CLNC_TITL_CDS])
GO
ALTER TABLE [dbo].[ProviderDim] CHECK CONSTRAINT [ProviderDim-ProviderClinicianTitleDim]
GO
ALTER TABLE [dbo].[ProviderDim]  WITH CHECK ADD  CONSTRAINT [ProviderDim-ProviderFieldOfPracticeDim] FOREIGN KEY([MU_FLD_OF_PRACT_CDS])
REFERENCES [dbo].[ProviderFieldOfPracticeDim] ([MU_FLD_OF_PRACT_CDS])
GO
ALTER TABLE [dbo].[ProviderDim] CHECK CONSTRAINT [ProviderDim-ProviderFieldOfPracticeDim]
GO
ALTER TABLE [dbo].[ProviderDim]  WITH CHECK ADD  CONSTRAINT [ProviderDim-ProviderInternalExternalDim] FOREIGN KEY([INTN_EXT_CDS])
REFERENCES [dbo].[ProviderInternalExternalDim] ([INTN_EXT_CDS])
GO
ALTER TABLE [dbo].[ProviderDim] CHECK CONSTRAINT [ProviderDim-ProviderInternalExternalDim]
GO
ALTER TABLE [dbo].[ProviderDim]  WITH CHECK ADD  CONSTRAINT [ProviderDim-ProviderPrimaryDepartmentDim] FOREIGN KEY([PRMY_DEPT_CDS])
REFERENCES [dbo].[ProviderPrimaryDepartmentDim] ([PRMY_DEPT_CDS])
GO
ALTER TABLE [dbo].[ProviderDim] CHECK CONSTRAINT [ProviderDim-ProviderPrimaryDepartmentDim]
GO
ALTER TABLE [dbo].[ProviderDim]  WITH CHECK ADD  CONSTRAINT [ProviderDim-ProviderPrimarySpecialtyDim] FOREIGN KEY([PRMY_SPCLY_CDS])
REFERENCES [dbo].[ProviderPrimarySpecialtyDim] ([PRMY_SPCLY_CDS])
GO
ALTER TABLE [dbo].[ProviderDim] CHECK CONSTRAINT [ProviderDim-ProviderPrimarySpecialtyDim]
GO
ALTER TABLE [dbo].[ProviderDim]  WITH CHECK ADD  CONSTRAINT [ProviderDim-ProviderReportingStructureDim] FOREIGN KEY([RPTNG_STRC_CDS])
REFERENCES [dbo].[ProviderReportingStructureDim] ([RPTNG_STRC_CDS])
GO
ALTER TABLE [dbo].[ProviderDim] CHECK CONSTRAINT [ProviderDim-ProviderReportingStructureDim]
GO
ALTER TABLE [dbo].[ProviderDim]  WITH CHECK ADD  CONSTRAINT [ProviderDim-ProviderTypeDim] FOREIGN KEY([PROVDR_TYPE_CDS])
REFERENCES [dbo].[ProviderTypeDim] ([PROVDR_TYPE_CDS])
GO
ALTER TABLE [dbo].[ProviderDim] CHECK CONSTRAINT [ProviderDim-ProviderTypeDim]
GO
