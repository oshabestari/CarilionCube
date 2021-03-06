SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
GO
ALTER TABLE [dbo].[EncounterDim]  WITH CHECK ADD  CONSTRAINT [EncounterDim-EncounterBillingClassDim] FOREIGN KEY([BILLING_CLASS_CDS])
REFERENCES [dbo].[EncounterBillingClassDim] ([BILLING_CLASS_CDS])
GO
ALTER TABLE [dbo].[EncounterDim] CHECK CONSTRAINT [EncounterDim-EncounterBillingClassDim]
GO
ALTER TABLE [dbo].[EncounterDim]  WITH CHECK ADD  CONSTRAINT [EncounterDim-EncounterDepartmentDim] FOREIGN KEY([DEPT_CDS])
REFERENCES [dbo].[EncounterDepartmentDim] ([DEPT_CDS])
GO
ALTER TABLE [dbo].[EncounterDim] CHECK CONSTRAINT [EncounterDim-EncounterDepartmentDim]
GO
ALTER TABLE [dbo].[EncounterDim]  WITH CHECK ADD  CONSTRAINT [EncounterDim-EncounterEncouterypeDim] FOREIGN KEY([ENCNT_TYPE_CDS])
REFERENCES [dbo].[EncounterEncouterTypeDim] ([ENCNT_TYPE_CDS])
GO
ALTER TABLE [dbo].[EncounterDim] CHECK CONSTRAINT [EncounterDim-EncounterEncouterypeDim]
GO
ALTER TABLE [dbo].[EncounterDim]  WITH CHECK ADD  CONSTRAINT [EncounterDim-EncounterLevelofCareDim] FOREIGN KEY([LEVL_OF_CARE_CDS])
REFERENCES [dbo].[EncounterLevelofCareDim] ([LEVL_OF_CARE_CDS])
GO
ALTER TABLE [dbo].[EncounterDim] CHECK CONSTRAINT [EncounterDim-EncounterLevelofCareDim]
GO
ALTER TABLE [dbo].[EncounterDim]  WITH CHECK ADD  CONSTRAINT [EncounterDim-EncounterPatientStatusDim] FOREIGN KEY([PTNT_STS_CDS])
REFERENCES [dbo].[EncounterPatientStatusDim] ([PTNT_STS_CDS])
GO
ALTER TABLE [dbo].[EncounterDim] CHECK CONSTRAINT [EncounterDim-EncounterPatientStatusDim]
GO
ALTER TABLE [dbo].[EncounterDim]  WITH CHECK ADD  CONSTRAINT [EncounterDim-EncounterProductLineDim] FOREIGN KEY([PRD_LINE_CDS])
REFERENCES [dbo].[EncounterProductLineDim] ([PRD_LINE_CDS])
GO
ALTER TABLE [dbo].[EncounterDim] CHECK CONSTRAINT [EncounterDim-EncounterProductLineDim]
GO
ALTER TABLE [dbo].[EncounterDim]  WITH CHECK ADD  CONSTRAINT [EncounterDim-EncouterBaseClassDim] FOREIGN KEY([PTNT_BSE_CLSS_CDS])
REFERENCES [dbo].[EncouterBaseClassDim] ([PTNT_BSE_CLSS_CDS])
GO
ALTER TABLE [dbo].[EncounterDim] CHECK CONSTRAINT [EncounterDim-EncouterBaseClassDim]
GO
