SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblGeneratedMeasures](
	[MeasuresId] [int] IDENTITY(1,1) NOT NULL,
	[MeasureName] [varchar](max) NOT NULL,
	[MeasureUniqueName] [varchar](max) NOT NULL,
	[MeasureDefinition] [varchar](max) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsScoped] [bit] NOT NULL,
	[Scoped_IsCreateMeasure] [bit] NOT NULL,
	[Scoped_IsSubcubeExpression] [bit] NOT NULL,
	[GeneratedBy] [varchar](max) NOT NULL,
	[GroupingName] [varchar](max) NOT NULL,
	[GroupingGuid] [uniqueidentifier] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[RowHasBeenModified]  AS (CONVERT([bit],isnull(case when [CreateDate]=[ModifiedDate] then (0) else (1) end,(1)))),
	[RecordVersionTimestamp] [timestamp] NOT NULL,
	[dimension_name] [varchar](max) NOT NULL,
	[dimension_unique_name] [varchar](max) NOT NULL,
	[dimension_master_name] [varchar](max) NOT NULL,
	[dimension_master_unique_name] [varchar](max) NOT NULL,
	[hierarchy_name] [varchar](max) NOT NULL,
	[hierarchy_unique_name] [varchar](max) NOT NULL,
	[level_caption] [varchar](max) NOT NULL,
	[level_name] [varchar](max) NOT NULL,
	[level_unique_name] [varchar](max) NOT NULL,
	[measure_name] [varchar](max) NOT NULL,
	[measure_unique_name] [varchar](max) NOT NULL,
	[measuregroup_name] [varchar](max) NOT NULL,
	[VISIBLE] [bit] NOT NULL,
	[DISPLAY_FOLDER] [varchar](max) NULL,
	[FORMAT_STRING] [varchar](max) NULL,
	[ASSOCIATED_MEASURE_GROUP] [varchar](max) NULL,
	[CAPTION] [varchar](max) NULL,
	[SOLVE_ORDER] [int] NULL,
	[hashcode]  AS (hashbytes('SHA2_512',concat_ws('~|@',[MeasureName],[MeasureUniqueName],[IsScoped],[Scoped_IsCreateMeasure],[Scoped_IsSubcubeExpression],[GeneratedBy],[GroupingName],[GroupingGuid],[dimension_name],[dimension_unique_name],[dimension_master_name],[dimension_master_unique_name],[hierarchy_name],[hierarchy_unique_name],[level_caption],[level_name],[level_unique_name],[measure_name],[measure_unique_name],[measuregroup_name]))),
 CONSTRAINT [PK_tblGeneratedMeasures] PRIMARY KEY CLUSTERED 
(
	[MeasuresId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblGeneratedMeasures] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[tblGeneratedMeasures] ADD  DEFAULT ((0)) FOR [IsScoped]
GO
ALTER TABLE [dbo].[tblGeneratedMeasures] ADD  DEFAULT ((0)) FOR [Scoped_IsCreateMeasure]
GO
ALTER TABLE [dbo].[tblGeneratedMeasures] ADD  DEFAULT ((0)) FOR [Scoped_IsSubcubeExpression]
GO
ALTER TABLE [dbo].[tblGeneratedMeasures] ADD  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[tblGeneratedMeasures] ADD  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[tblGeneratedMeasures] ADD  DEFAULT ((1)) FOR [VISIBLE]
GO
