SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SurgicalSupplyUseFact](
	[SRGCL_SPPLY_USE_FACT_SK] [bigint] NOT NULL,
	[SRC_SRGCL_SPPLY_ID] [varchar](254) NULL,
	[PTNT_SK] [bigint] NULL,
	[CASE_SK] [bigint] NULL,
	[SPPLY_SK] [bigint] NULL,
	[DEPT_SK] [bigint] NULL,
	[SRG_DT] [datetime] NULL,
	[HSPTL_ENCNT_SK] [bigint] NULL,
	[SRG_ENCNT_SK] [bigint] NULL,
	[PRMY_PROVDR_SK] [bigint] NULL,
	[PRCDR_CD_SK] [bigint] NULL,
	[LOG_STS_CDS] [int] NULL,
	[OR_SRVC_CDS] [int] NULL,
	[NBR_USE] [int] NULL,
	[NBR_WSTD] [int] NULL,
	[NBR_OPEN] [int] NULL,
	[NBR_PRN] [int] NULL,
	[UNT_COST] [numeric](18, 2) NULL,
	[CRGBL_IND] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SurgicalSupplyUseFact]  WITH CHECK ADD  CONSTRAINT [SurgicalSupplyUseFact-BinaryDim] FOREIGN KEY([CRGBL_IND])
REFERENCES [dbo].[BinaryDim] ([Binary_CD])
GO
ALTER TABLE [dbo].[SurgicalSupplyUseFact] CHECK CONSTRAINT [SurgicalSupplyUseFact-BinaryDim]
GO
ALTER TABLE [dbo].[SurgicalSupplyUseFact]  WITH CHECK ADD  CONSTRAINT [SurgicalSupplyUseFact-DateDim] FOREIGN KEY([SRG_DT])
REFERENCES [dbo].[DateDim] ([CLNDR_DT])
GO
ALTER TABLE [dbo].[SurgicalSupplyUseFact] CHECK CONSTRAINT [SurgicalSupplyUseFact-DateDim]
GO
ALTER TABLE [dbo].[SurgicalSupplyUseFact]  WITH CHECK ADD  CONSTRAINT [SurgicalSupplyUseFact-DepartmentDim] FOREIGN KEY([DEPT_SK])
REFERENCES [dbo].[DepartmentDim] ([DEPT_SK])
GO
ALTER TABLE [dbo].[SurgicalSupplyUseFact] CHECK CONSTRAINT [SurgicalSupplyUseFact-DepartmentDim]
GO
ALTER TABLE [dbo].[SurgicalSupplyUseFact]  WITH CHECK ADD  CONSTRAINT [SurgicalSupplyUseFact-EncounterDim] FOREIGN KEY([HSPTL_ENCNT_SK])
REFERENCES [dbo].[EncounterDim] ([ENCNT_SK])
GO
ALTER TABLE [dbo].[SurgicalSupplyUseFact] CHECK CONSTRAINT [SurgicalSupplyUseFact-EncounterDim]
GO
ALTER TABLE [dbo].[SurgicalSupplyUseFact]  WITH CHECK ADD  CONSTRAINT [SurgicalSupplyUseFact-EncounterDim1] FOREIGN KEY([SRG_ENCNT_SK])
REFERENCES [dbo].[EncounterDim] ([ENCNT_SK])
GO
ALTER TABLE [dbo].[SurgicalSupplyUseFact] CHECK CONSTRAINT [SurgicalSupplyUseFact-EncounterDim1]
GO
ALTER TABLE [dbo].[SurgicalSupplyUseFact]  WITH CHECK ADD  CONSTRAINT [SurgicalSupplyUseFact-PatientDim] FOREIGN KEY([PTNT_SK])
REFERENCES [dbo].[PatientDim] ([PTNT_SK])
GO
ALTER TABLE [dbo].[SurgicalSupplyUseFact] CHECK CONSTRAINT [SurgicalSupplyUseFact-PatientDim]
GO
ALTER TABLE [dbo].[SurgicalSupplyUseFact]  WITH CHECK ADD  CONSTRAINT [SurgicalSupplyUseFact-ProcedureDim] FOREIGN KEY([PRCDR_CD_SK])
REFERENCES [dbo].[ProcedureDim] ([PRCDR_CD_SK])
GO
ALTER TABLE [dbo].[SurgicalSupplyUseFact] CHECK CONSTRAINT [SurgicalSupplyUseFact-ProcedureDim]
GO
ALTER TABLE [dbo].[SurgicalSupplyUseFact]  WITH CHECK ADD  CONSTRAINT [SurgicalSupplyUseFact-ProviderDim] FOREIGN KEY([PRMY_PROVDR_SK])
REFERENCES [dbo].[ProviderDim] ([PROVDR_SK])
GO
ALTER TABLE [dbo].[SurgicalSupplyUseFact] CHECK CONSTRAINT [SurgicalSupplyUseFact-ProviderDim]
GO
ALTER TABLE [dbo].[SurgicalSupplyUseFact]  WITH CHECK ADD  CONSTRAINT [SurgicalSupplyUseFact-SurgicalCaseDim] FOREIGN KEY([CASE_SK])
REFERENCES [dbo].[SurgicalCaseDim] ([CASE_SK])
GO
ALTER TABLE [dbo].[SurgicalSupplyUseFact] CHECK CONSTRAINT [SurgicalSupplyUseFact-SurgicalCaseDim]
GO
ALTER TABLE [dbo].[SurgicalSupplyUseFact]  WITH CHECK ADD  CONSTRAINT [SurgicalSupplyUseFact-SurgicalSupplyDim] FOREIGN KEY([SPPLY_SK])
REFERENCES [dbo].[SurgicalSupplyDim] ([SPPLY_SK])
GO
ALTER TABLE [dbo].[SurgicalSupplyUseFact] CHECK CONSTRAINT [SurgicalSupplyUseFact-SurgicalSupplyDim]
GO
ALTER TABLE [dbo].[SurgicalSupplyUseFact]  WITH CHECK ADD  CONSTRAINT [SurgicalSupplyUseFact-SurgicalSupplyUseLogStatusDim] FOREIGN KEY([LOG_STS_CDS])
REFERENCES [dbo].[SurgicalSupplyUseLogStatusDim] ([LOG_STS_CDS])
GO
ALTER TABLE [dbo].[SurgicalSupplyUseFact] CHECK CONSTRAINT [SurgicalSupplyUseFact-SurgicalSupplyUseLogStatusDim]
GO
ALTER TABLE [dbo].[SurgicalSupplyUseFact]  WITH CHECK ADD  CONSTRAINT [SurgicalSupplyUseFact-SurgicalSupplyUseORServiceDim] FOREIGN KEY([OR_SRVC_CDS])
REFERENCES [dbo].[SurgicalSupplyUseORServiceDim] ([OR_SRVC_CDS])
GO
ALTER TABLE [dbo].[SurgicalSupplyUseFact] CHECK CONSTRAINT [SurgicalSupplyUseFact-SurgicalSupplyUseORServiceDim]
GO
