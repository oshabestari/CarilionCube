SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SurgicalProcedureEventFact](
	[SRG_PRCDR_EV_FACT_SK] [bigint] NOT NULL,
	[PTNT_SK] [bigint] NULL,
	[CASE_SK] [bigint] NULL,
	[PRCDR_CD_SK] [bigint] NULL,
	[PRMY_PROVDR_SURGEON_SK] [bigint] NULL,
	[SCND_PROVDR_SURGEON_SK] [bigint] NULL,
	[THRD_PROVDR_SURGEON_SK] [bigint] NULL,
	[SRG_DT] [datetime] NULL,
	[HSPTL_ENCNT_SK] [bigint] NULL,
	[SRG_ENCNT_SK] [bigint] NULL,
	[DEPT_SK] [bigint] NULL,
	[SRVC_CDS] [int] NULL,
	[PRCDR_SITE_CDS] [int] NULL,
	[LTRLTY_CDS] [int] NULL,
	[ANSTH_TYPE_CDS] [int] NULL,
	[WND_CLASS_CDS] [int] NULL,
	[SCHED_IND] [int] NULL,
	[PRFRM_IND] [int] NULL,
	[PSSBL_IND] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SurgicalProcedureEventFact]  WITH CHECK ADD  CONSTRAINT [FK_SurgicalProcedureEventFact_DepartmentDim] FOREIGN KEY([DEPT_SK])
