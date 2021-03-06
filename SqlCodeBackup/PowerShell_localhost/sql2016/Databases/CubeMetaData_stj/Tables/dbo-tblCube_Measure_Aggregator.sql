SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCube_Measure_Aggregator](
	[measure_aggregator] [int] NOT NULL,
	[measure_aggregator_name] [nvarchar](18) NOT NULL,
 CONSTRAINT [PK_tblCube_Measure_Aggregator] PRIMARY KEY CLUSTERED 
(
	[measure_aggregator] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
