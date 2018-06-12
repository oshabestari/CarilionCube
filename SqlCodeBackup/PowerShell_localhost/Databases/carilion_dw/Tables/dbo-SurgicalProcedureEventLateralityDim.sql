SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SurgicalProcedureEventLateralityDim](
	[LTRLTY_CDS] [int] IDENTITY(1,1) NOT NULL,
	[LTRLTY_DESC] [varchar](255) NULL,
 CONSTRAINT [PK_SurgicalProcedureEventLateralityDim_LTRLTY_CDS] PRIMARY KEY CLUSTERED 
(
	[LTRLTY_CDS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
