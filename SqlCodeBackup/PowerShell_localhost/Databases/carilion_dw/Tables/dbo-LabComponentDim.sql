SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LabComponentDim](
	[CMPNT_SK] [bigint] IDENTITY(1,1) NOT NULL,
	[COMP_NAME] [varchar](513) NULL,
	[CMPNT_ABBR] [varchar](50) NULL,
	[BAS_NM] [varchar](255) NULL,
	[CMN_NM] [varchar](255) NULL,
	[CMPNT_TYPE_CDS] [int] NULL,
	[CMPNT_SUBT_CDS] [int] NULL,
	[DFLT_UNT] [varchar](50) NULL,
	[EXPCT_MIN_VAL] [numeric](18, 2) NULL,
	[EXPCT_MAX_VAL] [numeric](18, 2) NULL,
 CONSTRAINT [PK_LabComponentDim_CMPNT_SK] PRIMARY KEY CLUSTERED 
(
	[CMPNT_SK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[LabComponentDim]  WITH CHECK ADD  CONSTRAINT [LabComponentDim-LabComponentSubstrateDim] FOREIGN KEY([CMPNT_SUBT_CDS])
REFERENCES [dbo].[LabComponentSubstrateDim] ([CMPNT_SUBT_CDS])
GO
ALTER TABLE [dbo].[LabComponentDim] CHECK CONSTRAINT [LabComponentDim-LabComponentSubstrateDim]
GO
ALTER TABLE [dbo].[LabComponentDim]  WITH CHECK ADD  CONSTRAINT [LabComponentDim-LabComponentTypeDim] FOREIGN KEY([CMPNT_TYPE_CDS])
REFERENCES [dbo].[LabComponentTypeDim] ([CMPNT_TYPE_CDS])
GO
ALTER TABLE [dbo].[LabComponentDim] CHECK CONSTRAINT [LabComponentDim-LabComponentTypeDim]
GO
