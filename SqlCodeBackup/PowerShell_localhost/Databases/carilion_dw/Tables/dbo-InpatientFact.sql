SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InpatientFact](
	[SRC_ENCNT_ID] [varchar](255) NULL,
	[ENCNT_SK] [bigint] NULL,
	[AGE_YRS_AT_CLNC_INPTNT_ADMT] [int] NULL,
	[AGE_MNTHS_AT_CLNC_INPTNT_ADMT] [int] NULL,
	[AGE_DYS_AT_CLNC_INPTNT_ADMT] [int] NULL,
	[LOS_DYS_CLNC_INPTNT] [int] NULL,
	[LOS_HRS_CLNC_INPTNT] [int] NULL,
	[INPTNT_APPT_MADE_DT] [datetime] NULL,
	[PRMY_CDD_PRCDR_SK] [varchar](1) NULL,
	[PRMY_CDD_DIAG_SK] [int] NULL,
	[LOS_DYS_EXPCT_INPTNT] [varchar](1) NULL,
	[CLNC_INPTNT_ADMT_DT] [datetime] NULL,
	[PTNT_SK] [bigint] NULL,
	[INPTNT_VST_SK] [bigint] NOT NULL,
	[HSPTL_ADMT_DT] [datetime] NULL,
	[HSPTL_ADMT_TS_SK] [bigint] NULL,
	[HSPTL_DSCRG_DT] [datetime] NULL,
	[HSPTL_DSCRG_TS_SK] [bigint] NULL,
	[AGE_YRS_AT_CLNC_INPTNT_ADMT_LOG] [float] NULL,
	[LOS_DYS_CLNC_INPTNT_LOG] [float] NULL,
	[LOS_HRS_CLNC_INPTNT_LOG] [float] NULL,
	[CLNC_INPTNT_ADMT_TS_SK] [bigint] NULL,
	[HSPTL_ADMT_PROVDR_SK] [bigint] NULL,
	[HSPTL_DSCRG_PROVDR_SK] [bigint] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[InpatientFact]  WITH CHECK ADD  CONSTRAINT [InpatientFact-DateDim] FOREIGN KEY([INPTNT_APPT_MADE_DT])
REFERENCES [dbo].[DateDim] ([CLNDR_DT])
GO
ALTER TABLE [dbo].[InpatientFact] CHECK CONSTRAINT [InpatientFact-DateDim]
GO
ALTER TABLE [dbo].[InpatientFact]  WITH CHECK ADD  CONSTRAINT [InpatientFact-DateDim1] FOREIGN KEY([CLNC_INPTNT_ADMT_DT])
REFERENCES [dbo].[DateDim] ([CLNDR_DT])
GO
ALTER TABLE [dbo].[InpatientFact] CHECK CONSTRAINT [InpatientFact-DateDim1]
GO
ALTER TABLE [dbo].[InpatientFact]  WITH CHECK ADD  CONSTRAINT [InpatientFact-DateDim2] FOREIGN KEY([HSPTL_ADMT_DT])
REFERENCES [dbo].[DateDim] ([CLNDR_DT])
GO
ALTER TABLE [dbo].[InpatientFact] CHECK CONSTRAINT [InpatientFact-DateDim2]
GO
ALTER TABLE [dbo].[InpatientFact]  WITH CHECK ADD  CONSTRAINT [InpatientFact-DateDim3] FOREIGN KEY([HSPTL_DSCRG_DT])
REFERENCES [dbo].[DateDim] ([CLNDR_DT])
GO
ALTER TABLE [dbo].[InpatientFact] CHECK CONSTRAINT [InpatientFact-DateDim3]
GO
ALTER TABLE [dbo].[InpatientFact]  WITH CHECK ADD  CONSTRAINT [InpatientFact-EncounterDim] FOREIGN KEY([ENCNT_SK])
REFERENCES [dbo].[EncounterDim] ([ENCNT_SK])
GO
ALTER TABLE [dbo].[InpatientFact] CHECK CONSTRAINT [InpatientFact-EncounterDim]
GO
ALTER TABLE [dbo].[InpatientFact]  WITH CHECK ADD  CONSTRAINT [InpatientFact-InpatientDim] FOREIGN KEY([INPTNT_VST_SK])
REFERENCES [dbo].[InpatientDim] ([INPTNT_VST_SK])
GO
ALTER TABLE [dbo].[InpatientFact] CHECK CONSTRAINT [InpatientFact-InpatientDim]
GO
ALTER TABLE [dbo].[InpatientFact]  WITH CHECK ADD  CONSTRAINT [InpatientFact-PatientDim] FOREIGN KEY([PTNT_SK])
REFERENCES [dbo].[PatientDim] ([PTNT_SK])
GO
ALTER TABLE [dbo].[InpatientFact] CHECK CONSTRAINT [InpatientFact-PatientDim]
GO
ALTER TABLE [dbo].[InpatientFact]  WITH CHECK ADD  CONSTRAINT [InpatientFact-ProviderDim] FOREIGN KEY([HSPTL_ADMT_PROVDR_SK])
REFERENCES [dbo].[ProviderDim] ([PROVDR_SK])
GO
ALTER TABLE [dbo].[InpatientFact] CHECK CONSTRAINT [InpatientFact-ProviderDim]
GO
ALTER TABLE [dbo].[InpatientFact]  WITH CHECK ADD  CONSTRAINT [InpatientFact-ProviderDim1] FOREIGN KEY([HSPTL_DSCRG_PROVDR_SK])
REFERENCES [dbo].[ProviderDim] ([PROVDR_SK])
GO
ALTER TABLE [dbo].[InpatientFact] CHECK CONSTRAINT [InpatientFact-ProviderDim1]
GO
ALTER TABLE [dbo].[InpatientFact]  WITH CHECK ADD  CONSTRAINT [InpatientFact-TimeDim] FOREIGN KEY([HSPTL_ADMT_TS_SK])
REFERENCES [dbo].[TimeDim] ([TM_OF_DY_SK])
GO
ALTER TABLE [dbo].[InpatientFact] CHECK CONSTRAINT [InpatientFact-TimeDim]
GO
ALTER TABLE [dbo].[InpatientFact]  WITH CHECK ADD  CONSTRAINT [InpatientFact-TimeDim1] FOREIGN KEY([HSPTL_DSCRG_TS_SK])
REFERENCES [dbo].[TimeDim] ([TM_OF_DY_SK])
GO
ALTER TABLE [dbo].[InpatientFact] CHECK CONSTRAINT [InpatientFact-TimeDim1]
GO
ALTER TABLE [dbo].[InpatientFact]  WITH CHECK ADD  CONSTRAINT [InpatientFact-TimeDim12] FOREIGN KEY([CLNC_INPTNT_ADMT_TS_SK])
REFERENCES [dbo].[TimeDim] ([TM_OF_DY_SK])
GO
ALTER TABLE [dbo].[InpatientFact] CHECK CONSTRAINT [InpatientFact-TimeDim12]
GO
