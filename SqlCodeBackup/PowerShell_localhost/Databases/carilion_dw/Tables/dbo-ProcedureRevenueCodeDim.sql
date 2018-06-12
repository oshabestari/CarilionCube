SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProcedureRevenueCodeDim](
	[REV_CD] [int] IDENTITY(1,1) NOT NULL,
	[REV_CD_NM] [varchar](255) NULL,
 CONSTRAINT [PK_ProcedureRevenueCodeDim_REV_CD] PRIMARY KEY CLUSTERED 
(
	[REV_CD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
