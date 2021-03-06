SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblGeneratedMeasures_Select_DimensionByMeasureGroup](
	[DimensionPerMeasureGroupId] [int] IDENTITY(1,1) NOT NULL,
	[dimension_unique_name] [varchar](max) NOT NULL,
	[measuregroup_name] [varchar](max) NOT NULL,
	[HashCode]  AS (isnull(hashbytes('SHA2_512',concat([measuregroup_name],'@|#',[dimension_unique_name])),(0))) PERSISTED NOT NULL,
 CONSTRAINT [PK_tblGeneratedMeasures_DimensionPerMeasureGroup] PRIMARY KEY CLUSTERED 
(
	[DimensionPerMeasureGroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ARITHABORT ON
SET CONCAT_NULL_YIELDS_NULL ON
SET QUOTED_IDENTIFIER ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
SET NUMERIC_ROUNDABORT OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_tblGeneratedMeasures_DimensionPerMeasureGroup] ON [dbo].[tblGeneratedMeasures_Select_DimensionByMeasureGroup]
(
	[HashCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = ON, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
