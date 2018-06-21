USE [carilion_dw]
GO
/****** Object:  Table [dbo].[ProcedureOrderStatusDim]    Script Date: 6/21/2018 11:44:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProcedureOrderStatusDim]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ProcedureOrderStatusDim](
	[ORDR_STS_CD] [int] IDENTITY(1,1) NOT NULL,
	[ORDR_STS_NM] [varchar](255) NULL,
 CONSTRAINT [PK_ProcedureOrderStatusDim_ORDR_STS_CD] PRIMARY KEY CLUSTERED 
(
	[ORDR_STS_CD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[ProcedureOrderStatusDim] ON 

INSERT [dbo].[ProcedureOrderStatusDim] ([ORDR_STS_CD], [ORDR_STS_NM]) VALUES (1, N'K40R6SLQKGR5C44E6VZ28GLNYXLKRGRI9KRI3SUPM502JIS7I7GW6083JDS961Z3P8WSDLAD09F3FI4G4E1K0UC8BNZQ0LIL6XCALZUWW2WWK5N08B4S0E2VWNHPMJDFRU')
INSERT [dbo].[ProcedureOrderStatusDim] ([ORDR_STS_CD], [ORDR_STS_NM]) VALUES (2, N'I5UU5K4OYYFO5ZYHOH')
INSERT [dbo].[ProcedureOrderStatusDim] ([ORDR_STS_CD], [ORDR_STS_NM]) VALUES (3, N'LRVHDYI4ACOG4Q75UEGZ7VQ3XGZBPN1PY195MOGWMFUBAHBXXT437HHP1RKXY7EMAYI2G2I6')
INSERT [dbo].[ProcedureOrderStatusDim] ([ORDR_STS_CD], [ORDR_STS_NM]) VALUES (4, N'KCS1FTF51DWJ')
INSERT [dbo].[ProcedureOrderStatusDim] ([ORDR_STS_CD], [ORDR_STS_NM]) VALUES (5, N'IGJK3V3JX')
SET IDENTITY_INSERT [dbo].[ProcedureOrderStatusDim] OFF
