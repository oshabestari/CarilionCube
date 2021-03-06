SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SurgicalCaseFact](
	[SRGCL_CASE_FACT_SK] [bigint] NOT NULL,
	[CASE_SK] [bigint] NULL,
	[PTNT_SK] [bigint] NULL,
	[PRMY_PROVDR_SK] [bigint] NULL,
	[ANSTHGIST_PROVDR_SK] [bigint] NULL,
	[PRMY_PRCDR_CD_SK] [bigint] NULL,
	[DEPT_SK] [bigint] NULL,
	[DIAG_CD_SK] [int] NULL,
	[HSPTL_ENCNT_SK] [bigint] NULL,
	[SRG_ENCNT_SK] [bigint] NULL,
	[SRG_DT] [datetime] NULL,
	[CASE_RQST_DT] [datetime] NULL,
	[CASE_RQST_TM_SK] [bigint] NULL,
	[SCHED_SETUP_STRT_DT] [datetime] NULL,
	[SCHED_SETUP_STRT_TM_SK] [bigint] NULL,
	[SCHED_IN_RM_DT] [datetime] NULL,
	[SCHED_IN_RM_TM_SK] [bigint] NULL,
	[SCHED_OUT_OF_RM_DT] [datetime] NULL,
	[SCHED_OUT_OF_RM_TM_SK] [bigint] NULL,
	[SCHED_CLNUP_CMPLT_DT] [datetime] NULL,
	[SCHED_CLNUP_CMPLT_TM_SK] [bigint] NULL,
	[PTNT_IN_FCLT_DT] [datetime] NULL,
	[PTNT_IN_FCLT_TM_SK] [bigint] NULL,
	[PTNT_IN_PRE_PRCDR_DT] [datetime] NULL,
	[PTNT_IN_PRE_PRCDR_TM_SK] [bigint] NULL,
	[RM_SETUP_STRT_DT] [datetime] NULL,
	[RM_SETUP_STRT_TM_SK] [bigint] NULL,
	[RM_RDY_DT] [datetime] NULL,
	[RM_RDY_TM_SK] [bigint] NULL,
	[ANSTH_STRT_DT] [datetime] NULL,
	[ANSTH_STRT_TM_SK] [bigint] NULL,
	[PRE_PRCDR_CMPLT_DT] [datetime] NULL,
	[PRE_PRCDR_CMPLT_TM_SK] [bigint] NULL,
	[PTNT_IN_RM_DT] [datetime] NULL,
	[PTNT_IN_RM_TM_SK] [bigint] NULL,
	[ANSTH_RDY_DT] [datetime] NULL,
	[ANSTH_RDY_TM_SK] [bigint] NULL,
	[PRCDR_STRT_DT] [datetime] NULL,
	[PRCDR_STRT_TM_SK] [bigint] NULL,
	[PRCDR_CMPLT_DT] [datetime] NULL,
	[PRCDR_CMPLT_TM_SK] [bigint] NULL,
	[PTNT_OUT_OF_RM_DT] [datetime] NULL,
	[PTNT_OUT_OF_RM_TM_SK] [bigint] NULL,
	[RM_CLNUP_STRT_DT] [datetime] NULL,
	[RM_CLNUP_STRT_TM_SK] [bigint] NULL,
	[RM_CLNUP_CMPLT_DT] [datetime] NULL,
	[RM_CLNUP_CMPLT_TM_SK] [bigint] NULL,
	[PTNT_IN_PACU_DT] [datetime] NULL,
	[PTNT_IN_PACU_TM_SK] [bigint] NULL,
	[ANSTH_STOP_DT] [datetime] NULL,
	[ANSTH_STOP_TM_SK] [bigint] NULL,
	[PACU_CARE_CMPLT_DT] [datetime] NULL,
	[PACU_CARE_CMPLT_TM_SK] [bigint] NULL,
	[PTNT_OUT_OF_PACU_DT] [datetime] NULL,
	[PTNT_OUT_OF_PACU_TM_SK] [bigint] NULL,
	[PTNT_POST_OP_DT] [datetime] NULL,
	[PTNT_POST_OP_TM_SK] [bigint] NULL,
	[POST_OP_CARE_CMPLT_DT] [datetime] NULL,
	[POST_OP_CARE_CMPLT_TM_SK] [bigint] NULL,
	[PTNT_OUT_OF_POST_OP_DT] [datetime] NULL,
	[PTNT_OUT_OF_POST_OP_TM_SK] [bigint] NULL,
	[CNCL_IND] [int] NULL,
	[ADD_ON_IND] [int] NULL,
	[CNFD_IND] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SurgicalCaseFact]  WITH CHECK ADD  CONSTRAINT [SurgicalCaseFact-DateDim] FOREIGN KEY([SRG_DT])
