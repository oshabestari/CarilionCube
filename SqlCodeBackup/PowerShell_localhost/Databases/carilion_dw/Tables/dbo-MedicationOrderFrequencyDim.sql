SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MedicationOrderFrequencyDim](
	[FREQ_CDS] [int] NOT NULL,
	[FREQ_DESC] [varchar](255) NULL
) ON [PRIMARY]
GO
