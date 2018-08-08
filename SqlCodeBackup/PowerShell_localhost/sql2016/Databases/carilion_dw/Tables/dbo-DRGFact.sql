SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DRGFact](
	[ENCNT_DRG_SK] [bigint] NOT NULL,
	[PRTY_SQNC] [int] NULL,
	[DRG_CD_SK] [int] NULL,
	[DRG_TYPE_CD] [varchar](255) NULL,
	[ACCT_SK] [bigint] NULL,
	[ENCNT_SK] [bigint] NULL,
	[PTNT_SK] [bigint] NULL,
	[ENCNT_DT] [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DRGFact]  WITH CHECK ADD  CONSTRAINT [DRGFact-DRGDim] FOREIGN KEY([DRG_CD_SK])
REFERENCES [dbo].[DRGDim] ([DRG_CD_SK])
GO
ALTER TABLE [dbo].[DRGFact] CHECK CONSTRAINT [DRGFact-DRGDim]
GO
ALTER TABLE [dbo].[DRGFact]  WITH CHECK ADD  CONSTRAINT [DRGFact-DRGSeqDim] FOREIGN KEY([PRTY_SQNC])
REFERENCES [dbo].[DRGSeqDim] ([PRTY_SQNC])
GO
ALTER TABLE [dbo].[DRGFact] CHECK CONSTRAINT [DRGFact-DRGSeqDim]
GO
ALTER TABLE [dbo].[DRGFact]  WITH CHECK ADD  CONSTRAINT [DRGFact-DRGTypeDim] FOREIGN KEY([DRG_TYPE_CD])
REFERENCES [dbo].[DRGTypeDim] ([DRG_TYPE_CD])
GO
ALTER TABLE [dbo].[DRGFact] CHECK CONSTRAINT [DRGFact-DRGTypeDim]
GO
ALTER TABLE [dbo].[DRGFact]  WITH CHECK ADD  CONSTRAINT [DRGFact-EncounterDim] FOREIGN KEY([ENCNT_SK])
REFERENCES [dbo].[EncounterDim] ([ENCNT_SK])
GO
ALTER TABLE [dbo].[DRGFact] CHECK CONSTRAINT [DRGFact-EncounterDim]
GO
ALTER TABLE [dbo].[DRGFact]  WITH CHECK ADD  CONSTRAINT [DRGFact-PatientDim] FOREIGN KEY([PTNT_SK])
REFERENCES [dbo].[PatientDim] ([PTNT_SK])
GO
ALTER TABLE [dbo].[DRGFact] CHECK CONSTRAINT [DRGFact-PatientDim]
GO