REFERENCES [dbo].[DateDim] ([CLNDR_DT])
GO
ALTER TABLE [dbo].[SurgicalCaseFact] CHECK CONSTRAINT [SurgicalCaseFact-DateDim]
GO
ALTER TABLE [dbo].[SurgicalCaseFact]  WITH CHECK ADD  CONSTRAINT [SurgicalCaseFact-DateDim1] FOREIGN KEY([CASE_RQST_DT])
REFERENCES [dbo].[DateDim] ([CLNDR_DT])
GO
ALTER TABLE [dbo].[SurgicalCaseFact] CHECK CONSTRAINT [SurgicalCaseFact-DateDim1]
GO
ALTER TABLE [dbo].[SurgicalCaseFact]  WITH CHECK ADD  CONSTRAINT [SurgicalCaseFact-DateDim12] FOREIGN KEY([SCHED_SETUP_STRT_DT])
REFERENCES [dbo].[DateDim] ([CLNDR_DT])
GO
ALTER TABLE [dbo].[SurgicalCaseFact] CHECK CONSTRAINT [SurgicalCaseFact-DateDim12]
GO
ALTER TABLE [dbo].[SurgicalCaseFact]  WITH CHECK ADD  CONSTRAINT [SurgicalCaseFact-DateDim123] FOREIGN KEY([SCHED_IN_RM_DT])
REFERENCES [dbo].[DateDim] ([CLNDR_DT])
GO
ALTER TABLE [dbo].[SurgicalCaseFact] CHECK CONSTRAINT [SurgicalCaseFact-DateDim123]
GO
ALTER TABLE [dbo].[SurgicalCaseFact]  WITH CHECK ADD  CONSTRAINT [SurgicalCaseFact-DateDim1234] FOREIGN KEY([SCHED_OUT_OF_RM_DT])
REFERENCES [dbo].[DateDim] ([CLNDR_DT])
GO
ALTER TABLE [dbo].[SurgicalCaseFact] CHECK CONSTRAINT [SurgicalCaseFact-DateDim1234]
GO
ALTER TABLE [dbo].[SurgicalCaseFact]  WITH CHECK ADD  CONSTRAINT [SurgicalCaseFact-DateDim12345] FOREIGN KEY([PTNT_IN_FCLT_DT])
REFERENCES [dbo].[DateDim] ([CLNDR_DT])
GO
ALTER TABLE [dbo].[SurgicalCaseFact] CHECK CONSTRAINT [SurgicalCaseFact-DateDim12345]
GO
ALTER TABLE [dbo].[SurgicalCaseFact]  WITH CHECK ADD  CONSTRAINT [SurgicalCaseFact-DateDim123456] FOREIGN KEY([PTNT_IN_PRE_PRCDR_DT])
REFERENCES [dbo].[DateDim] ([CLNDR_DT])
GO
ALTER TABLE [dbo].[SurgicalCaseFact] CHECK CONSTRAINT [SurgicalCaseFact-DateDim123456]
GO
ALTER TABLE [dbo].[SurgicalCaseFact]  WITH CHECK ADD  CONSTRAINT [SurgicalCaseFact-DateDim1234567] FOREIGN KEY([PTNT_OUT_OF_POST_OP_DT])
REFERENCES [dbo].[DateDim] ([CLNDR_DT])
GO
ALTER TABLE [dbo].[SurgicalCaseFact] CHECK CONSTRAINT [SurgicalCaseFact-DateDim1234567]
GO
ALTER TABLE [dbo].[SurgicalCaseFact]  WITH CHECK ADD  CONSTRAINT [SurgicalCaseFact-DateDim12345678] FOREIGN KEY([POST_OP_CARE_CMPLT_DT])
REFERENCES [dbo].[DateDim] ([CLNDR_DT])
GO
ALTER TABLE [dbo].[SurgicalCaseFact] CHECK CONSTRAINT [SurgicalCaseFact-DateDim12345678]
GO
ALTER TABLE [dbo].[SurgicalCaseFact]  WITH CHECK ADD  CONSTRAINT [SurgicalCaseFact-DateDim123456789] FOREIGN KEY([PTNT_POST_OP_DT])
REFERENCES [dbo].[DateDim] ([CLNDR_DT])
GO
ALTER TABLE [dbo].[SurgicalCaseFact] CHECK CONSTRAINT [SurgicalCaseFact-DateDim123456789]
GO
ALTER TABLE [dbo].[SurgicalCaseFact]  WITH CHECK ADD  CONSTRAINT [SurgicalCaseFact-DateDim12345678910] FOREIGN KEY([PTNT_OUT_OF_PACU_DT])
REFERENCES [dbo].[DateDim] ([CLNDR_DT])
GO
ALTER TABLE [dbo].[SurgicalCaseFact] CHECK CONSTRAINT [SurgicalCaseFact-DateDim12345678910]
GO
ALTER TABLE [dbo].[SurgicalCaseFact]  WITH CHECK ADD  CONSTRAINT [SurgicalCaseFact-DateDim1234567891011] FOREIGN KEY([PACU_CARE_CMPLT_DT])
REFERENCES [dbo].[DateDim] ([CLNDR_DT])
GO
ALTER TABLE [dbo].[SurgicalCaseFact] CHECK CONSTRAINT [SurgicalCaseFact-DateDim1234567891011]
GO
ALTER TABLE [dbo].[SurgicalCaseFact]  WITH CHECK ADD  CONSTRAINT [SurgicalCaseFact-DateDim123456789101112] FOREIGN KEY([ANSTH_STOP_DT])
REFERENCES [dbo].[DateDim] ([CLNDR_DT])
GO
ALTER TABLE [dbo].[SurgicalCaseFact] CHECK CONSTRAINT [SurgicalCaseFact-DateDim123456789101112]
GO
ALTER TABLE [dbo].[SurgicalCaseFact]  WITH CHECK ADD  CONSTRAINT [SurgicalCaseFact-DateDim12345678910111213] FOREIGN KEY([PTNT_IN_PACU_DT])
REFERENCES [dbo].[DateDim] ([CLNDR_DT])
GO
ALTER TABLE [dbo].[SurgicalCaseFact] CHECK CONSTRAINT [SurgicalCaseFact-DateDim12345678910111213]
GO
ALTER TABLE [dbo].[SurgicalCaseFact]  WITH CHECK ADD  CONSTRAINT [SurgicalCaseFact-DateDim1234567891011121314] FOREIGN KEY([RM_CLNUP_CMPLT_DT])
REFERENCES [dbo].[DateDim] ([CLNDR_DT])
GO
ALTER TABLE [dbo].[SurgicalCaseFact] CHECK CONSTRAINT [SurgicalCaseFact-DateDim1234567891011121314]
GO
ALTER TABLE [dbo].[SurgicalCaseFact]  WITH CHECK ADD  CONSTRAINT [SurgicalCaseFact-DateDim123456789101112131415] FOREIGN KEY([RM_CLNUP_STRT_DT])
REFERENCES [dbo].[DateDim] ([CLNDR_DT])
GO
ALTER TABLE [dbo].[SurgicalCaseFact] CHECK CONSTRAINT [SurgicalCaseFact-DateDim123456789101112131415]
GO
ALTER TABLE [dbo].[SurgicalCaseFact]  WITH CHECK ADD  CONSTRAINT [SurgicalCaseFact-DateDim12345678910111213141516] FOREIGN KEY([PTNT_OUT_OF_RM_DT])
REFERENCES [dbo].[DateDim] ([CLNDR_DT])
GO
ALTER TABLE [dbo].[SurgicalCaseFact] CHECK CONSTRAINT [SurgicalCaseFact-DateDim12345678910111213141516]
GO
ALTER TABLE [dbo].[SurgicalCaseFact]  WITH CHECK ADD  CONSTRAINT [SurgicalCaseFact-DateDim1234567891011121314151617] FOREIGN KEY([PRCDR_CMPLT_DT])
REFERENCES [dbo].[DateDim] ([CLNDR_DT])
GO
ALTER TABLE [dbo].[SurgicalCaseFact] CHECK CONSTRAINT [SurgicalCaseFact-DateDim1234567891011121314151617]
GO
ALTER TABLE [dbo].[SurgicalCaseFact]  WITH CHECK ADD  CONSTRAINT [SurgicalCaseFact-DateDim123456789101112131415161718] FOREIGN KEY([PRCDR_STRT_DT])
REFERENCES [dbo].[DateDim] ([CLNDR_DT])
GO
ALTER TABLE [dbo].[SurgicalCaseFact] CHECK CONSTRAINT [SurgicalCaseFact-DateDim123456789101112131415161718]
GO
ALTER TABLE [dbo].[SurgicalCaseFact]  WITH CHECK ADD  CONSTRAINT [SurgicalCaseFact-DateDim12345678910111213141516171819] FOREIGN KEY([ANSTH_RDY_DT])
REFERENCES [dbo].[DateDim] ([CLNDR_DT])
GO
ALTER TABLE [dbo].[SurgicalCaseFact] CHECK CONSTRAINT [SurgicalCaseFact-DateDim12345678910111213141516171819]
GO
ALTER TABLE [dbo].[SurgicalCaseFact]  WITH CHECK ADD  CONSTRAINT [SurgicalCaseFact-DateDim123456789101112131415161718192021] FOREIGN KEY([PTNT_IN_RM_DT])
REFERENCES [dbo].[DateDim] ([CLNDR_DT])
GO
ALTER TABLE [dbo].[SurgicalCaseFact] CHECK CONSTRAINT [SurgicalCaseFact-DateDim123456789101112131415161718192021]
GO
ALTER TABLE [dbo].[SurgicalCaseFact]  WITH CHECK ADD  CONSTRAINT [SurgicalCaseFact-DateDim12345678910111213141516171819202122] FOREIGN KEY([PRE_PRCDR_CMPLT_DT])
REFERENCES [dbo].[DateDim] ([CLNDR_DT])
GO
ALTER TABLE [dbo].[SurgicalCaseFact] CHECK CONSTRAINT [SurgicalCaseFact-DateDim12345678910111213141516171819202122]
GO
ALTER TABLE [dbo].[SurgicalCaseFact]  WITH CHECK ADD  CONSTRAINT [SurgicalCaseFact-DateDim1234567891011121314151617181920212223] FOREIGN KEY([ANSTH_STRT_DT])
REFERENCES [dbo].[DateDim] ([CLNDR_DT])
GO
ALTER TABLE [dbo].[SurgicalCaseFact] CHECK CONSTRAINT [SurgicalCaseFact-DateDim1234567891011121314151617181920212223]
GO
ALTER TABLE [dbo].[SurgicalCaseFact]  WITH CHECK ADD  CONSTRAINT [SurgicalCaseFact-DateDim123456789101112131415161718192021222324] FOREIGN KEY([RM_RDY_DT])
REFERENCES [dbo].[DateDim] ([CLNDR_DT])
GO
ALTER TABLE [dbo].[SurgicalCaseFact] CHECK CONSTRAINT [SurgicalCaseFact-DateDim123456789101112131415161718192021222324]
GO
ALTER TABLE [dbo].[SurgicalCaseFact]  WITH CHECK ADD  CONSTRAINT [SurgicalCaseFact-DateDim12345678910111213141516171819202122232425] FOREIGN KEY([RM_SETUP_STRT_DT])
REFERENCES [dbo].[DateDim] ([CLNDR_DT])
GO
ALTER TABLE [dbo].[SurgicalCaseFact] CHECK CONSTRAINT [SurgicalCaseFact-DateDim12345678910111213141516171819202122232425]
GO
ALTER TABLE [dbo].[SurgicalCaseFact]  WITH CHECK ADD  CONSTRAINT [SurgicalCaseFact-DateDim1234567891011121314151617181920212223242526] FOREIGN KEY([SCHED_CLNUP_CMPLT_DT])
REFERENCES [dbo].[DateDim] ([CLNDR_DT])
GO
ALTER TABLE [dbo].[SurgicalCaseFact] CHECK CONSTRAINT [SurgicalCaseFact-DateDim1234567891011121314151617181920212223242526]
GO
ALTER TABLE [dbo].[SurgicalCaseFact]  WITH CHECK ADD  CONSTRAINT [SurgicalCaseFact-DepartmentDim] FOREIGN KEY([DEPT_SK])
REFERENCES [dbo].[DepartmentDim] ([DEPT_SK])
GO
ALTER TABLE [dbo].[SurgicalCaseFact] CHECK CONSTRAINT [SurgicalCaseFact-DepartmentDim]
GO
ALTER TABLE [dbo].[SurgicalCaseFact]  WITH CHECK ADD  CONSTRAINT [SurgicalCaseFact-DiagnosisBridge] FOREIGN KEY([DIAG_CD_SK])
REFERENCES [dbo].[DiagnosisBridge] ([DIAG_CD_SK])
GO
ALTER TABLE [dbo].[SurgicalCaseFact] CHECK CONSTRAINT [SurgicalCaseFact-DiagnosisBridge]
GO
ALTER TABLE [dbo].[SurgicalCaseFact]  WITH CHECK ADD  CONSTRAINT [SurgicalCaseFact-EncounterDim] FOREIGN KEY([HSPTL_ENCNT_SK])
REFERENCES [dbo].[EncounterDim] ([ENCNT_SK])
GO
ALTER TABLE [dbo].[SurgicalCaseFact] CHECK CONSTRAINT [SurgicalCaseFact-EncounterDim]
GO
ALTER TABLE [dbo].[SurgicalCaseFact]  WITH CHECK ADD  CONSTRAINT [SurgicalCaseFact-EncounterDim1] FOREIGN KEY([SRG_ENCNT_SK])
REFERENCES [dbo].[EncounterDim] ([ENCNT_SK])
GO
ALTER TABLE [dbo].[SurgicalCaseFact] CHECK CONSTRAINT [SurgicalCaseFact-EncounterDim1]
GO
ALTER TABLE [dbo].[SurgicalCaseFact]  WITH CHECK ADD  CONSTRAINT [SurgicalCaseFact-PatientDim] FOREIGN KEY([PTNT_SK])
REFERENCES [dbo].[PatientDim] ([PTNT_SK])
GO
ALTER TABLE [dbo].[SurgicalCaseFact] CHECK CONSTRAINT [SurgicalCaseFact-PatientDim]
GO
ALTER TABLE [dbo].[SurgicalCaseFact]  WITH CHECK ADD  CONSTRAINT [SurgicalCaseFact-ProcedureDim] FOREIGN KEY([PRMY_PRCDR_CD_SK])
REFERENCES [dbo].[ProcedureDim] ([PRCDR_CD_SK])
GO
ALTER TABLE [dbo].[SurgicalCaseFact] CHECK CONSTRAINT [SurgicalCaseFact-ProcedureDim]
GO
ALTER TABLE [dbo].[SurgicalCaseFact]  WITH CHECK ADD  CONSTRAINT [SurgicalCaseFact-ProviderDim] FOREIGN KEY([PRMY_PROVDR_SK])
REFERENCES [dbo].[ProviderDim] ([PROVDR_SK])
GO
ALTER TABLE [dbo].[SurgicalCaseFact] CHECK CONSTRAINT [SurgicalCaseFact-ProviderDim]
GO
ALTER TABLE [dbo].[SurgicalCaseFact]  WITH CHECK ADD  CONSTRAINT [SurgicalCaseFact-ProviderDim1] FOREIGN KEY([ANSTHGIST_PROVDR_SK])
REFERENCES [dbo].[ProviderDim] ([PROVDR_SK])
GO
ALTER TABLE [dbo].[SurgicalCaseFact] CHECK CONSTRAINT [SurgicalCaseFact-ProviderDim1]
GO
ALTER TABLE [dbo].[SurgicalCaseFact]  WITH CHECK ADD  CONSTRAINT [SurgicalCaseFact-SurgicalCaseDim] FOREIGN KEY([CASE_SK])
REFERENCES [dbo].[SurgicalCaseDim] ([CASE_SK])
GO
ALTER TABLE [dbo].[SurgicalCaseFact] CHECK CONSTRAINT [SurgicalCaseFact-SurgicalCaseDim]
GO
ALTER TABLE [dbo].[SurgicalCaseFact]  WITH CHECK ADD  CONSTRAINT [SurgicalCaseFact-TimeDim] FOREIGN KEY([CASE_RQST_TM_SK])
REFERENCES [dbo].[TimeDim] ([TM_OF_DY_SK])
GO
ALTER TABLE [dbo].[SurgicalCaseFact] CHECK CONSTRAINT [SurgicalCaseFact-TimeDim]
GO
ALTER TABLE [dbo].[SurgicalCaseFact]  WITH CHECK ADD  CONSTRAINT [SurgicalCaseFact-TimeDim1] FOREIGN KEY([SCHED_SETUP_STRT_TM_SK])
REFERENCES [dbo].[TimeDim] ([TM_OF_DY_SK])
GO
ALTER TABLE [dbo].[SurgicalCaseFact] CHECK CONSTRAINT [SurgicalCaseFact-TimeDim1]
GO
ALTER TABLE [dbo].[SurgicalCaseFact]  WITH CHECK ADD  CONSTRAINT [SurgicalCaseFact-TimeDim12] FOREIGN KEY([SCHED_IN_RM_TM_SK])
REFERENCES [dbo].[TimeDim] ([TM_OF_DY_SK])
GO
ALTER TABLE [dbo].[SurgicalCaseFact] CHECK CONSTRAINT [SurgicalCaseFact-TimeDim12]
GO
ALTER TABLE [dbo].[SurgicalCaseFact]  WITH CHECK ADD  CONSTRAINT [SurgicalCaseFact-TimeDim123] FOREIGN KEY([SCHED_OUT_OF_RM_TM_SK])
REFERENCES [dbo].[TimeDim] ([TM_OF_DY_SK])
GO
ALTER TABLE [dbo].[SurgicalCaseFact] CHECK CONSTRAINT [SurgicalCaseFact-TimeDim123]
GO
ALTER TABLE [dbo].[SurgicalCaseFact]  WITH CHECK ADD  CONSTRAINT [SurgicalCaseFact-TimeDim1234] FOREIGN KEY([SCHED_CLNUP_CMPLT_TM_SK])
REFERENCES [dbo].[TimeDim] ([TM_OF_DY_SK])
GO
ALTER TABLE [dbo].[SurgicalCaseFact] CHECK CONSTRAINT [SurgicalCaseFact-TimeDim1234]
GO
ALTER TABLE [dbo].[SurgicalCaseFact]  WITH CHECK ADD  CONSTRAINT [SurgicalCaseFact-TimeDim12345] FOREIGN KEY([PTNT_IN_FCLT_TM_SK])
REFERENCES [dbo].[TimeDim] ([TM_OF_DY_SK])
GO
ALTER TABLE [dbo].[SurgicalCaseFact] CHECK CONSTRAINT [SurgicalCaseFact-TimeDim12345]
GO
ALTER TABLE [dbo].[SurgicalCaseFact]  WITH CHECK ADD  CONSTRAINT [SurgicalCaseFact-TimeDim123456] FOREIGN KEY([PTNT_IN_PRE_PRCDR_TM_SK])
REFERENCES [dbo].[TimeDim] ([TM_OF_DY_SK])
GO
ALTER TABLE [dbo].[SurgicalCaseFact] CHECK CONSTRAINT [SurgicalCaseFact-TimeDim123456]
GO
ALTER TABLE [dbo].[SurgicalCaseFact]  WITH CHECK ADD  CONSTRAINT [SurgicalCaseFact-TimeDim1234567] FOREIGN KEY([PTNT_OUT_OF_POST_OP_TM_SK])
REFERENCES [dbo].[TimeDim] ([TM_OF_DY_SK])
GO
ALTER TABLE [dbo].[SurgicalCaseFact] CHECK CONSTRAINT [SurgicalCaseFact-TimeDim1234567]
GO
ALTER TABLE [dbo].[SurgicalCaseFact]  WITH CHECK ADD  CONSTRAINT [SurgicalCaseFact-TimeDim12345678] FOREIGN KEY([POST_OP_CARE_CMPLT_TM_SK])
REFERENCES [dbo].[TimeDim] ([TM_OF_DY_SK])
GO
ALTER TABLE [dbo].[SurgicalCaseFact] CHECK CONSTRAINT [SurgicalCaseFact-TimeDim12345678]
GO
ALTER TABLE [dbo].[SurgicalCaseFact]  WITH CHECK ADD  CONSTRAINT [SurgicalCaseFact-TimeDim123456789] FOREIGN KEY([PTNT_POST_OP_TM_SK])
REFERENCES [dbo].[TimeDim] ([TM_OF_DY_SK])
GO
ALTER TABLE [dbo].[SurgicalCaseFact] CHECK CONSTRAINT [SurgicalCaseFact-TimeDim123456789]
GO
ALTER TABLE [dbo].[SurgicalCaseFact]  WITH CHECK ADD  CONSTRAINT [SurgicalCaseFact-TimeDim12345678910] FOREIGN KEY([PTNT_OUT_OF_PACU_TM_SK])
REFERENCES [dbo].[TimeDim] ([TM_OF_DY_SK])
GO
ALTER TABLE [dbo].[SurgicalCaseFact] CHECK CONSTRAINT [SurgicalCaseFact-TimeDim12345678910]
GO
ALTER TABLE [dbo].[SurgicalCaseFact]  WITH CHECK ADD  CONSTRAINT [SurgicalCaseFact-TimeDim1234567891011] FOREIGN KEY([PACU_CARE_CMPLT_TM_SK])
REFERENCES [dbo].[TimeDim] ([TM_OF_DY_SK])
GO
ALTER TABLE [dbo].[SurgicalCaseFact] CHECK CONSTRAINT [SurgicalCaseFact-TimeDim1234567891011]
GO
ALTER TABLE [dbo].[SurgicalCaseFact]  WITH CHECK ADD  CONSTRAINT [SurgicalCaseFact-TimeDim123456789101112] FOREIGN KEY([ANSTH_STOP_TM_SK])
REFERENCES [dbo].[TimeDim] ([TM_OF_DY_SK])
GO
ALTER TABLE [dbo].[SurgicalCaseFact] CHECK CONSTRAINT [SurgicalCaseFact-TimeDim123456789101112]
GO
ALTER TABLE [dbo].[SurgicalCaseFact]  WITH CHECK ADD  CONSTRAINT [SurgicalCaseFact-TimeDim12345678910111213] FOREIGN KEY([PTNT_IN_PACU_TM_SK])
REFERENCES [dbo].[TimeDim] ([TM_OF_DY_SK])
GO
ALTER TABLE [dbo].[SurgicalCaseFact] CHECK CONSTRAINT [SurgicalCaseFact-TimeDim12345678910111213]
GO
ALTER TABLE [dbo].[SurgicalCaseFact]  WITH CHECK ADD  CONSTRAINT [SurgicalCaseFact-TimeDim1234567891011121314] FOREIGN KEY([RM_CLNUP_CMPLT_TM_SK])
REFERENCES [dbo].[TimeDim] ([TM_OF_DY_SK])
GO
ALTER TABLE [dbo].[SurgicalCaseFact] CHECK CONSTRAINT [SurgicalCaseFact-TimeDim1234567891011121314]
GO
ALTER TABLE [dbo].[SurgicalCaseFact]  WITH CHECK ADD  CONSTRAINT [SurgicalCaseFact-TimeDim123456789101112131415] FOREIGN KEY([RM_CLNUP_STRT_TM_SK])
REFERENCES [dbo].[TimeDim] ([TM_OF_DY_SK])
GO
ALTER TABLE [dbo].[SurgicalCaseFact] CHECK CONSTRAINT [SurgicalCaseFact-TimeDim123456789101112131415]
GO
ALTER TABLE [dbo].[SurgicalCaseFact]  WITH CHECK ADD  CONSTRAINT [SurgicalCaseFact-TimeDim12345678910111213141516] FOREIGN KEY([PTNT_OUT_OF_RM_TM_SK])
REFERENCES [dbo].[TimeDim] ([TM_OF_DY_SK])
GO
ALTER TABLE [dbo].[SurgicalCaseFact] CHECK CONSTRAINT [SurgicalCaseFact-TimeDim12345678910111213141516]
GO
ALTER TABLE [dbo].[SurgicalCaseFact]  WITH CHECK ADD  CONSTRAINT [SurgicalCaseFact-TimeDim1234567891011121314151617] FOREIGN KEY([PRCDR_CMPLT_TM_SK])
REFERENCES [dbo].[TimeDim] ([TM_OF_DY_SK])
GO
ALTER TABLE [dbo].[SurgicalCaseFact] CHECK CONSTRAINT [SurgicalCaseFact-TimeDim1234567891011121314151617]
GO
ALTER TABLE [dbo].[SurgicalCaseFact]  WITH CHECK ADD  CONSTRAINT [SurgicalCaseFact-TimeDim123456789101112131415161718] FOREIGN KEY([PRCDR_STRT_TM_SK])
REFERENCES [dbo].[TimeDim] ([TM_OF_DY_SK])
GO
ALTER TABLE [dbo].[SurgicalCaseFact] CHECK CONSTRAINT [SurgicalCaseFact-TimeDim123456789101112131415161718]
GO
ALTER TABLE [dbo].[SurgicalCaseFact]  WITH CHECK ADD  CONSTRAINT [SurgicalCaseFact-TimeDim12345678910111213141516171819] FOREIGN KEY([ANSTH_RDY_TM_SK])
REFERENCES [dbo].[TimeDim] ([TM_OF_DY_SK])
GO
ALTER TABLE [dbo].[SurgicalCaseFact] CHECK CONSTRAINT [SurgicalCaseFact-TimeDim12345678910111213141516171819]
GO
ALTER TABLE [dbo].[SurgicalCaseFact]  WITH CHECK ADD  CONSTRAINT [SurgicalCaseFact-TimeDim123456789101112131415161718192021] FOREIGN KEY([PTNT_IN_RM_TM_SK])
REFERENCES [dbo].[TimeDim] ([TM_OF_DY_SK])
GO
ALTER TABLE [dbo].[SurgicalCaseFact] CHECK CONSTRAINT [SurgicalCaseFact-TimeDim123456789101112131415161718192021]
GO
ALTER TABLE [dbo].[SurgicalCaseFact]  WITH CHECK ADD  CONSTRAINT [SurgicalCaseFact-TimeDim12345678910111213141516171819202122] FOREIGN KEY([PRE_PRCDR_CMPLT_TM_SK])
REFERENCES [dbo].[TimeDim] ([TM_OF_DY_SK])
GO
ALTER TABLE [dbo].[SurgicalCaseFact] CHECK CONSTRAINT [SurgicalCaseFact-TimeDim12345678910111213141516171819202122]
GO
ALTER TABLE [dbo].[SurgicalCaseFact]  WITH CHECK ADD  CONSTRAINT [SurgicalCaseFact-TimeDim1234567891011121314151617181920212223] FOREIGN KEY([ANSTH_STRT_TM_SK])
REFERENCES [dbo].[TimeDim] ([TM_OF_DY_SK])
GO
ALTER TABLE [dbo].[SurgicalCaseFact] CHECK CONSTRAINT [SurgicalCaseFact-TimeDim1234567891011121314151617181920212223]
GO
ALTER TABLE [dbo].[SurgicalCaseFact]  WITH CHECK ADD  CONSTRAINT [SurgicalCaseFact-TimeDim123456789101112131415161718192021222324] FOREIGN KEY([RM_RDY_TM_SK])
REFERENCES [dbo].[TimeDim] ([TM_OF_DY_SK])
GO
ALTER TABLE [dbo].[SurgicalCaseFact] CHECK CONSTRAINT [SurgicalCaseFact-TimeDim123456789101112131415161718192021222324]
GO
ALTER TABLE [dbo].[SurgicalCaseFact]  WITH CHECK ADD  CONSTRAINT [SurgicalCaseFact-TimeDim12345678910111213141516171819202122232425] FOREIGN KEY([RM_SETUP_STRT_TM_SK])
REFERENCES [dbo].[TimeDim] ([TM_OF_DY_SK])
GO
ALTER TABLE [dbo].[SurgicalCaseFact] CHECK CONSTRAINT [SurgicalCaseFact-TimeDim12345678910111213141516171819202122232425]
GO
