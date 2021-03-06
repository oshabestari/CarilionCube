SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProcedureOrderFact](
	[PRCDR_ORDR_FACT_SK] [bigint] NOT NULL,
	[ENCNT_SK] [bigint] NULL,
	[PTNT_SK] [bigint] NULL,
	[PRCDR_CD_SK] [bigint] NULL,
	[ORDRD_BY_USR_SK] [bigint] NULL,
	[ORDRD_BY_PROVDR_SK] [bigint] NULL,
	[AUTH_BY_PROVDR_SK] [bigint] NULL,
	[ORDRD_DT] [datetime] NULL,
	[ORDR_TYP_CD] [int] NULL,
	[ORDR_CLSS_CD] [int] NULL,
	[ORDR_MODE_CD] [int] NULL,
	[ORDR_SRC_CD] [int] NULL,
	[ORDR_STS_CD] [int] NULL,
	[ORDR_PRTY_CD] [int] NULL,
	[STNDNG_STS_CD] [varchar](1) NULL,
	[ORDR_SET_CD] [bigint] NULL,
	[CPOE_IND] [int] NULL,
	[REQR_COSIG_IND] [int] NULL,
	[COSIG_IND] [int] NULL,
	[VRBL_SGN_IND] [int] NULL,
	[ORDRD_TS_SK] [bigint] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ProcedureOrderFact]  WITH CHECK ADD  CONSTRAINT [ProcedureOrderFact-BinaryDim] FOREIGN KEY([CPOE_IND])
