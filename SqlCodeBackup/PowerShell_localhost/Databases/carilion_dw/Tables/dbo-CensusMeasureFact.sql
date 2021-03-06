SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CensusMeasureFact](
	[MSR_FACT_SK] [bigint] NOT NULL,
	[MSR_TYPE_SK] [int] NULL,
	[GEO_AREA_SK] [int] NULL,
	[SRC_SK] [int] NULL,
	[MSR_FLT_VAL] [float] NULL,
	[MSR_VAL_SYM] [varchar](20) NULL,
	[MSR_FLT_VAL_LOG] [float] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CensusMeasureFact]  WITH CHECK ADD  CONSTRAINT [CensusMeasureFact-CensusGeographicalAreaDim] FOREIGN KEY([GEO_AREA_SK])
REFERENCES [dbo].[CensusGeographicalAreaDim] ([GEO_AREA_SK])
GO
ALTER TABLE [dbo].[CensusMeasureFact] CHECK CONSTRAINT [CensusMeasureFact-CensusGeographicalAreaDim]
GO
ALTER TABLE [dbo].[CensusMeasureFact]  WITH CHECK ADD  CONSTRAINT [CensusMeasureFact-CensusMeasureTypeDim] FOREIGN KEY([MSR_TYPE_SK])
REFERENCES [dbo].[CensusMeasureTypeDim] ([MSR_TYPE_SK])
GO
ALTER TABLE [dbo].[CensusMeasureFact] CHECK CONSTRAINT [CensusMeasureFact-CensusMeasureTypeDim]
GO
ALTER TABLE [dbo].[CensusMeasureFact]  WITH CHECK ADD  CONSTRAINT [CensusMeasureFact-CensusSourceDim] FOREIGN KEY([SRC_SK])
REFERENCES [dbo].[CensusSourceDim] ([SRC_SK])
GO
ALTER TABLE [dbo].[CensusMeasureFact] CHECK CONSTRAINT [CensusMeasureFact-CensusSourceDim]
GO
