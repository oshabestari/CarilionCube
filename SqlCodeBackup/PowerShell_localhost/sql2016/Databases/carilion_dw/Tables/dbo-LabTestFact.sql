SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LabTestFact](
	[LAB_TST_FACT_SK] [bigint] NOT NULL,
	[SRC_TST_ID] [varchar](255) NULL,
	[LAB_TST_SK] [bigint] NULL,
	[PTNT_SK] [bigint] NULL,
	[AUTH_PROVDR_SK] [bigint] NULL,
	[PRCDR_CD_SK] [bigint] NULL,
	[ENCNT_SK] [bigint] NULL,
	[RSULT_LAB_SK] [bigint] NULL,
	[ORDRD_DT] [datetime] NULL,
	[ORDRD_TS_SK] [bigint] NULL,
	[CLCT_USR_SK] [bigint] NULL,
	[CLCT_DEPT_SK] [bigint] NULL,
	[CLCT_DT] [datetime] NULL,
	[CLCT_TS_SK] [bigint] NULL,
	[SCHED_CLCT_DT] [datetime] NULL,
	[SCHED_CLCT_TS_SK] [bigint] NULL,
	[FRST_FNL_VRFY_DT] [datetime] NULL,
	[FRST_FNL_VRFY_USR_SK] [bigint] NULL,
	[FRST_VRFY_DT] [datetime] NULL,
	[FRST_VRFY_USR_SK] [bigint] NULL,
	[LST_FNL_VRFY_DT] [datetime] NULL,
	[LST_FNL_VRFY_USR_SK] [bigint] NULL,
	[LST_VRFY_DT] [datetime] NULL,
	[FRST_CORR_DT] [datetime] NULL,
	[FRST_CORR_USR_SK] [bigint] NULL,
	[LST_CORR_DT] [datetime] NULL,
	[LST_CORR_USR_SK] [bigint] NULL,
	[COLL_TM_MNT] [numeric](18, 2) NULL,
 CONSTRAINT [PK_LabTestFact] PRIMARY KEY CLUSTERED 
(
	[LAB_TST_FACT_SK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[LabTestFact]  WITH CHECK ADD  CONSTRAINT [LabTestFact-DateDim] FOREIGN KEY([SCHED_CLCT_DT])
REFERENCES [dbo].[DateDim] ([CLNDR_DT])
GO
ALTER TABLE [dbo].[LabTestFact] CHECK CONSTRAINT [LabTestFact-DateDim]
GO
ALTER TABLE [dbo].[LabTestFact]  WITH CHECK ADD  CONSTRAINT [LabTestFact-DateDim1] FOREIGN KEY([ORDRD_DT])
REFERENCES [dbo].[DateDim] ([CLNDR_DT])
GO
ALTER TABLE [dbo].[LabTestFact] CHECK CONSTRAINT [LabTestFact-DateDim1]
GO
ALTER TABLE [dbo].[LabTestFact]  WITH CHECK ADD  CONSTRAINT [LabTestFact-DateDim12] FOREIGN KEY([CLCT_DT])
REFERENCES [dbo].[DateDim] ([CLNDR_DT])
GO
ALTER TABLE [dbo].[LabTestFact] CHECK CONSTRAINT [LabTestFact-DateDim12]
GO
ALTER TABLE [dbo].[LabTestFact]  WITH CHECK ADD  CONSTRAINT [LabTestFact-DateDim123] FOREIGN KEY([FRST_FNL_VRFY_DT])
REFERENCES [dbo].[DateDim] ([CLNDR_DT])
GO
ALTER TABLE [dbo].[LabTestFact] CHECK CONSTRAINT [LabTestFact-DateDim123]
GO
ALTER TABLE [dbo].[LabTestFact]  WITH CHECK ADD  CONSTRAINT [LabTestFact-DateDim1234] FOREIGN KEY([FRST_VRFY_DT])
REFERENCES [dbo].[DateDim] ([CLNDR_DT])
GO
ALTER TABLE [dbo].[LabTestFact] CHECK CONSTRAINT [LabTestFact-DateDim1234]
GO
ALTER TABLE [dbo].[LabTestFact]  WITH CHECK ADD  CONSTRAINT [LabTestFact-DateDim12345] FOREIGN KEY([LST_VRFY_DT])
REFERENCES [dbo].[DateDim] ([CLNDR_DT])
GO
ALTER TABLE [dbo].[LabTestFact] CHECK CONSTRAINT [LabTestFact-DateDim12345]
GO
ALTER TABLE [dbo].[LabTestFact]  WITH CHECK ADD  CONSTRAINT [LabTestFact-DateDim123456] FOREIGN KEY([LST_FNL_VRFY_DT])
REFERENCES [dbo].[DateDim] ([CLNDR_DT])
GO
ALTER TABLE [dbo].[LabTestFact] CHECK CONSTRAINT [LabTestFact-DateDim123456]
GO
ALTER TABLE [dbo].[LabTestFact]  WITH CHECK ADD  CONSTRAINT [LabTestFact-DateDim1234567] FOREIGN KEY([LST_CORR_DT])
REFERENCES [dbo].[DateDim] ([CLNDR_DT])
GO
ALTER TABLE [dbo].[LabTestFact] CHECK CONSTRAINT [LabTestFact-DateDim1234567]
GO
ALTER TABLE [dbo].[LabTestFact]  WITH CHECK ADD  CONSTRAINT [LabTestFact-DateDim12345678] FOREIGN KEY([FRST_CORR_DT])
REFERENCES [dbo].[DateDim] ([CLNDR_DT])
GO
ALTER TABLE [dbo].[LabTestFact] CHECK CONSTRAINT [LabTestFact-DateDim12345678]
GO
ALTER TABLE [dbo].[LabTestFact]  WITH CHECK ADD  CONSTRAINT [LabTestFact-DepartmentDim] FOREIGN KEY([CLCT_DEPT_SK])
REFERENCES [dbo].[DepartmentDim] ([DEPT_SK])
GO
ALTER TABLE [dbo].[LabTestFact] CHECK CONSTRAINT [LabTestFact-DepartmentDim]
GO
ALTER TABLE [dbo].[LabTestFact]  WITH CHECK ADD  CONSTRAINT [LabTestFact-EncounterDim] FOREIGN KEY([ENCNT_SK])
REFERENCES [dbo].[EncounterDim] ([ENCNT_SK])
GO
ALTER TABLE [dbo].[LabTestFact] CHECK CONSTRAINT [LabTestFact-EncounterDim]
GO
ALTER TABLE [dbo].[LabTestFact]  WITH CHECK ADD  CONSTRAINT [LabTestFact-LabDim] FOREIGN KEY([RSULT_LAB_SK])
REFERENCES [dbo].[LabDim] ([LAB_SK])
GO
ALTER TABLE [dbo].[LabTestFact] CHECK CONSTRAINT [LabTestFact-LabDim]
GO
ALTER TABLE [dbo].[LabTestFact]  WITH CHECK ADD  CONSTRAINT [LabTestFact-LabTestDim] FOREIGN KEY([LAB_TST_SK])
REFERENCES [dbo].[LabTestDim] ([LAB_TST_SK])
GO
ALTER TABLE [dbo].[LabTestFact] CHECK CONSTRAINT [LabTestFact-LabTestDim]
GO
ALTER TABLE [dbo].[LabTestFact]  WITH CHECK ADD  CONSTRAINT [LabTestFact-PatientDim] FOREIGN KEY([PTNT_SK])
REFERENCES [dbo].[PatientDim] ([PTNT_SK])
GO
ALTER TABLE [dbo].[LabTestFact] CHECK CONSTRAINT [LabTestFact-PatientDim]
GO
ALTER TABLE [dbo].[LabTestFact]  WITH CHECK ADD  CONSTRAINT [LabTestFact-ProcedureDim] FOREIGN KEY([PRCDR_CD_SK])
REFERENCES [dbo].[ProcedureDim] ([PRCDR_CD_SK])
GO
ALTER TABLE [dbo].[LabTestFact] CHECK CONSTRAINT [LabTestFact-ProcedureDim]
GO
ALTER TABLE [dbo].[LabTestFact]  WITH CHECK ADD  CONSTRAINT [LabTestFact-ProviderDim] FOREIGN KEY([AUTH_PROVDR_SK])
REFERENCES [dbo].[ProviderDim] ([PROVDR_SK])
GO
ALTER TABLE [dbo].[LabTestFact] CHECK CONSTRAINT [LabTestFact-ProviderDim]
GO
ALTER TABLE [dbo].[LabTestFact]  WITH CHECK ADD  CONSTRAINT [LabTestFact-TimeDim] FOREIGN KEY([SCHED_CLCT_TS_SK])
REFERENCES [dbo].[TimeDim] ([TM_OF_DY_SK])
GO
ALTER TABLE [dbo].[LabTestFact] CHECK CONSTRAINT [LabTestFact-TimeDim]
GO
ALTER TABLE [dbo].[LabTestFact]  WITH CHECK ADD  CONSTRAINT [LabTestFact-TimeDim1] FOREIGN KEY([ORDRD_TS_SK])
REFERENCES [dbo].[TimeDim] ([TM_OF_DY_SK])
GO
ALTER TABLE [dbo].[LabTestFact] CHECK CONSTRAINT [LabTestFact-TimeDim1]
GO
ALTER TABLE [dbo].[LabTestFact]  WITH CHECK ADD  CONSTRAINT [LabTestFact-TimeDim12] FOREIGN KEY([CLCT_TS_SK])
REFERENCES [dbo].[TimeDim] ([TM_OF_DY_SK])
GO
ALTER TABLE [dbo].[LabTestFact] CHECK CONSTRAINT [LabTestFact-TimeDim12]
GO
ALTER TABLE [dbo].[LabTestFact]  WITH CHECK ADD  CONSTRAINT [LabTestFact-UserDim] FOREIGN KEY([CLCT_USR_SK])
REFERENCES [dbo].[UserDim] ([USR_SK])
GO
ALTER TABLE [dbo].[LabTestFact] CHECK CONSTRAINT [LabTestFact-UserDim]
GO
ALTER TABLE [dbo].[LabTestFact]  WITH CHECK ADD  CONSTRAINT [LabTestFact-UserDim1] FOREIGN KEY([FRST_FNL_VRFY_USR_SK])
REFERENCES [dbo].[UserDim] ([USR_SK])
GO
ALTER TABLE [dbo].[LabTestFact] CHECK CONSTRAINT [LabTestFact-UserDim1]
GO
ALTER TABLE [dbo].[LabTestFact]  WITH CHECK ADD  CONSTRAINT [LabTestFact-UserDim12] FOREIGN KEY([FRST_VRFY_USR_SK])
REFERENCES [dbo].[UserDim] ([USR_SK])
GO
ALTER TABLE [dbo].[LabTestFact] CHECK CONSTRAINT [LabTestFact-UserDim12]
GO
ALTER TABLE [dbo].[LabTestFact]  WITH CHECK ADD  CONSTRAINT [LabTestFact-UserDim123] FOREIGN KEY([FRST_CORR_USR_SK])
REFERENCES [dbo].[UserDim] ([USR_SK])
GO
ALTER TABLE [dbo].[LabTestFact] CHECK CONSTRAINT [LabTestFact-UserDim123]
GO
ALTER TABLE [dbo].[LabTestFact]  WITH CHECK ADD  CONSTRAINT [LabTestFact-UserDim1234] FOREIGN KEY([LST_CORR_USR_SK])
REFERENCES [dbo].[UserDim] ([USR_SK])
GO
ALTER TABLE [dbo].[LabTestFact] CHECK CONSTRAINT [LabTestFact-UserDim1234]
GO
ALTER TABLE [dbo].[LabTestFact]  WITH CHECK ADD  CONSTRAINT [LabTestFact-UserDim12345] FOREIGN KEY([LST_FNL_VRFY_USR_SK])
REFERENCES [dbo].[UserDim] ([USR_SK])
GO
ALTER TABLE [dbo].[LabTestFact] CHECK CONSTRAINT [LabTestFact-UserDim12345]
GO
