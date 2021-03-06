SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EncounterProductLineDim](
	[PRD_LINE_CDS] [int] IDENTITY(1,1) NOT NULL,
	[PROD_LINE_DESC] [varchar](57) NULL,
 CONSTRAINT [PK_EncounterProductLineDim_PRD_LINE_CDS] PRIMARY KEY CLUSTERED 
(
	[PRD_LINE_CDS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
