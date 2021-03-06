USE [carilion_dw]
GO
set nocount on
GO

GO
/****** Object:  Table [dbo].[EncounterDim]    Script Date: 6/21/2018 11:44:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EncounterDim]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[EncounterDim](
	[ENCNT_SK] [bigint] IDENTITY(1,1) NOT NULL,
	[SRC_ENCNT_ID] [varchar](255) NULL,
	[PTNT_STS_CDS] [int] NULL,
	[ENCNT_TYPE_CDS] [int] NULL,
	[LEVL_OF_CARE_CDS] [int] NULL,
	[TRAUMA_IND] [varchar](3) NULL,
	[PTNT_BSE_CLSS_CDS] [int] NULL,
	[AGE_YRS_AT_ENCNT] [int] NULL,
	[AGE_MNTHS_AT_ENCNT] [int] NULL,
	[AGE_DYS_AT_ENCNT] [int] NULL,
	[PRD_LINE_CDS] [int] NULL,
	[BILLING_CLASS_CDS] [int] NULL,
	[DEPT_CDS] [int] NULL,
 CONSTRAINT [PK_EncounterDim_ENCNT_SK] PRIMARY KEY CLUSTERED 
(
	[ENCNT_SK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[EncounterDim] ON 

INSERT [dbo].[EncounterDim] ([ENCNT_SK], [SRC_ENCNT_ID], [PTNT_STS_CDS], [ENCNT_TYPE_CDS], [LEVL_OF_CARE_CDS], [TRAUMA_IND], [PTNT_BSE_CLSS_CDS], [AGE_YRS_AT_ENCNT], [AGE_MNTHS_AT_ENCNT], [AGE_DYS_AT_ENCNT], [PRD_LINE_CDS], [BILLING_CLASS_CDS], [DEPT_CDS]) VALUES (1, N'65962', 1, 5, 5, N'SC', 5, 40, NULL, 42, 4, 5, 3)
INSERT [dbo].[EncounterDim] ([ENCNT_SK], [SRC_ENCNT_ID], [PTNT_STS_CDS], [ENCNT_TYPE_CDS], [LEVL_OF_CARE_CDS], [TRAUMA_IND], [PTNT_BSE_CLSS_CDS], [AGE_YRS_AT_ENCNT], [AGE_MNTHS_AT_ENCNT], [AGE_DYS_AT_ENCNT], [PRD_LINE_CDS], [BILLING_CLASS_CDS], [DEPT_CDS]) VALUES (2, N'02635', 5, 4, 3, N'', 3, 36, 65, 64, 3, 4, 1)
INSERT [dbo].[EncounterDim] ([ENCNT_SK], [SRC_ENCNT_ID], [PTNT_STS_CDS], [ENCNT_TYPE_CDS], [LEVL_OF_CARE_CDS], [TRAUMA_IND], [PTNT_BSE_CLSS_CDS], [AGE_YRS_AT_ENCNT], [AGE_MNTHS_AT_ENCNT], [AGE_DYS_AT_ENCNT], [PRD_LINE_CDS], [BILLING_CLASS_CDS], [DEPT_CDS]) VALUES (3, N'59345', 3, 3, 1, N'PE', 4, 54, 50, 25, 5, 3, 2)
INSERT [dbo].[EncounterDim] ([ENCNT_SK], [SRC_ENCNT_ID], [PTNT_STS_CDS], [ENCNT_TYPE_CDS], [LEVL_OF_CARE_CDS], [TRAUMA_IND], [PTNT_BSE_CLSS_CDS], [AGE_YRS_AT_ENCNT], [AGE_MNTHS_AT_ENCNT], [AGE_DYS_AT_ENCNT], [PRD_LINE_CDS], [BILLING_CLASS_CDS], [DEPT_CDS]) VALUES (4, N'14766', 2, 1, 4, N'Q59', 2, 27, 39, 47, 1, 2, 4)
INSERT [dbo].[EncounterDim] ([ENCNT_SK], [SRC_ENCNT_ID], [PTNT_STS_CDS], [ENCNT_TYPE_CDS], [LEVL_OF_CARE_CDS], [TRAUMA_IND], [PTNT_BSE_CLSS_CDS], [AGE_YRS_AT_ENCNT], [AGE_MNTHS_AT_ENCNT], [AGE_DYS_AT_ENCNT], [PRD_LINE_CDS], [BILLING_CLASS_CDS], [DEPT_CDS]) VALUES (5, N'67280', 4, 2, 2, N'T', 1, 37, 37, 32, 2, 1, 5)
SET IDENTITY_INSERT [dbo].[EncounterDim] OFF
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[EncounterDim-EncounterBillingClassDim]') AND parent_object_id = OBJECT_ID(N'[dbo].[EncounterDim]'))
ALTER TABLE [dbo].[EncounterDim]  WITH CHECK ADD  CONSTRAINT [EncounterDim-EncounterBillingClassDim] FOREIGN KEY([BILLING_CLASS_CDS])
REFERENCES [dbo].[EncounterBillingClassDim] ([BILLING_CLASS_CDS])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[EncounterDim-EncounterBillingClassDim]') AND parent_object_id = OBJECT_ID(N'[dbo].[EncounterDim]'))
ALTER TABLE [dbo].[EncounterDim] CHECK CONSTRAINT [EncounterDim-EncounterBillingClassDim]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[EncounterDim-EncounterDepartmentDim]') AND parent_object_id = OBJECT_ID(N'[dbo].[EncounterDim]'))
ALTER TABLE [dbo].[EncounterDim]  WITH CHECK ADD  CONSTRAINT [EncounterDim-EncounterDepartmentDim] FOREIGN KEY([DEPT_CDS])
REFERENCES [dbo].[EncounterDepartmentDim] ([DEPT_CDS])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[EncounterDim-EncounterDepartmentDim]') AND parent_object_id = OBJECT_ID(N'[dbo].[EncounterDim]'))
ALTER TABLE [dbo].[EncounterDim] CHECK CONSTRAINT [EncounterDim-EncounterDepartmentDim]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[EncounterDim-EncounterEncouterypeDim]') AND parent_object_id = OBJECT_ID(N'[dbo].[EncounterDim]'))
ALTER TABLE [dbo].[EncounterDim]  WITH CHECK ADD  CONSTRAINT [EncounterDim-EncounterEncouterypeDim] FOREIGN KEY([ENCNT_TYPE_CDS])
REFERENCES [dbo].[EncounterEncouterTypeDim] ([ENCNT_TYPE_CDS])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[EncounterDim-EncounterEncouterypeDim]') AND parent_object_id = OBJECT_ID(N'[dbo].[EncounterDim]'))
ALTER TABLE [dbo].[EncounterDim] CHECK CONSTRAINT [EncounterDim-EncounterEncouterypeDim]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[EncounterDim-EncounterLevelofCareDim]') AND parent_object_id = OBJECT_ID(N'[dbo].[EncounterDim]'))
ALTER TABLE [dbo].[EncounterDim]  WITH CHECK ADD  CONSTRAINT [EncounterDim-EncounterLevelofCareDim] FOREIGN KEY([LEVL_OF_CARE_CDS])
REFERENCES [dbo].[EncounterLevelofCareDim] ([LEVL_OF_CARE_CDS])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[EncounterDim-EncounterLevelofCareDim]') AND parent_object_id = OBJECT_ID(N'[dbo].[EncounterDim]'))
ALTER TABLE [dbo].[EncounterDim] CHECK CONSTRAINT [EncounterDim-EncounterLevelofCareDim]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[EncounterDim-EncounterPatientStatusDim]') AND parent_object_id = OBJECT_ID(N'[dbo].[EncounterDim]'))
ALTER TABLE [dbo].[EncounterDim]  WITH CHECK ADD  CONSTRAINT [EncounterDim-EncounterPatientStatusDim] FOREIGN KEY([PTNT_STS_CDS])
REFERENCES [dbo].[EncounterPatientStatusDim] ([PTNT_STS_CDS])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[EncounterDim-EncounterPatientStatusDim]') AND parent_object_id = OBJECT_ID(N'[dbo].[EncounterDim]'))
ALTER TABLE [dbo].[EncounterDim] CHECK CONSTRAINT [EncounterDim-EncounterPatientStatusDim]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[EncounterDim-EncounterProductLineDim]') AND parent_object_id = OBJECT_ID(N'[dbo].[EncounterDim]'))
ALTER TABLE [dbo].[EncounterDim]  WITH CHECK ADD  CONSTRAINT [EncounterDim-EncounterProductLineDim] FOREIGN KEY([PRD_LINE_CDS])
REFERENCES [dbo].[EncounterProductLineDim] ([PRD_LINE_CDS])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[EncounterDim-EncounterProductLineDim]') AND parent_object_id = OBJECT_ID(N'[dbo].[EncounterDim]'))
ALTER TABLE [dbo].[EncounterDim] CHECK CONSTRAINT [EncounterDim-EncounterProductLineDim]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[EncounterDim-EncouterBaseClassDim]') AND parent_object_id = OBJECT_ID(N'[dbo].[EncounterDim]'))
ALTER TABLE [dbo].[EncounterDim]  WITH CHECK ADD  CONSTRAINT [EncounterDim-EncouterBaseClassDim] FOREIGN KEY([PTNT_BSE_CLSS_CDS])
REFERENCES [dbo].[EncouterBaseClassDim] ([PTNT_BSE_CLSS_CDS])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[EncounterDim-EncouterBaseClassDim]') AND parent_object_id = OBJECT_ID(N'[dbo].[EncounterDim]'))
ALTER TABLE [dbo].[EncounterDim] CHECK CONSTRAINT [EncounterDim-EncouterBaseClassDim]
GO