REFERENCES [dbo].[BinaryDim] ([Binary_CD])
GO
ALTER TABLE [dbo].[ProcedureOrderFact] CHECK CONSTRAINT [ProcedureOrderFact-BinaryDim]
GO
ALTER TABLE [dbo].[ProcedureOrderFact]  WITH CHECK ADD  CONSTRAINT [ProcedureOrderFact-BinaryDim1] FOREIGN KEY([REQR_COSIG_IND])
REFERENCES [dbo].[BinaryDim] ([Binary_CD])
GO
ALTER TABLE [dbo].[ProcedureOrderFact] CHECK CONSTRAINT [ProcedureOrderFact-BinaryDim1]
GO
ALTER TABLE [dbo].[ProcedureOrderFact]  WITH CHECK ADD  CONSTRAINT [ProcedureOrderFact-BinaryDim2] FOREIGN KEY([COSIG_IND])
REFERENCES [dbo].[BinaryDim] ([Binary_CD])
GO
ALTER TABLE [dbo].[ProcedureOrderFact] CHECK CONSTRAINT [ProcedureOrderFact-BinaryDim2]
GO
ALTER TABLE [dbo].[ProcedureOrderFact]  WITH CHECK ADD  CONSTRAINT [ProcedureOrderFact-BinaryDim3] FOREIGN KEY([VRBL_SGN_IND])
REFERENCES [dbo].[BinaryDim] ([Binary_CD])
GO
ALTER TABLE [dbo].[ProcedureOrderFact] CHECK CONSTRAINT [ProcedureOrderFact-BinaryDim3]
GO
ALTER TABLE [dbo].[ProcedureOrderFact]  WITH CHECK ADD  CONSTRAINT [ProcedureOrderFact-DateDim] FOREIGN KEY([ORDRD_DT])
REFERENCES [dbo].[DateDim] ([CLNDR_DT])
GO
ALTER TABLE [dbo].[ProcedureOrderFact] CHECK CONSTRAINT [ProcedureOrderFact-DateDim]
GO
ALTER TABLE [dbo].[ProcedureOrderFact]  WITH CHECK ADD  CONSTRAINT [ProcedureOrderFact-EncounterDim] FOREIGN KEY([ENCNT_SK])
REFERENCES [dbo].[EncounterDim] ([ENCNT_SK])
GO
ALTER TABLE [dbo].[ProcedureOrderFact] CHECK CONSTRAINT [ProcedureOrderFact-EncounterDim]
GO
ALTER TABLE [dbo].[ProcedureOrderFact]  WITH CHECK ADD  CONSTRAINT [ProcedureOrderFact-PatientDim] FOREIGN KEY([PTNT_SK])
REFERENCES [dbo].[PatientDim] ([PTNT_SK])
GO
ALTER TABLE [dbo].[ProcedureOrderFact] CHECK CONSTRAINT [ProcedureOrderFact-PatientDim]
GO
ALTER TABLE [dbo].[ProcedureOrderFact]  WITH CHECK ADD  CONSTRAINT [ProcedureOrderFact-ProcedureDim] FOREIGN KEY([PRCDR_CD_SK])
REFERENCES [dbo].[ProcedureDim] ([PRCDR_CD_SK])
GO
ALTER TABLE [dbo].[ProcedureOrderFact] CHECK CONSTRAINT [ProcedureOrderFact-ProcedureDim]
GO
ALTER TABLE [dbo].[ProcedureOrderFact]  WITH CHECK ADD  CONSTRAINT [ProcedureOrderFact-ProcedureOrderClassDim] FOREIGN KEY([ORDR_CLSS_CD])
REFERENCES [dbo].[ProcedureOrderClassDim] ([ORDR_CLSS_CD])
GO
ALTER TABLE [dbo].[ProcedureOrderFact] CHECK CONSTRAINT [ProcedureOrderFact-ProcedureOrderClassDim]
GO
ALTER TABLE [dbo].[ProcedureOrderFact]  WITH CHECK ADD  CONSTRAINT [ProcedureOrderFact-ProcedureOrderModeDim] FOREIGN KEY([ORDR_MODE_CD])
REFERENCES [dbo].[ProcedureOrderModeDim] ([ORDR_MODE_CD])
GO
ALTER TABLE [dbo].[ProcedureOrderFact] CHECK CONSTRAINT [ProcedureOrderFact-ProcedureOrderModeDim]
GO
ALTER TABLE [dbo].[ProcedureOrderFact]  WITH CHECK ADD  CONSTRAINT [ProcedureOrderFact-ProcedureOrderPriorityDim] FOREIGN KEY([ORDR_PRTY_CD])
REFERENCES [dbo].[ProcedureOrderPriorityDim] ([ORDR_PRTY_CD])
GO
ALTER TABLE [dbo].[ProcedureOrderFact] CHECK CONSTRAINT [ProcedureOrderFact-ProcedureOrderPriorityDim]
GO
ALTER TABLE [dbo].[ProcedureOrderFact]  WITH CHECK ADD  CONSTRAINT [ProcedureOrderFact-ProcedureOrderSetDm] FOREIGN KEY([ORDR_SET_CD])
REFERENCES [dbo].[ProcedureOrderSetDm] ([ORDR_SET_CD])
GO
ALTER TABLE [dbo].[ProcedureOrderFact] CHECK CONSTRAINT [ProcedureOrderFact-ProcedureOrderSetDm]
GO
ALTER TABLE [dbo].[ProcedureOrderFact]  WITH CHECK ADD  CONSTRAINT [ProcedureOrderFact-ProcedureOrderSourceDim] FOREIGN KEY([ORDR_SRC_CD])
REFERENCES [dbo].[ProcedureOrderSourceDim] ([ORDR_SRC_CD])
GO
ALTER TABLE [dbo].[ProcedureOrderFact] CHECK CONSTRAINT [ProcedureOrderFact-ProcedureOrderSourceDim]
GO
ALTER TABLE [dbo].[ProcedureOrderFact]  WITH CHECK ADD  CONSTRAINT [ProcedureOrderFact-ProcedureOrderStandingStatusDim] FOREIGN KEY([STNDNG_STS_CD])
REFERENCES [dbo].[ProcedureOrderStandingStatusDim] ([STNDNG_STS_CD])
GO
ALTER TABLE [dbo].[ProcedureOrderFact] CHECK CONSTRAINT [ProcedureOrderFact-ProcedureOrderStandingStatusDim]
GO
ALTER TABLE [dbo].[ProcedureOrderFact]  WITH CHECK ADD  CONSTRAINT [ProcedureOrderFact-ProcedureOrderStatusDim] FOREIGN KEY([ORDR_STS_CD])
REFERENCES [dbo].[ProcedureOrderStatusDim] ([ORDR_STS_CD])
GO
ALTER TABLE [dbo].[ProcedureOrderFact] CHECK CONSTRAINT [ProcedureOrderFact-ProcedureOrderStatusDim]
GO
ALTER TABLE [dbo].[ProcedureOrderFact]  WITH CHECK ADD  CONSTRAINT [ProcedureOrderFact-ProcedureOrderTypeDim] FOREIGN KEY([ORDR_TYP_CD])
REFERENCES [dbo].[ProcedureOrderTypeDim] ([ORDR_TYP_CD])
GO
ALTER TABLE [dbo].[ProcedureOrderFact] CHECK CONSTRAINT [ProcedureOrderFact-ProcedureOrderTypeDim]
GO
ALTER TABLE [dbo].[ProcedureOrderFact]  WITH CHECK ADD  CONSTRAINT [ProcedureOrderFact-ProviderDim] FOREIGN KEY([ORDRD_BY_PROVDR_SK])
REFERENCES [dbo].[ProviderDim] ([PROVDR_SK])
GO
ALTER TABLE [dbo].[ProcedureOrderFact] CHECK CONSTRAINT [ProcedureOrderFact-ProviderDim]
GO
ALTER TABLE [dbo].[ProcedureOrderFact]  WITH CHECK ADD  CONSTRAINT [ProcedureOrderFact-ProviderDim1] FOREIGN KEY([AUTH_BY_PROVDR_SK])
REFERENCES [dbo].[ProviderDim] ([PROVDR_SK])
GO
ALTER TABLE [dbo].[ProcedureOrderFact] CHECK CONSTRAINT [ProcedureOrderFact-ProviderDim1]
GO
ALTER TABLE [dbo].[ProcedureOrderFact]  WITH CHECK ADD  CONSTRAINT [ProcedureOrderFact-TimeDim] FOREIGN KEY([ORDRD_TS_SK])
REFERENCES [dbo].[TimeDim] ([TM_OF_DY_SK])
GO
ALTER TABLE [dbo].[ProcedureOrderFact] CHECK CONSTRAINT [ProcedureOrderFact-TimeDim]
GO
ALTER TABLE [dbo].[ProcedureOrderFact]  WITH CHECK ADD  CONSTRAINT [ProcedureOrderFact-UserDim] FOREIGN KEY([ORDRD_BY_USR_SK])
REFERENCES [dbo].[UserDim] ([USR_SK])
GO
ALTER TABLE [dbo].[ProcedureOrderFact] CHECK CONSTRAINT [ProcedureOrderFact-UserDim]
GO
