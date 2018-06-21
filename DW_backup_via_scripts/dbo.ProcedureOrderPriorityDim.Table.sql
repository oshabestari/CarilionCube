USE [carilion_dw]
GO
/****** Object:  Table [dbo].[ProcedureOrderPriorityDim]    Script Date: 6/21/2018 11:44:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProcedureOrderPriorityDim]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ProcedureOrderPriorityDim](
	[ORDR_PRTY_CD] [int] IDENTITY(1,1) NOT NULL,
	[ORDR_PRTY_NM] [varchar](255) NULL,
 CONSTRAINT [PK_ProcedureOrderPriorityDim_ORDR_PRTY_CD] PRIMARY KEY CLUSTERED 
(
	[ORDR_PRTY_CD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[ProcedureOrderPriorityDim] ON 

INSERT [dbo].[ProcedureOrderPriorityDim] ([ORDR_PRTY_CD], [ORDR_PRTY_NM]) VALUES (1, N'P2RHPJP05TYCD13LOZZUC7O8HBO60BUFKB8LOC47NMIIFYM15BD4PVAIEJZDVIZUZJS2SHXBVR6PP5SJPN1PXQPP1Q65')
INSERT [dbo].[ProcedureOrderPriorityDim] ([ORDR_PRTY_CD], [ORDR_PRTY_NM]) VALUES (2, N'RC5NNJW6J9OE29XPKS8QGN8HAW8T311ARY3E021MWD5DDAVHRZGYYEW34OCRA22I7DN35JOIQMU3IU300R23K3CC10ACP9CUAM6ZNSB8AX7CKTLAKCRIZZY31A258CTG9ZSVN4C8GTSNW0S7EZRCITUBO3YDP6ZY4Q2')
INSERT [dbo].[ProcedureOrderPriorityDim] ([ORDR_PRTY_CD], [ORDR_PRTY_NM]) VALUES (3, N'0PNGZI156B61HUQ8LGYF5H7K5ZIAUUI6X76PCBCZRO4DWXVVFRDNSMFJI3AZ0RBBS039N1V94YNHDTN84MU2HVEBSN690CZ0CTLVUL8EV3JTY')
INSERT [dbo].[ProcedureOrderPriorityDim] ([ORDR_PRTY_CD], [ORDR_PRTY_NM]) VALUES (4, N'6OF2VDW9TXMRHZ')
INSERT [dbo].[ProcedureOrderPriorityDim] ([ORDR_PRTY_CD], [ORDR_PRTY_NM]) VALUES (5, N'M9RYN4J8SEJEG7EBKCUHHUXHL33ZN8249J9TSUA')
SET IDENTITY_INSERT [dbo].[ProcedureOrderPriorityDim] OFF
