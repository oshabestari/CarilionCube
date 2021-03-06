SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProcedureOrderStandingStatusDim](
	[STNDNG_STS_CD] [varchar](1) NOT NULL,
	[STNDNG_STS_NM] [varchar](255) NULL,
 CONSTRAINT [PK_ProcedureOrderStandingStatusDim_STNDNG_STS_CD] PRIMARY KEY CLUSTERED 
(
	[STNDNG_STS_CD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
