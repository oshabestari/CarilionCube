SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DiagnosisFact](
	[DIAG_SK] [bigint] NOT NULL,
	[SRC_DIAG_SQNC] [int] NULL,
	[DIAG_CD_SK] [int] NULL,
	[PTNT_SK] [bigint] NULL,
	[ENCNT_SK] [bigint] NULL,
	[DEPT_SK] [bigint] NULL,
	[CHRNC_IND] [int] NULL,
	[PRMY_DIAG_IND] [int] NULL,
	[SCND_DIAG_IND] [int] NULL,
	[ED_DIAG_IND] [int] NULL,
	[DIAG_STRT_DT] [datetime] NULL,
	[DIAG_END_DT] [datetime] NULL,
	[SRC_TYPE] [varchar](50) NULL,
	[PRSNT_ON_ADMT_CD] [int] NULL,
	[DIAG_STRT_TS_SK] [bigint] NULL,
	[DIAG_END_TS_SK] [bigint] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DiagnosisFact]  WITH CHECK ADD  CONSTRAINT [DIAG_FACT-DepartmentDim] FOREIGN KEY([DEPT_SK])
REFERENCES [dbo].[DepartmentDim] ([DEPT_SK])
GO
ALTER TABLE [dbo].[DiagnosisFact] CHECK CONSTRAINT [DIAG_FACT-DepartmentDim]
GO
ALTER TABLE [dbo].[DiagnosisFact]  WITH CHECK ADD  CONSTRAINT [DIAG_FACT-DiagnosisBridge] FOREIGN KEY([DIAG_CD_SK])
REFERENCES [dbo].[DiagnosisBridge] ([DIAG_CD_SK])
GO
ALTER TABLE [dbo].[DiagnosisFact] CHECK CONSTRAINT [DIAG_FACT-DiagnosisBridge]
GO
ALTER TABLE [dbo].[DiagnosisFact]  WITH CHECK ADD  CONSTRAINT [DIAG_FACT-EncounterDim] FOREIGN KEY([ENCNT_SK])
REFERENCES [dbo].[EncounterDim] ([ENCNT_SK])
GO
ALTER TABLE [dbo].[DiagnosisFact] CHECK CONSTRAINT [DIAG_FACT-EncounterDim]
GO
ALTER TABLE [dbo].[DiagnosisFact]  WITH CHECK ADD  CONSTRAINT [DIAG_FACT-PatientDim] FOREIGN KEY([PTNT_SK])
REFERENCES [dbo].[PatientDim] ([PTNT_SK])
GO
ALTER TABLE [dbo].[DiagnosisFact] CHECK CONSTRAINT [DIAG_FACT-PatientDim]
GO
ALTER TABLE [dbo].[DiagnosisFact]  WITH CHECK ADD  CONSTRAINT [DiagnosisFact-BinaryDim] FOREIGN KEY([CHRNC_IND])
REFERENCES [dbo].[BinaryDim] ([Binary_CD])
GO
ALTER TABLE [dbo].[DiagnosisFact] CHECK CONSTRAINT [DiagnosisFact-BinaryDim]
GO
ALTER TABLE [dbo].[DiagnosisFact]  WITH CHECK ADD  CONSTRAINT [DiagnosisFact-BinaryDim1] FOREIGN KEY([PRMY_DIAG_IND])
REFERENCES [dbo].[BinaryDim] ([Binary_CD])
GO
ALTER TABLE [dbo].[DiagnosisFact] CHECK CONSTRAINT [DiagnosisFact-BinaryDim1]
GO
ALTER TABLE [dbo].[DiagnosisFact]  WITH CHECK ADD  CONSTRAINT [DiagnosisFact-BinaryDim2] FOREIGN KEY([SCND_DIAG_IND])
REFERENCES [dbo].[BinaryDim] ([Binary_CD])
GO
ALTER TABLE [dbo].[DiagnosisFact] CHECK CONSTRAINT [DiagnosisFact-BinaryDim2]
GO
ALTER TABLE [dbo].[DiagnosisFact]  WITH CHECK ADD  CONSTRAINT [DiagnosisFact-BinaryDim3] FOREIGN KEY([ED_DIAG_IND])
REFERENCES [dbo].[BinaryDim] ([Binary_CD])
GO
ALTER TABLE [dbo].[DiagnosisFact] CHECK CONSTRAINT [DiagnosisFact-BinaryDim3]
GO
ALTER TABLE [dbo].[DiagnosisFact]  WITH CHECK ADD  CONSTRAINT [DiagnosisFact-DateDim] FOREIGN KEY([DIAG_STRT_DT])
REFERENCES [dbo].[DateDim] ([CLNDR_DT])
GO
ALTER TABLE [dbo].[DiagnosisFact] CHECK CONSTRAINT [DiagnosisFact-DateDim]
GO
ALTER TABLE [dbo].[DiagnosisFact]  WITH CHECK ADD  CONSTRAINT [DiagnosisFact-DateDim1] FOREIGN KEY([DIAG_END_DT])
REFERENCES [dbo].[DateDim] ([CLNDR_DT])
GO
ALTER TABLE [dbo].[DiagnosisFact] CHECK CONSTRAINT [DiagnosisFact-DateDim1]
GO
ALTER TABLE [dbo].[DiagnosisFact]  WITH CHECK ADD  CONSTRAINT [DiagnosisFact-DiagnosisPresentOnAdmitDim] FOREIGN KEY([PRSNT_ON_ADMT_CD])
REFERENCES [dbo].[DiagnosisPresentOnAdmitDim] ([PRSNT_ON_ADMT_CD])
GO
ALTER TABLE [dbo].[DiagnosisFact] CHECK CONSTRAINT [DiagnosisFact-DiagnosisPresentOnAdmitDim]
GO
ALTER TABLE [dbo].[DiagnosisFact]  WITH CHECK ADD  CONSTRAINT [DiagnosisFact-DiagnosisSourceDim] FOREIGN KEY([SRC_TYPE])
REFERENCES [dbo].[DiagnosisSourceDim] ([SRC_TYPE])
GO
ALTER TABLE [dbo].[DiagnosisFact] CHECK CONSTRAINT [DiagnosisFact-DiagnosisSourceDim]
GO
ALTER TABLE [dbo].[DiagnosisFact]  WITH CHECK ADD  CONSTRAINT [DiagnosisFact-TimeDim] FOREIGN KEY([DIAG_STRT_TS_SK])
REFERENCES [dbo].[TimeDim] ([TM_OF_DY_SK])
GO
ALTER TABLE [dbo].[DiagnosisFact] CHECK CONSTRAINT [DiagnosisFact-TimeDim]
GO
ALTER TABLE [dbo].[DiagnosisFact]  WITH CHECK ADD  CONSTRAINT [DiagnosisFact-TimeDim1] FOREIGN KEY([DIAG_END_TS_SK])
REFERENCES [dbo].[TimeDim] ([TM_OF_DY_SK])
GO
ALTER TABLE [dbo].[DiagnosisFact] CHECK CONSTRAINT [DiagnosisFact-TimeDim1]
GO
