USE [carilion_dw]
GO
set nocount on
GO

GO
/****** Object:  Table [dbo].[ProcedureDim]    Script Date: 6/21/2018 11:44:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProcedureDim]') AND type in (N'U'))
BEGIN
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
END
GO
SET IDENTITY_INSERT [dbo].[ProcedureDim] ON 

INSERT [dbo].[ProcedureDim] ([PRCDR_CD_SK], [PRCDR_CD], [CD_TYPE], [PRCDR_CGY_ID], [REV_CD], [PRCDR_NM], [SRC_PRCDR_CD_ID], [CD_TYPE_NM]) VALUES (1, N'V0H67BS9Q65', 5, 2, 3, N'1TCZP3TR849BIQJHM7J4FN56L68XHNZXZHWZZLO', N'35545', N'Pro Versus vantis. Multum volcans bono transit. plurissimum Id trepicandor quis brevens, cognitio, quoque')
INSERT [dbo].[ProcedureDim] ([PRCDR_CD_SK], [PRCDR_CD], [CD_TYPE], [PRCDR_CGY_ID], [REV_CD], [PRCDR_NM], [SRC_PRCDR_CD_ID], [CD_TYPE_NM]) VALUES (2, N'FY1T54ZLGYQS0QRT96XBV3', 1, 4, 4, N'TEF2URIABX482JFEO6EJUV9K4CB0UJI1JQB073CTNYLKJRVG1HBT65YX5UXI', N'38580', N'gravum eggredior. plorum vobis novum pladior Pro nomen non et plorum in e glavans quad et Quad quartu')
INSERT [dbo].[ProcedureDim] ([PRCDR_CD_SK], [PRCDR_CD], [CD_TYPE], [PRCDR_CGY_ID], [REV_CD], [PRCDR_NM], [SRC_PRCDR_CD_ID], [CD_TYPE_NM]) VALUES (3, N'O9WEQP4ZYBEGV', 4, 3, 5, N'HFRF2OB7F6KTLVV9P1DHVZC8OVESEVC5TD5JU5G2J8MBQZK92NFSJ1KI3JQ7AJTJUF08QCFJLAXND1HOA5PQFJMSSNFBE9S0E2HBZCJP8W783W5112W5T34AS7F2W45BIX8AK5PXL0IJCDPVHD9CCM6BY6ISXGS3RWQ5OUHWDYJ', N'04192', N'non transit. esset e Pro plurissimum Longam, gravis plorum in estis gravis bono quoque glavans et si')
INSERT [dbo].[ProcedureDim] ([PRCDR_CD_SK], [PRCDR_CD], [CD_TYPE], [PRCDR_CGY_ID], [REV_CD], [PRCDR_NM], [SRC_PRCDR_CD_ID], [CD_TYPE_NM]) VALUES (4, N'GBB8QCW9P6', 3, 1, 1, N'KKXFHJLIVSYVQXCDMW057ESFMJ7MWDZE3DQD93AEU98YXUEQI49GYDL6S', N'92684', N'cognitio, quorum linguens transit. in gravis venit. quo fecundio, Quad eggredior. essit. et fecit. quad e')
INSERT [dbo].[ProcedureDim] ([PRCDR_CD_SK], [PRCDR_CD], [CD_TYPE], [PRCDR_CGY_ID], [REV_CD], [PRCDR_NM], [SRC_PRCDR_CD_ID], [CD_TYPE_NM]) VALUES (5, NULL, 2, 5, 2, N'SYBYMITKSD7Z4JMLAX5THS5H4S3IFPRKKQAC3VNQ5D21JIZPUD2O0Z00TTUUEA52MNFD99IF9FO4P3YMSEO1M2JKQ9J91TCU80EV2MGKVNELAVBPV820L3FJ3UMZQ8DG2TWOP2J5X46ZOXAUYUETQC94L', N'20822', N'si nomen non quorum si quo gravis novum quartu estum. quo, Longam, eudis volcans non gravis brevens,')
SET IDENTITY_INSERT [dbo].[ProcedureDim] OFF
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[ProcedureDim-ProcedureCategoryDim]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProcedureDim]'))
ALTER TABLE [dbo].[ProcedureDim]  WITH CHECK ADD  CONSTRAINT [ProcedureDim-ProcedureCategoryDim] FOREIGN KEY([PRCDR_CGY_ID])
REFERENCES [dbo].[ProcedureCategoryDim] ([PRCDR_CGY_ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[ProcedureDim-ProcedureCategoryDim]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProcedureDim]'))
ALTER TABLE [dbo].[ProcedureDim] CHECK CONSTRAINT [ProcedureDim-ProcedureCategoryDim]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[ProcedureDim-ProcedureRevenueCodeDim]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProcedureDim]'))
ALTER TABLE [dbo].[ProcedureDim]  WITH CHECK ADD  CONSTRAINT [ProcedureDim-ProcedureRevenueCodeDim] FOREIGN KEY([REV_CD])
REFERENCES [dbo].[ProcedureRevenueCodeDim] ([REV_CD])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[ProcedureDim-ProcedureRevenueCodeDim]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProcedureDim]'))
ALTER TABLE [dbo].[ProcedureDim] CHECK CONSTRAINT [ProcedureDim-ProcedureRevenueCodeDim]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[ProcedureDim-ProcedureTypeDim]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProcedureDim]'))
ALTER TABLE [dbo].[ProcedureDim]  WITH CHECK ADD  CONSTRAINT [ProcedureDim-ProcedureTypeDim] FOREIGN KEY([CD_TYPE])
REFERENCES [dbo].[ProcedureTypeDim] ([CD_TYPE])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[ProcedureDim-ProcedureTypeDim]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProcedureDim]'))
ALTER TABLE [dbo].[ProcedureDim] CHECK CONSTRAINT [ProcedureDim-ProcedureTypeDim]
GO
