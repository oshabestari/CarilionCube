SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MeasureMDFact](
	[Data_ID] [int] NOT NULL,
	[Measure_Dim_ID] [int] NULL,
	[Meaure_Month] [int] NULL,
	[Result] [numeric](18, 2) NULL,
	[SRC_DEPT_ID] [varchar](4000) NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[MeasureMDFact]  WITH CHECK ADD  CONSTRAINT [MeasureMDFact-MeasureDim] FOREIGN KEY([Measure_Dim_ID])
REFERENCES [dbo].[MeasureDim] ([Measure_Dim_ID])
GO
ALTER TABLE [dbo].[MeasureMDFact] CHECK CONSTRAINT [MeasureMDFact-MeasureDim]
GO
