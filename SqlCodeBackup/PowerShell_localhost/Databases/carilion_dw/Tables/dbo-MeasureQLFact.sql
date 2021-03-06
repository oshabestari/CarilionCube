SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MeasureQLFact](
	[Data_ID] [int] NOT NULL,
	[Measure_Dim_ID] [int] NULL,
	[Meaure_Quarter] [int] NULL,
	[Result] [numeric](18, 2) NULL,
	[LO_CDS] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[MeasureQLFact]  WITH CHECK ADD  CONSTRAINT [MeasureQLFact-MeasureDim] FOREIGN KEY([Measure_Dim_ID])
REFERENCES [dbo].[MeasureDim] ([Measure_Dim_ID])
GO
ALTER TABLE [dbo].[MeasureQLFact] CHECK CONSTRAINT [MeasureQLFact-MeasureDim]
GO