REFERENCES [dbo].[DepartmentDim] ([DEPT_SK])
GO
ALTER TABLE [dbo].[SurgicalProcedureEventFact] CHECK CONSTRAINT [FK_SurgicalProcedureEventFact_DepartmentDim]
GO
ALTER TABLE [dbo].[SurgicalProcedureEventFact]  WITH CHECK ADD  CONSTRAINT [SurgicalProcedureEventFact-BinaryDim] FOREIGN KEY([SCHED_IND])
REFERENCES [dbo].[BinaryDim] ([Binary_CD])
GO
ALTER TABLE [dbo].[SurgicalProcedureEventFact] CHECK CONSTRAINT [SurgicalProcedureEventFact-BinaryDim]
GO
ALTER TABLE [dbo].[SurgicalProcedureEventFact]  WITH CHECK ADD  CONSTRAINT [SurgicalProcedureEventFact-BinaryDim1] FOREIGN KEY([PRFRM_IND])
REFERENCES [dbo].[BinaryDim] ([Binary_CD])
GO
ALTER TABLE [dbo].[SurgicalProcedureEventFact] CHECK CONSTRAINT [SurgicalProcedureEventFact-BinaryDim1]
GO
ALTER TABLE [dbo].[SurgicalProcedureEventFact]  WITH CHECK ADD  CONSTRAINT [SurgicalProcedureEventFact-BinaryDim12] FOREIGN KEY([PSSBL_IND])
REFERENCES [dbo].[BinaryDim] ([Binary_CD])
GO
ALTER TABLE [dbo].[SurgicalProcedureEventFact] CHECK CONSTRAINT [SurgicalProcedureEventFact-BinaryDim12]
GO
ALTER TABLE [dbo].[SurgicalProcedureEventFact]  WITH CHECK ADD  CONSTRAINT [SurgicalProcedureEventFact-DateDim] FOREIGN KEY([SRG_DT])
REFERENCES [dbo].[DateDim] ([CLNDR_DT])
GO
ALTER TABLE [dbo].[SurgicalProcedureEventFact] CHECK CONSTRAINT [SurgicalProcedureEventFact-DateDim]
GO
ALTER TABLE [dbo].[SurgicalProcedureEventFact]  WITH CHECK ADD  CONSTRAINT [SurgicalProcedureEventFact-EncounterDim] FOREIGN KEY([HSPTL_ENCNT_SK])
REFERENCES [dbo].[EncounterDim] ([ENCNT_SK])
GO
ALTER TABLE [dbo].[SurgicalProcedureEventFact] CHECK CONSTRAINT [SurgicalProcedureEventFact-EncounterDim]
GO
ALTER TABLE [dbo].[SurgicalProcedureEventFact]  WITH CHECK ADD  CONSTRAINT [SurgicalProcedureEventFact-EncounterDim1] FOREIGN KEY([SRG_ENCNT_SK])
REFERENCES [dbo].[EncounterDim] ([ENCNT_SK])
GO
ALTER TABLE [dbo].[SurgicalProcedureEventFact] CHECK CONSTRAINT [SurgicalProcedureEventFact-EncounterDim1]
GO
ALTER TABLE [dbo].[SurgicalProcedureEventFact]  WITH CHECK ADD  CONSTRAINT [SurgicalProcedureEventFact-PatientDim] FOREIGN KEY([PTNT_SK])
REFERENCES [dbo].[PatientDim] ([PTNT_SK])
GO
ALTER TABLE [dbo].[SurgicalProcedureEventFact] CHECK CONSTRAINT [SurgicalProcedureEventFact-PatientDim]
GO
ALTER TABLE [dbo].[SurgicalProcedureEventFact]  WITH CHECK ADD  CONSTRAINT [SurgicalProcedureEventFact-ProcedureDim] FOREIGN KEY([PRCDR_CD_SK])
REFERENCES [dbo].[ProcedureDim] ([PRCDR_CD_SK])
GO
ALTER TABLE [dbo].[SurgicalProcedureEventFact] CHECK CONSTRAINT [SurgicalProcedureEventFact-ProcedureDim]
GO
ALTER TABLE [dbo].[SurgicalProcedureEventFact]  WITH CHECK ADD  CONSTRAINT [SurgicalProcedureEventFact-ProviderDim] FOREIGN KEY([PRMY_PROVDR_SURGEON_SK])
REFERENCES [dbo].[ProviderDim] ([PROVDR_SK])
GO
ALTER TABLE [dbo].[SurgicalProcedureEventFact] CHECK CONSTRAINT [SurgicalProcedureEventFact-ProviderDim]
GO
ALTER TABLE [dbo].[SurgicalProcedureEventFact]  WITH CHECK ADD  CONSTRAINT [SurgicalProcedureEventFact-ProviderDim1] FOREIGN KEY([SCND_PROVDR_SURGEON_SK])
REFERENCES [dbo].[ProviderDim] ([PROVDR_SK])
GO
ALTER TABLE [dbo].[SurgicalProcedureEventFact] CHECK CONSTRAINT [SurgicalProcedureEventFact-ProviderDim1]
GO
ALTER TABLE [dbo].[SurgicalProcedureEventFact]  WITH CHECK ADD  CONSTRAINT [SurgicalProcedureEventFact-ProviderDim12] FOREIGN KEY([THRD_PROVDR_SURGEON_SK])
REFERENCES [dbo].[ProviderDim] ([PROVDR_SK])
GO
ALTER TABLE [dbo].[SurgicalProcedureEventFact] CHECK CONSTRAINT [SurgicalProcedureEventFact-ProviderDim12]
GO
ALTER TABLE [dbo].[SurgicalProcedureEventFact]  WITH CHECK ADD  CONSTRAINT [SurgicalProcedureEventFact-SugicalProcedureEventWoundClassDim] FOREIGN KEY([WND_CLASS_CDS])
REFERENCES [dbo].[SugicalProcedureEventWoundClassDim] ([WND_CLASS_CDS])
GO
ALTER TABLE [dbo].[SurgicalProcedureEventFact] CHECK CONSTRAINT [SurgicalProcedureEventFact-SugicalProcedureEventWoundClassDim]
GO
ALTER TABLE [dbo].[SurgicalProcedureEventFact]  WITH CHECK ADD  CONSTRAINT [SurgicalProcedureEventFact-SurgicalCaseDim] FOREIGN KEY([CASE_SK])
REFERENCES [dbo].[SurgicalCaseDim] ([CASE_SK])
GO
ALTER TABLE [dbo].[SurgicalProcedureEventFact] CHECK CONSTRAINT [SurgicalProcedureEventFact-SurgicalCaseDim]
GO
ALTER TABLE [dbo].[SurgicalProcedureEventFact]  WITH CHECK ADD  CONSTRAINT [SurgicalProcedureEventFact-SurgicalProcedureEventAnesthesiaTypeDim] FOREIGN KEY([ANSTH_TYPE_CDS])
REFERENCES [dbo].[SurgicalProcedureEventAnesthesiaTypeDim] ([ANSTH_TYPE_CDS])
GO
ALTER TABLE [dbo].[SurgicalProcedureEventFact] CHECK CONSTRAINT [SurgicalProcedureEventFact-SurgicalProcedureEventAnesthesiaTypeDim]
GO
ALTER TABLE [dbo].[SurgicalProcedureEventFact]  WITH CHECK ADD  CONSTRAINT [SurgicalProcedureEventFact-SurgicalProcedureEventLateralityDim] FOREIGN KEY([LTRLTY_CDS])
REFERENCES [dbo].[SurgicalProcedureEventLateralityDim] ([LTRLTY_CDS])
GO
ALTER TABLE [dbo].[SurgicalProcedureEventFact] CHECK CONSTRAINT [SurgicalProcedureEventFact-SurgicalProcedureEventLateralityDim]
GO
ALTER TABLE [dbo].[SurgicalProcedureEventFact]  WITH CHECK ADD  CONSTRAINT [SurgicalProcedureEventFact-SurgicalProcedureEventProcedureSiteDim] FOREIGN KEY([PRCDR_SITE_CDS])
REFERENCES [dbo].[SurgicalProcedureEventProcedureSiteDim] ([PRCDR_SITE_CDS])
GO
ALTER TABLE [dbo].[SurgicalProcedureEventFact] CHECK CONSTRAINT [SurgicalProcedureEventFact-SurgicalProcedureEventProcedureSiteDim]
GO
ALTER TABLE [dbo].[SurgicalProcedureEventFact]  WITH CHECK ADD  CONSTRAINT [SurgicalProcedureEventFact-SurgicalProcedureEventServiceDim] FOREIGN KEY([SRVC_CDS])
REFERENCES [dbo].[SurgicalProcedureEventServiceDim] ([SRVC_CDS])
GO
ALTER TABLE [dbo].[SurgicalProcedureEventFact] CHECK CONSTRAINT [SurgicalProcedureEventFact-SurgicalProcedureEventServiceDim]
GO
