SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SurgicalCaseProcedureLevelDim](
	[PRCDR_LEVL_CDS] [int] IDENTITY(1,1) NOT NULL,
	[PRCDR_LEVL_DESC] [varchar](254) NULL,
 CONSTRAINT [PK_SurgicalCaseProcedureLevelDim_PRCDR_LEVL_CDS] PRIMARY KEY CLUSTERED 
(
	[PRCDR_LEVL_CDS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
