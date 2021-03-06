SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblGeneratedMeasures](
	[MeasuresId] [int] IDENTITY(1,1) NOT NULL,
	[MeasureName] [varchar](max) NOT NULL,
	[MeasureUniqueName] [varchar](max) NOT NULL,
	[MeasureDefinition] [varchar](max) NOT NULL,
	[IsDimensionAgnostic] [bit] NOT NULL,
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
	[HashCodeMeasureDefinition]  AS (hashbytes('SHA2_512',upper([MeasureDefinition]))) PERSISTED,
	[HashCodeRow]  AS (hashbytes('SHA2_512',concat(upper([MeasureName]),'~|@',upper([MeasureUniqueName]),'~|@',upper([IsScoped]),'~|@',upper([Scoped_IsCreateMeasure]),'~|@',upper([Scoped_IsSubcubeExpression]),'~|@',upper([GeneratedBy]),'~|@',upper([GroupingName]),'~|@',upper([GroupingGuid]),'~|@',upper([dimension_name]),'~|@',upper([dimension_unique_name]),'~|@',upper([dimension_master_name]),'~|@',upper([hierarchy_name]),'~|@',upper([hierarchy_unique_name]),'~|@',upper([level_caption]),'~|@',upper([level_name]),'~|@',upper([level_unique_name]),'~|@',upper([measure_name]),'~|@',upper([measure_unique_name]),'~|@',upper([measuregroup_name])))) PERSISTED,
	[dimension_name] [varchar](max) NOT NULL,
	[dimension_unique_name] [varchar](max) NOT NULL,
	[dimension_master_name] [varchar](max) NOT NULL,
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
 CONSTRAINT [PK_tblGeneratedMeasures] PRIMARY KEY CLUSTERED 
(
	[MeasuresId] ASC
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
CREATE UNIQUE NONCLUSTERED INDEX [IX_tblGeneratedMeasures] ON [dbo].[tblGeneratedMeasures]
(
	[HashCodeMeasureDefinition] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblGeneratedMeasures] ADD  CONSTRAINT [DF_tblGeneratedMeasures_IsDimensionAgnostic]  DEFAULT ((1)) FOR [IsDimensionAgnostic]
GO
ALTER TABLE [dbo].[tblGeneratedMeasures] ADD  CONSTRAINT [DF__tblGenera__IsSco__09E968C4]  DEFAULT ((0)) FOR [IsScoped]
GO
ALTER TABLE [dbo].[tblGeneratedMeasures] ADD  CONSTRAINT [DF__tblGenera__Scope__0ADD8CFD]  DEFAULT ((0)) FOR [Scoped_IsCreateMeasure]
GO
ALTER TABLE [dbo].[tblGeneratedMeasures] ADD  CONSTRAINT [DF__tblGenera__Scope__0BD1B136]  DEFAULT ((0)) FOR [Scoped_IsSubcubeExpression]
GO
ALTER TABLE [dbo].[tblGeneratedMeasures] ADD  CONSTRAINT [DF__tblGenera__Creat__0CC5D56F]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[tblGeneratedMeasures] ADD  CONSTRAINT [DF__tblGenera__Modif__0DB9F9A8]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[tblGeneratedMeasures] ADD  CONSTRAINT [DF__tblGenera__VISIB__0EAE1DE1]  DEFAULT ((1)) FOR [VISIBLE]
GO
ALTER TABLE [dbo].[tblGeneratedMeasures]  WITH CHECK ADD  CONSTRAINT [CK_tblGeneratedMeasures_IsScoped] CHECK  (([IsScoped]=(0) AND [Scoped_IsCreateMeasure]=(0) AND [Scoped_IsSubcubeExpression]=(0) OR [IsScoped]=(1) AND [Scoped_IsCreateMeasure]=(1) AND [Scoped_IsSubcubeExpression]=(0) OR [IsScoped]=(1) AND [Scoped_IsCreateMeasure]=(0) AND [Scoped_IsSubcubeExpression]=(1)))
GO
ALTER TABLE [dbo].[tblGeneratedMeasures] CHECK CONSTRAINT [CK_tblGeneratedMeasures_IsScoped]
GO
