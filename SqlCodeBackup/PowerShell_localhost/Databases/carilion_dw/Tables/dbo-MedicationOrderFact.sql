SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MedicationOrderFact](
	[MDCTN_ORDR_FACT_SK] [bigint] NOT NULL,
	[MDCTN_ORDR_SK] [bigint] NULL,
	[PTNT_SK] [bigint] NULL,
	[ENCNT_SK] [bigint] NULL,
	[DEPT_SK] [bigint] NULL,
	[PHRM_SK] [bigint] NULL,
	[MDCTN_SK] [bigint] NULL,
	[ORDRD_BY_USR_SK] [bigint] NULL,
	[ORDRD_BY_PROVDR_SK] [bigint] NULL,
	[AUTH_BY_PROVDR_SK] [bigint] NULL,
	[ORDRD_DT] [datetime] NULL,
	[ORDR_STRT_DT] [datetime] NULL,
	[ORDR_END_DT] [datetime] NULL,
	[ORDR_DSCNTND_DT] [datetime] NULL,
	[QTY] [numeric](18, 2) NULL,
	[MIN_DOSE] [numeric](18, 2) NULL,
	[MAXM_DOSE] [numeric](18, 2) NULL,
	[CLCLTD_MIN_DOSE] [numeric](18, 2) NULL,
	[CLCLTD_MAXM_DOSE] [numeric](18, 2) NULL,
	[NBR_OF_DOSES] [int] NULL,
	[NBR_WRTN_REFILLS] [int] NULL,
	[ORDRD_TS_SK] [bigint] NULL,
	[ORDR_STRT_TS_SK] [bigint] NULL,
	[ORDR_END_TS_SK] [bigint] NULL,
	[DSCNTND_TS_SK] [bigint] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[MedicationOrderFact]  WITH CHECK ADD  CONSTRAINT [MedicationOrderFact-DateDim] FOREIGN KEY([ORDRD_DT])
REFERENCES [dbo].[DateDim] ([CLNDR_DT])
GO
ALTER TABLE [dbo].[MedicationOrderFact] CHECK CONSTRAINT [MedicationOrderFact-DateDim]
GO
ALTER TABLE [dbo].[MedicationOrderFact]  WITH CHECK ADD  CONSTRAINT [MedicationOrderFact-DateDim1] FOREIGN KEY([ORDR_STRT_DT])
REFERENCES [dbo].[DateDim] ([CLNDR_DT])
GO
ALTER TABLE [dbo].[MedicationOrderFact] CHECK CONSTRAINT [MedicationOrderFact-DateDim1]
GO
ALTER TABLE [dbo].[MedicationOrderFact]  WITH CHECK ADD  CONSTRAINT [MedicationOrderFact-DateDim2] FOREIGN KEY([ORDR_END_DT])
REFERENCES [dbo].[DateDim] ([CLNDR_DT])
GO
ALTER TABLE [dbo].[MedicationOrderFact] CHECK CONSTRAINT [MedicationOrderFact-DateDim2]
GO
ALTER TABLE [dbo].[MedicationOrderFact]  WITH CHECK ADD  CONSTRAINT [MedicationOrderFact-DateDim3] FOREIGN KEY([ORDR_DSCNTND_DT])
REFERENCES [dbo].[DateDim] ([CLNDR_DT])
GO
ALTER TABLE [dbo].[MedicationOrderFact] CHECK CONSTRAINT [MedicationOrderFact-DateDim3]
GO
ALTER TABLE [dbo].[MedicationOrderFact]  WITH CHECK ADD  CONSTRAINT [MedicationOrderFact-DepartmentDim] FOREIGN KEY([DEPT_SK])
REFERENCES [dbo].[DepartmentDim] ([DEPT_SK])
GO
ALTER TABLE [dbo].[MedicationOrderFact] CHECK CONSTRAINT [MedicationOrderFact-DepartmentDim]
GO
ALTER TABLE [dbo].[MedicationOrderFact]  WITH CHECK ADD  CONSTRAINT [MedicationOrderFact-EncounterDim] FOREIGN KEY([ENCNT_SK])
REFERENCES [dbo].[EncounterDim] ([ENCNT_SK])
GO
ALTER TABLE [dbo].[MedicationOrderFact] CHECK CONSTRAINT [MedicationOrderFact-EncounterDim]
GO
ALTER TABLE [dbo].[MedicationOrderFact]  WITH CHECK ADD  CONSTRAINT [MedicationOrderFact-MedicationDim] FOREIGN KEY([MDCTN_SK])
REFERENCES [dbo].[MedicationDim] ([MDCTN_SK])
GO
ALTER TABLE [dbo].[MedicationOrderFact] CHECK CONSTRAINT [MedicationOrderFact-MedicationDim]
GO
ALTER TABLE [dbo].[MedicationOrderFact]  WITH CHECK ADD  CONSTRAINT [MedicationOrderFact-MedicationOrderDim] FOREIGN KEY([MDCTN_ORDR_SK])
REFERENCES [dbo].[MedicationOrderDim] ([MDCTN_ORDR_SK])
GO
ALTER TABLE [dbo].[MedicationOrderFact] CHECK CONSTRAINT [MedicationOrderFact-MedicationOrderDim]
GO
ALTER TABLE [dbo].[MedicationOrderFact]  WITH CHECK ADD  CONSTRAINT [MedicationOrderFact-PatientDim] FOREIGN KEY([PTNT_SK])
REFERENCES [dbo].[PatientDim] ([PTNT_SK])
GO
ALTER TABLE [dbo].[MedicationOrderFact] CHECK CONSTRAINT [MedicationOrderFact-PatientDim]
GO
ALTER TABLE [dbo].[MedicationOrderFact]  WITH CHECK ADD  CONSTRAINT [MedicationOrderFact-PharmacyDim] FOREIGN KEY([PHRM_SK])
REFERENCES [dbo].[PharmacyDim] ([PHRM_SK])
GO
ALTER TABLE [dbo].[MedicationOrderFact] CHECK CONSTRAINT [MedicationOrderFact-PharmacyDim]
GO
ALTER TABLE [dbo].[MedicationOrderFact]  WITH CHECK ADD  CONSTRAINT [MedicationOrderFact-ProviderDim] FOREIGN KEY([ORDRD_BY_PROVDR_SK])
REFERENCES [dbo].[ProviderDim] ([PROVDR_SK])
GO
ALTER TABLE [dbo].[MedicationOrderFact] CHECK CONSTRAINT [MedicationOrderFact-ProviderDim]
GO
ALTER TABLE [dbo].[MedicationOrderFact]  WITH CHECK ADD  CONSTRAINT [MedicationOrderFact-ProviderDim1] FOREIGN KEY([AUTH_BY_PROVDR_SK])
REFERENCES [dbo].[ProviderDim] ([PROVDR_SK])
GO
ALTER TABLE [dbo].[MedicationOrderFact] CHECK CONSTRAINT [MedicationOrderFact-ProviderDim1]
GO
ALTER TABLE [dbo].[MedicationOrderFact]  WITH CHECK ADD  CONSTRAINT [MedicationOrderFact-TimeDim] FOREIGN KEY([ORDRD_TS_SK])
REFERENCES [dbo].[TimeDim] ([TM_OF_DY_SK])
GO
ALTER TABLE [dbo].[MedicationOrderFact] CHECK CONSTRAINT [MedicationOrderFact-TimeDim]
GO
ALTER TABLE [dbo].[MedicationOrderFact]  WITH CHECK ADD  CONSTRAINT [MedicationOrderFact-TimeDim1] FOREIGN KEY([ORDR_STRT_TS_SK])
REFERENCES [dbo].[TimeDim] ([TM_OF_DY_SK])
GO
ALTER TABLE [dbo].[MedicationOrderFact] CHECK CONSTRAINT [MedicationOrderFact-TimeDim1]
GO
ALTER TABLE [dbo].[MedicationOrderFact]  WITH CHECK ADD  CONSTRAINT [MedicationOrderFact-TimeDim2] FOREIGN KEY([ORDR_END_TS_SK])
REFERENCES [dbo].[TimeDim] ([TM_OF_DY_SK])
GO
ALTER TABLE [dbo].[MedicationOrderFact] CHECK CONSTRAINT [MedicationOrderFact-TimeDim2]
GO
ALTER TABLE [dbo].[MedicationOrderFact]  WITH CHECK ADD  CONSTRAINT [MedicationOrderFact-TimeDim3] FOREIGN KEY([DSCNTND_TS_SK])
REFERENCES [dbo].[TimeDim] ([TM_OF_DY_SK])
GO
ALTER TABLE [dbo].[MedicationOrderFact] CHECK CONSTRAINT [MedicationOrderFact-TimeDim3]
GO
ALTER TABLE [dbo].[MedicationOrderFact]  WITH CHECK ADD  CONSTRAINT [MedicationOrderFact-UserDim] FOREIGN KEY([ORDRD_BY_USR_SK])
REFERENCES [dbo].[UserDim] ([USR_SK])
GO
ALTER TABLE [dbo].[MedicationOrderFact] CHECK CONSTRAINT [MedicationOrderFact-UserDim]
GO
