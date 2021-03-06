SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DM_Quality_Fact](
	[Data_ID] [int] NOT NULL,
	[LO_CDS] [int] NULL,
	[SRC_DEPT_ID] [varchar](4000) NULL,
	[Truven_Indicator] [varchar](4000) NULL,
	[Source_Measure_Title] [varchar](4000) NULL,
	[Frequency] [varchar](4000) NULL,
	[Date] [datetime] NULL,
	[Result] [numeric](18, 2) NULL,
	[Source_Source_Measure_ID] [int] NULL
) ON [PRIMARY]
GO
