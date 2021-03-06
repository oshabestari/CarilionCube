SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc dbo.usp_MeasureGenerator__GenerateAll
as


truncate table dbo.tblGeneratedMeasures


exec [dbo].[usp_MeasureGenerator_DifferenceFromSamePeriodPreviousYear]
exec [dbo].[usp_MeasureGenerator_DifferenceFromSamePeriodPreviousYear_UsingScope]
exec [dbo].[usp_MeasureGenerator_GrowthFromSamePeriodPreviousYear]
exec [dbo].[usp_MeasureGenerator_GrowthFromSamePeriodPreviousYear_UsingScope]
exec [dbo].[usp_MeasureGenerator_PercentageOfTotal]
exec [dbo].[usp_MeasureGenerator_PercentRank]
exec [dbo].[usp_MeasureGenerator_Rank]

GO
