SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CensusGeographicalAreaDim](
	[GEO_AREA_SK] [int] IDENTITY(1,1) NOT NULL,
	[GEO_AREA_TYPE] [varchar](50) NULL,
	[GEO_AREA_DSPL_NM] [varchar](255) NULL,
 CONSTRAINT [PK_CensusGeographicalAreaDim_GEO_AREA_SK] PRIMARY KEY CLUSTERED 
(
	[GEO_AREA_SK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
