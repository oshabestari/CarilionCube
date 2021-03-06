SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MeasureDim](
	[Measure_Dim_ID] [int] IDENTITY(1,1) NOT NULL,
	[Source_ID] [int] NULL,
	[Source_Measure_ID] [int] NULL,
	[Is_Active] [bit] NULL,
	[Measure] [varchar](4000) NULL,
 CONSTRAINT [PK_MeasureDim_Measure_Dim_ID] PRIMARY KEY CLUSTERED 
(
	[Measure_Dim_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[MeasureDim]  WITH CHECK ADD  CONSTRAINT [QualityMeasureDim-QualityMeasureSourceDim] FOREIGN KEY([Source_ID])
REFERENCES [dbo].[MeasureSourceDim] ([Source_ID])
GO
ALTER TABLE [dbo].[MeasureDim] CHECK CONSTRAINT [QualityMeasureDim-QualityMeasureSourceDim]
GO
