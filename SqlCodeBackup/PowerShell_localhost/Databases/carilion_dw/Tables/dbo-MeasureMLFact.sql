SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MeasureMLFact](
	[Data_ID] [int] NOT NULL,
	[Measure_Dim_ID] [int] NULL,
	[Meaure_Month] [int] NULL,
	[Result] [numeric](18, 2) NULL,
	[LO_CDS] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[MeasureMLFact]  WITH CHECK ADD  CONSTRAINT [MeasureMLFact-MeasureDim] FOREIGN KEY([Measure_Dim_ID])
REFERENCES [dbo].[MeasureDim] ([Measure_Dim_ID])
GO
ALTER TABLE [dbo].[MeasureMLFact] CHECK CONSTRAINT [MeasureMLFact-MeasureDim]
GO
