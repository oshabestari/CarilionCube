SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MeasureGroupDim](
	[Measure_Group_Dim_ID] [int] NOT NULL,
	[Measure_Group_ID] [varchar](4000) NULL,
	[Glossary_Link] [varchar](4000) NULL
) ON [PRIMARY]
GO
