SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProcedureDim](
	[PRCDR_CD_SK] [bigint] IDENTITY(1,1) NOT NULL,
	[PRCDR_CD] [varchar](50) NULL,
	[CD_TYPE] [int] NULL,
	[PRCDR_CGY_ID] [int] NULL,
	[REV_CD] [int] NULL,
	[PRCDR_NM] [varchar](308) NULL,
	[SRC_PRCDR_CD_ID] [varchar](255) NULL,
	[CD_TYPE_NM] [varchar](255) NULL,
 CONSTRAINT [PK_ProcedureDim_PRCDR_CD_SK] PRIMARY KEY CLUSTERED 
(
	[PRCDR_CD_SK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ProcedureDim]  WITH CHECK ADD  CONSTRAINT [ProcedureDim-ProcedureCategoryDim] FOREIGN KEY([PRCDR_CGY_ID])
REFERENCES [dbo].[ProcedureCategoryDim] ([PRCDR_CGY_ID])
GO
ALTER TABLE [dbo].[ProcedureDim] CHECK CONSTRAINT [ProcedureDim-ProcedureCategoryDim]
GO
ALTER TABLE [dbo].[ProcedureDim]  WITH CHECK ADD  CONSTRAINT [ProcedureDim-ProcedureRevenueCodeDim] FOREIGN KEY([REV_CD])
REFERENCES [dbo].[ProcedureRevenueCodeDim] ([REV_CD])
GO
ALTER TABLE [dbo].[ProcedureDim] CHECK CONSTRAINT [ProcedureDim-ProcedureRevenueCodeDim]
GO
ALTER TABLE [dbo].[ProcedureDim]  WITH CHECK ADD  CONSTRAINT [ProcedureDim-ProcedureTypeDim] FOREIGN KEY([CD_TYPE])
REFERENCES [dbo].[ProcedureTypeDim] ([CD_TYPE])
GO
ALTER TABLE [dbo].[ProcedureDim] CHECK CONSTRAINT [ProcedureDim-ProcedureTypeDim]
GO
