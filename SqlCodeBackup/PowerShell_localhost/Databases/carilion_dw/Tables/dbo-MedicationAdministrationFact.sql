SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MedicationAdministrationFact](
	[MDCTN_ADMN_FACT_SK] [bigint] NOT NULL,
	[MDCTN_ORDR_SK] [bigint] NULL,
	[PTNT_SK] [bigint] NULL,
	[ENCNT_SK] [bigint] NULL,
	[ADMN_DEPT_SK] [bigint] NULL,
	[ADMN_USR_SK] [bigint] NULL,
	[PRMY_CMPNT_SK] [bigint] NULL,
	[SCND_CMPNT_SK] [bigint] NULL,
	[THRD_CMPNT_SK] [bigint] NULL,
	[FOURTH_CMPNT_SK] [bigint] NULL,
	[FIFTH_CMPNT_SK] [bigint] NULL,
	[ADMN_ACTN_CDS_SK] [int] NULL,
	[SCHED_ADMN_DT] [datetime] NULL,
	[SCHED_ADMN_TS_SK] [bigint] NULL,
	[ADMN_DT] [datetime] NULL,
	[ADMN_TS_SK] [bigint] NULL,
	[CRG_AMT] [numeric](18, 2) NULL,
	[RPRST_COST] [numeric](18, 2) NULL,
	[ACQSTN_COST] [numeric](18, 2) NULL,
	[MDCTN_REQ_SCAN_AT_ADMN_IND] [int] NULL,
	[MDCTN_SCANNED_AT_ADMN_IND] [int] NULL,
	[PTNT_REQ_SCAN_AT_ADMN_IND] [int] NULL,
	[PTNT_SCANNED_AT_ADMN_IND] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[MedicationAdministrationFact]  WITH CHECK ADD  CONSTRAINT [MedicationAdministrationFact-BinaryDim] FOREIGN KEY([MDCTN_REQ_SCAN_AT_ADMN_IND])
REFERENCES [dbo].[BinaryDim] ([Binary_CD])
GO
ALTER TABLE [dbo].[MedicationAdministrationFact] CHECK CONSTRAINT [MedicationAdministrationFact-BinaryDim]
GO
ALTER TABLE [dbo].[MedicationAdministrationFact]  WITH CHECK ADD  CONSTRAINT [MedicationAdministrationFact-BinaryDim1] FOREIGN KEY([MDCTN_SCANNED_AT_ADMN_IND])
REFERENCES [dbo].[BinaryDim] ([Binary_CD])
GO
ALTER TABLE [dbo].[MedicationAdministrationFact] CHECK CONSTRAINT [MedicationAdministrationFact-BinaryDim1]
GO
ALTER TABLE [dbo].[MedicationAdministrationFact]  WITH CHECK ADD  CONSTRAINT [MedicationAdministrationFact-BinaryDim12] FOREIGN KEY([PTNT_REQ_SCAN_AT_ADMN_IND])
REFERENCES [dbo].[BinaryDim] ([Binary_CD])
GO
ALTER TABLE [dbo].[MedicationAdministrationFact] CHECK CONSTRAINT [MedicationAdministrationFact-BinaryDim12]
GO
ALTER TABLE [dbo].[MedicationAdministrationFact]  WITH CHECK ADD  CONSTRAINT [MedicationAdministrationFact-BinaryDim123] FOREIGN KEY([PTNT_SCANNED_AT_ADMN_IND])
REFERENCES [dbo].[BinaryDim] ([Binary_CD])
GO
ALTER TABLE [dbo].[MedicationAdministrationFact] CHECK CONSTRAINT [MedicationAdministrationFact-BinaryDim123]
GO
ALTER TABLE [dbo].[MedicationAdministrationFact]  WITH CHECK ADD  CONSTRAINT [MedicationAdministrationFact-DateDim] FOREIGN KEY([SCHED_ADMN_DT])
REFERENCES [dbo].[DateDim] ([CLNDR_DT])
GO
ALTER TABLE [dbo].[MedicationAdministrationFact] CHECK CONSTRAINT [MedicationAdministrationFact-DateDim]
GO
ALTER TABLE [dbo].[MedicationAdministrationFact]  WITH CHECK ADD  CONSTRAINT [MedicationAdministrationFact-DateDim1] FOREIGN KEY([ADMN_DT])
REFERENCES [dbo].[DateDim] ([CLNDR_DT])
GO
ALTER TABLE [dbo].[MedicationAdministrationFact] CHECK CONSTRAINT [MedicationAdministrationFact-DateDim1]
GO
ALTER TABLE [dbo].[MedicationAdministrationFact]  WITH CHECK ADD  CONSTRAINT [MedicationAdministrationFact-DepartmentDim] FOREIGN KEY([ADMN_DEPT_SK])
REFERENCES [dbo].[DepartmentDim] ([DEPT_SK])
GO
ALTER TABLE [dbo].[MedicationAdministrationFact] CHECK CONSTRAINT [MedicationAdministrationFact-DepartmentDim]
GO
ALTER TABLE [dbo].[MedicationAdministrationFact]  WITH CHECK ADD  CONSTRAINT [MedicationAdministrationFact-EncounterDim] FOREIGN KEY([ENCNT_SK])
REFERENCES [dbo].[EncounterDim] ([ENCNT_SK])
GO
ALTER TABLE [dbo].[MedicationAdministrationFact] CHECK CONSTRAINT [MedicationAdministrationFact-EncounterDim]
GO
ALTER TABLE [dbo].[MedicationAdministrationFact]  WITH CHECK ADD  CONSTRAINT [MedicationAdministrationFact-MedicationAdministrationActionDim] FOREIGN KEY([ADMN_ACTN_CDS_SK])
REFERENCES [dbo].[MedicationAdministrationActionDim] ([ADMN_ACTN_CDS_SK])
GO
ALTER TABLE [dbo].[MedicationAdministrationFact] CHECK CONSTRAINT [MedicationAdministrationFact-MedicationAdministrationActionDim]
GO
ALTER TABLE [dbo].[MedicationAdministrationFact]  WITH CHECK ADD  CONSTRAINT [MedicationAdministrationFact-MedicationDim] FOREIGN KEY([PRMY_CMPNT_SK])
REFERENCES [dbo].[MedicationDim] ([MDCTN_SK])
GO
ALTER TABLE [dbo].[MedicationAdministrationFact] CHECK CONSTRAINT [MedicationAdministrationFact-MedicationDim]
GO
ALTER TABLE [dbo].[MedicationAdministrationFact]  WITH CHECK ADD  CONSTRAINT [MedicationAdministrationFact-MedicationDim1] FOREIGN KEY([SCND_CMPNT_SK])
REFERENCES [dbo].[MedicationDim] ([MDCTN_SK])
GO
ALTER TABLE [dbo].[MedicationAdministrationFact] CHECK CONSTRAINT [MedicationAdministrationFact-MedicationDim1]
GO
ALTER TABLE [dbo].[MedicationAdministrationFact]  WITH CHECK ADD  CONSTRAINT [MedicationAdministrationFact-MedicationDim12] FOREIGN KEY([THRD_CMPNT_SK])
REFERENCES [dbo].[MedicationDim] ([MDCTN_SK])
GO
ALTER TABLE [dbo].[MedicationAdministrationFact] CHECK CONSTRAINT [MedicationAdministrationFact-MedicationDim12]
GO
ALTER TABLE [dbo].[MedicationAdministrationFact]  WITH CHECK ADD  CONSTRAINT [MedicationAdministrationFact-MedicationDim123] FOREIGN KEY([FOURTH_CMPNT_SK])
REFERENCES [dbo].[MedicationDim] ([MDCTN_SK])
GO
ALTER TABLE [dbo].[MedicationAdministrationFact] CHECK CONSTRAINT [MedicationAdministrationFact-MedicationDim123]
GO
ALTER TABLE [dbo].[MedicationAdministrationFact]  WITH CHECK ADD  CONSTRAINT [MedicationAdministrationFact-MedicationDim1234] FOREIGN KEY([FIFTH_CMPNT_SK])
REFERENCES [dbo].[MedicationDim] ([MDCTN_SK])
GO
ALTER TABLE [dbo].[MedicationAdministrationFact] CHECK CONSTRAINT [MedicationAdministrationFact-MedicationDim1234]
GO
ALTER TABLE [dbo].[MedicationAdministrationFact]  WITH CHECK ADD  CONSTRAINT [MedicationAdministrationFact-MedicationOrderDim] FOREIGN KEY([MDCTN_ORDR_SK])
REFERENCES [dbo].[MedicationOrderDim] ([MDCTN_ORDR_SK])
GO
ALTER TABLE [dbo].[MedicationAdministrationFact] CHECK CONSTRAINT [MedicationAdministrationFact-MedicationOrderDim]
GO
ALTER TABLE [dbo].[MedicationAdministrationFact]  WITH CHECK ADD  CONSTRAINT [MedicationAdministrationFact-PatientDim] FOREIGN KEY([PTNT_SK])
REFERENCES [dbo].[PatientDim] ([PTNT_SK])
GO
ALTER TABLE [dbo].[MedicationAdministrationFact] CHECK CONSTRAINT [MedicationAdministrationFact-PatientDim]
GO
ALTER TABLE [dbo].[MedicationAdministrationFact]  WITH CHECK ADD  CONSTRAINT [MedicationAdministrationFact-TimeDim] FOREIGN KEY([SCHED_ADMN_TS_SK])
REFERENCES [dbo].[TimeDim] ([TM_OF_DY_SK])
GO
ALTER TABLE [dbo].[MedicationAdministrationFact] CHECK CONSTRAINT [MedicationAdministrationFact-TimeDim]
GO
ALTER TABLE [dbo].[MedicationAdministrationFact]  WITH CHECK ADD  CONSTRAINT [MedicationAdministrationFact-TimeDim1] FOREIGN KEY([ADMN_TS_SK])
REFERENCES [dbo].[TimeDim] ([TM_OF_DY_SK])
GO
ALTER TABLE [dbo].[MedicationAdministrationFact] CHECK CONSTRAINT [MedicationAdministrationFact-TimeDim1]
GO
ALTER TABLE [dbo].[MedicationAdministrationFact]  WITH CHECK ADD  CONSTRAINT [MedicationAdministrationFact-UserDim] FOREIGN KEY([ADMN_USR_SK])
REFERENCES [dbo].[UserDim] ([USR_SK])
GO
ALTER TABLE [dbo].[MedicationAdministrationFact] CHECK CONSTRAINT [MedicationAdministrationFact-UserDim]
GO
