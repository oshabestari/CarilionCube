SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LabComponentResultFact](
	[CMPNT_RSLT_FACT_SK] [bigint] NULL,
	[SRC_CMPNT_RSLT_ID] [varchar](255) NULL,
	[LAB_TST_SK] [bigint] NULL,
	[PTNT_SK] [bigint] NULL,
	[AUTH_PROVDR_SK] [bigint] NULL,
	[PRCDR_CD_SK] [bigint] NULL,
	[ENCNT_SK] [bigint] NULL,
	[RSULT_LAB_SK] [bigint] NULL,
	[LAB_CMPNT_SK] [bigint] NULL,
	[RSLT_FLG_CD_SK] [bigint] NULL,
	[LAB_STS_CD_SK] [bigint] NULL,
	[ORDRD_DT] [datetime] NULL,
	[ORDRD_TS_SK] [bigint] NULL,
	[CLCT_TS_SK] [bigint] NULL,
	[CLCT_DT] [datetime] NULL,
	[RSLT_DT] [datetime] NULL,
	[RSLT_TS_SK] [bigint] NULL,
	[RSLT_VAL_INTG] [int] NULL,
	[RSLT_VAL_FLT] [numeric](18, 2) NULL,
	[RSLT_VAL_TXT] [varchar](1024) NULL,
	[REF_UNT] [varchar](255) NULL,
	[REF_NRML_VAL] [varchar](255) NULL,
	[REFN_LOW_VAL] [varchar](255) NULL,
	[REFN_HI_VAL] [varchar](255) NULL,
	[ABNRML_IND] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[LabComponentResultFact]  WITH CHECK ADD  CONSTRAINT [LabComponentResultFact-DateDim] FOREIGN KEY([ORDRD_DT])
REFERENCES [dbo].[DateDim] ([CLNDR_DT])
GO
ALTER TABLE [dbo].[LabComponentResultFact] CHECK CONSTRAINT [LabComponentResultFact-DateDim]
GO
ALTER TABLE [dbo].[LabComponentResultFact]  WITH CHECK ADD  CONSTRAINT [LabComponentResultFact-DateDim1] FOREIGN KEY([CLCT_DT])
REFERENCES [dbo].[DateDim] ([CLNDR_DT])
GO
ALTER TABLE [dbo].[LabComponentResultFact] CHECK CONSTRAINT [LabComponentResultFact-DateDim1]
GO
ALTER TABLE [dbo].[LabComponentResultFact]  WITH CHECK ADD  CONSTRAINT [LabComponentResultFact-DateDim12] FOREIGN KEY([RSLT_DT])
REFERENCES [dbo].[DateDim] ([CLNDR_DT])
GO
ALTER TABLE [dbo].[LabComponentResultFact] CHECK CONSTRAINT [LabComponentResultFact-DateDim12]
GO
ALTER TABLE [dbo].[LabComponentResultFact]  WITH CHECK ADD  CONSTRAINT [LabComponentResultFact-EncounterDim] FOREIGN KEY([ENCNT_SK])
REFERENCES [dbo].[EncounterDim] ([ENCNT_SK])
GO
ALTER TABLE [dbo].[LabComponentResultFact] CHECK CONSTRAINT [LabComponentResultFact-EncounterDim]
GO
ALTER TABLE [dbo].[LabComponentResultFact]  WITH CHECK ADD  CONSTRAINT [LabComponentResultFact-LabComponentDim] FOREIGN KEY([LAB_CMPNT_SK])
REFERENCES [dbo].[LabComponentDim] ([CMPNT_SK])
GO
ALTER TABLE [dbo].[LabComponentResultFact] CHECK CONSTRAINT [LabComponentResultFact-LabComponentDim]
GO
ALTER TABLE [dbo].[LabComponentResultFact]  WITH CHECK ADD  CONSTRAINT [LabComponentResultFact-LabComponentResultFactLabStatusDim] FOREIGN KEY([LAB_STS_CD_SK])
REFERENCES [dbo].[LabComponentResultFactLabStatusDim] ([LAB_STS_CD_SK])
GO
ALTER TABLE [dbo].[LabComponentResultFact] CHECK CONSTRAINT [LabComponentResultFact-LabComponentResultFactLabStatusDim]
GO
ALTER TABLE [dbo].[LabComponentResultFact]  WITH CHECK ADD  CONSTRAINT [LabComponentResultFact-LabComponentResultFactResultFlagDim] FOREIGN KEY([RSLT_FLG_CD_SK])
REFERENCES [dbo].[LabComponentResultFactResultFlagDim] ([RSLT_FLG_CD_SK])
GO
ALTER TABLE [dbo].[LabComponentResultFact] CHECK CONSTRAINT [LabComponentResultFact-LabComponentResultFactResultFlagDim]
GO
ALTER TABLE [dbo].[LabComponentResultFact]  WITH CHECK ADD  CONSTRAINT [LabComponentResultFact-LabDim] FOREIGN KEY([RSULT_LAB_SK])
REFERENCES [dbo].[LabDim] ([LAB_SK])
GO
ALTER TABLE [dbo].[LabComponentResultFact] CHECK CONSTRAINT [LabComponentResultFact-LabDim]
GO
ALTER TABLE [dbo].[LabComponentResultFact]  WITH CHECK ADD  CONSTRAINT [LabComponentResultFact-LabTestDim] FOREIGN KEY([LAB_TST_SK])
REFERENCES [dbo].[LabTestDim] ([LAB_TST_SK])
GO
ALTER TABLE [dbo].[LabComponentResultFact] CHECK CONSTRAINT [LabComponentResultFact-LabTestDim]
GO
ALTER TABLE [dbo].[LabComponentResultFact]  WITH CHECK ADD  CONSTRAINT [LabComponentResultFact-PatientDim] FOREIGN KEY([PTNT_SK])
REFERENCES [dbo].[PatientDim] ([PTNT_SK])
GO
ALTER TABLE [dbo].[LabComponentResultFact] CHECK CONSTRAINT [LabComponentResultFact-PatientDim]
GO
ALTER TABLE [dbo].[LabComponentResultFact]  WITH CHECK ADD  CONSTRAINT [LabComponentResultFact-ProcedureDim] FOREIGN KEY([PRCDR_CD_SK])
REFERENCES [dbo].[ProcedureDim] ([PRCDR_CD_SK])
GO
ALTER TABLE [dbo].[LabComponentResultFact] CHECK CONSTRAINT [LabComponentResultFact-ProcedureDim]
GO
ALTER TABLE [dbo].[LabComponentResultFact]  WITH CHECK ADD  CONSTRAINT [LabComponentResultFact-ProviderDim] FOREIGN KEY([AUTH_PROVDR_SK])
REFERENCES [dbo].[ProviderDim] ([PROVDR_SK])
GO
ALTER TABLE [dbo].[LabComponentResultFact] CHECK CONSTRAINT [LabComponentResultFact-ProviderDim]
GO
ALTER TABLE [dbo].[LabComponentResultFact]  WITH CHECK ADD  CONSTRAINT [LabComponentResultFact-TimeDim] FOREIGN KEY([ORDRD_TS_SK])
REFERENCES [dbo].[TimeDim] ([TM_OF_DY_SK])
GO
ALTER TABLE [dbo].[LabComponentResultFact] CHECK CONSTRAINT [LabComponentResultFact-TimeDim]
GO
ALTER TABLE [dbo].[LabComponentResultFact]  WITH CHECK ADD  CONSTRAINT [LabComponentResultFact-TimeDim1] FOREIGN KEY([CLCT_TS_SK])
REFERENCES [dbo].[TimeDim] ([TM_OF_DY_SK])
GO
ALTER TABLE [dbo].[LabComponentResultFact] CHECK CONSTRAINT [LabComponentResultFact-TimeDim1]
GO
ALTER TABLE [dbo].[LabComponentResultFact]  WITH CHECK ADD  CONSTRAINT [LabComponentResultFact-TimeDim12] FOREIGN KEY([RSLT_TS_SK])
REFERENCES [dbo].[TimeDim] ([TM_OF_DY_SK])
GO
ALTER TABLE [dbo].[LabComponentResultFact] CHECK CONSTRAINT [LabComponentResultFact-TimeDim12]
GO
