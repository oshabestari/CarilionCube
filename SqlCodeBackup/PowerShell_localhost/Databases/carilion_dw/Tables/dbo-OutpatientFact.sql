SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OutpatientFact](
	[ENCNT_SK] [bigint] NOT NULL,
	[PTNT_SK] [bigint] NULL,
	[APPT_DT] [datetime] NULL,
	[APPT_LNGTH] [int] NULL,
	[APPT_LNGTH_LOG] [float] NULL,
	[APPT_CRTN_INSTNT_DT] [datetime] NULL,
	[CHCK_IN_INSTNT_DT] [datetime] NULL,
	[CHCK_OUT_INSTNT_DT] [datetime] NULL,
	[ARRVL_INSTNT_DT] [datetime] NULL,
	[SCNDS_WTNG] [int] NULL,
	[SCNDS_WTNG_LOG] [float] NULL,
	[DEPT_SK] [bigint] NULL,
	[RM_INSTNT_DT] [datetime] NULL,
	[SCDS_IN_RM] [int] NULL,
	[SCDS_IN_RM_LOG] [float] NULL,
	[BDY_MSS_IDX] [numeric](18, 2) NULL,
	[BDY_SRFC_AREA] [numeric](18, 2) NULL,
	[SYSTLC] [int] NULL,
	[DISTLC] [int] NULL,
	[TMP_IN_FHRNHT] [float] NULL,
	[PULSE] [int] NULL,
	[RSPRTNS] [int] NULL,
	[PRMY_DIAG_SK] [bigint] NULL,
	[PRMY_VST_PRVDR_KEY] [bigint] NULL,
	[SCND_VST_PRVDR_KEY] [bigint] NULL,
	[THRD_VST_PRVDR_KEY] [bigint] NULL,
	[FRTH_VST_PRVDR_KEY] [bigint] NULL,
	[AGE_YRS_AT_ENCNT] [int] NULL,
	[AGE_YRS_AT_ENCNT_LOG] [float] NULL,
	[AGE_MNTHS_AT_ENCNT] [int] NULL,
	[AGE_DYS_AT_ENCNT] [int] NULL,
	[APPT_CRTN_INSTNT_TS_SK] [bigint] NULL,
	[CHCK_IN_INSTNT_TS_SK] [bigint] NULL,
	[CHCK_OUT_INSTNT_TS_SK] [bigint] NULL,
	[ARRVL_INSTNT_TS_SK] [bigint] NULL,
	[RM_INSTNT_TS_SK] [bigint] NULL,
	[APPT_TS_SK] [bigint] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[OutpatientFact]  WITH CHECK ADD  CONSTRAINT [OutpatientFact-DateDim] FOREIGN KEY([APPT_DT])
REFERENCES [dbo].[DateDim] ([CLNDR_DT])
GO
ALTER TABLE [dbo].[OutpatientFact] CHECK CONSTRAINT [OutpatientFact-DateDim]
GO
ALTER TABLE [dbo].[OutpatientFact]  WITH CHECK ADD  CONSTRAINT [OutpatientFact-DateDim1] FOREIGN KEY([APPT_CRTN_INSTNT_DT])
REFERENCES [dbo].[DateDim] ([CLNDR_DT])
GO
ALTER TABLE [dbo].[OutpatientFact] CHECK CONSTRAINT [OutpatientFact-DateDim1]
GO
ALTER TABLE [dbo].[OutpatientFact]  WITH CHECK ADD  CONSTRAINT [OutpatientFact-DateDim2] FOREIGN KEY([CHCK_IN_INSTNT_DT])
REFERENCES [dbo].[DateDim] ([CLNDR_DT])
GO
ALTER TABLE [dbo].[OutpatientFact] CHECK CONSTRAINT [OutpatientFact-DateDim2]
GO
ALTER TABLE [dbo].[OutpatientFact]  WITH CHECK ADD  CONSTRAINT [OutpatientFact-DateDim3] FOREIGN KEY([CHCK_OUT_INSTNT_DT])
REFERENCES [dbo].[DateDim] ([CLNDR_DT])
GO
ALTER TABLE [dbo].[OutpatientFact] CHECK CONSTRAINT [OutpatientFact-DateDim3]
GO
ALTER TABLE [dbo].[OutpatientFact]  WITH CHECK ADD  CONSTRAINT [OutpatientFact-DateDim4] FOREIGN KEY([ARRVL_INSTNT_DT])
REFERENCES [dbo].[DateDim] ([CLNDR_DT])
GO
ALTER TABLE [dbo].[OutpatientFact] CHECK CONSTRAINT [OutpatientFact-DateDim4]
GO
ALTER TABLE [dbo].[OutpatientFact]  WITH CHECK ADD  CONSTRAINT [OutpatientFact-DateDim5] FOREIGN KEY([RM_INSTNT_DT])
REFERENCES [dbo].[DateDim] ([CLNDR_DT])
GO
ALTER TABLE [dbo].[OutpatientFact] CHECK CONSTRAINT [OutpatientFact-DateDim5]
GO
ALTER TABLE [dbo].[OutpatientFact]  WITH CHECK ADD  CONSTRAINT [OutpatientFact-EncounterFact] FOREIGN KEY([ENCNT_SK])
REFERENCES [dbo].[EncounterFact] ([ENCNT_FACT_SK])
GO
ALTER TABLE [dbo].[OutpatientFact] CHECK CONSTRAINT [OutpatientFact-EncounterFact]
GO
ALTER TABLE [dbo].[OutpatientFact]  WITH CHECK ADD  CONSTRAINT [OutpatientFact-OutpatientDim] FOREIGN KEY([ENCNT_SK])
REFERENCES [dbo].[OutpatientDim] ([ENCNT_SK])
GO
ALTER TABLE [dbo].[OutpatientFact] CHECK CONSTRAINT [OutpatientFact-OutpatientDim]
GO
ALTER TABLE [dbo].[OutpatientFact]  WITH CHECK ADD  CONSTRAINT [OutpatientFact-PatientDim] FOREIGN KEY([PTNT_SK])
REFERENCES [dbo].[PatientDim] ([PTNT_SK])
GO
ALTER TABLE [dbo].[OutpatientFact] CHECK CONSTRAINT [OutpatientFact-PatientDim]
GO
ALTER TABLE [dbo].[OutpatientFact]  WITH CHECK ADD  CONSTRAINT [OutpatientFact-ProviderDim] FOREIGN KEY([PRMY_VST_PRVDR_KEY])
REFERENCES [dbo].[ProviderDim] ([PROVDR_SK])
GO
ALTER TABLE [dbo].[OutpatientFact] CHECK CONSTRAINT [OutpatientFact-ProviderDim]
GO
ALTER TABLE [dbo].[OutpatientFact]  WITH CHECK ADD  CONSTRAINT [OutpatientFact-ProviderDim1] FOREIGN KEY([SCND_VST_PRVDR_KEY])
REFERENCES [dbo].[ProviderDim] ([PROVDR_SK])
GO
ALTER TABLE [dbo].[OutpatientFact] CHECK CONSTRAINT [OutpatientFact-ProviderDim1]
GO
ALTER TABLE [dbo].[OutpatientFact]  WITH CHECK ADD  CONSTRAINT [OutpatientFact-ProviderDim12] FOREIGN KEY([THRD_VST_PRVDR_KEY])
REFERENCES [dbo].[ProviderDim] ([PROVDR_SK])
GO
ALTER TABLE [dbo].[OutpatientFact] CHECK CONSTRAINT [OutpatientFact-ProviderDim12]
GO
ALTER TABLE [dbo].[OutpatientFact]  WITH CHECK ADD  CONSTRAINT [OutpatientFact-ProviderDim123] FOREIGN KEY([FRTH_VST_PRVDR_KEY])
REFERENCES [dbo].[ProviderDim] ([PROVDR_SK])
GO
ALTER TABLE [dbo].[OutpatientFact] CHECK CONSTRAINT [OutpatientFact-ProviderDim123]
GO
ALTER TABLE [dbo].[OutpatientFact]  WITH CHECK ADD  CONSTRAINT [OutpatientFact-TimeDim] FOREIGN KEY([APPT_CRTN_INSTNT_TS_SK])
REFERENCES [dbo].[TimeDim] ([TM_OF_DY_SK])
GO
ALTER TABLE [dbo].[OutpatientFact] CHECK CONSTRAINT [OutpatientFact-TimeDim]
GO
ALTER TABLE [dbo].[OutpatientFact]  WITH CHECK ADD  CONSTRAINT [OutpatientFact-TimeDim1] FOREIGN KEY([CHCK_IN_INSTNT_TS_SK])
REFERENCES [dbo].[TimeDim] ([TM_OF_DY_SK])
GO
ALTER TABLE [dbo].[OutpatientFact] CHECK CONSTRAINT [OutpatientFact-TimeDim1]
GO
ALTER TABLE [dbo].[OutpatientFact]  WITH CHECK ADD  CONSTRAINT [OutpatientFact-TimeDim12] FOREIGN KEY([APPT_TS_SK])
REFERENCES [dbo].[TimeDim] ([TM_OF_DY_SK])
GO
ALTER TABLE [dbo].[OutpatientFact] CHECK CONSTRAINT [OutpatientFact-TimeDim12]
GO
ALTER TABLE [dbo].[OutpatientFact]  WITH CHECK ADD  CONSTRAINT [OutpatientFact-TimeDim2] FOREIGN KEY([CHCK_OUT_INSTNT_TS_SK])
REFERENCES [dbo].[TimeDim] ([TM_OF_DY_SK])
GO
ALTER TABLE [dbo].[OutpatientFact] CHECK CONSTRAINT [OutpatientFact-TimeDim2]
GO
ALTER TABLE [dbo].[OutpatientFact]  WITH CHECK ADD  CONSTRAINT [OutpatientFact-TimeDim3] FOREIGN KEY([ARRVL_INSTNT_TS_SK])
REFERENCES [dbo].[TimeDim] ([TM_OF_DY_SK])
GO
ALTER TABLE [dbo].[OutpatientFact] CHECK CONSTRAINT [OutpatientFact-TimeDim3]
GO
ALTER TABLE [dbo].[OutpatientFact]  WITH CHECK ADD  CONSTRAINT [OutpatientFact-TimeDim4] FOREIGN KEY([RM_INSTNT_TS_SK])
REFERENCES [dbo].[TimeDim] ([TM_OF_DY_SK])
GO
ALTER TABLE [dbo].[OutpatientFact] CHECK CONSTRAINT [OutpatientFact-TimeDim4]
GO
