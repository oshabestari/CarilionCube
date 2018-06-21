USE [carilion_dw]
GO
/****** Object:  Table [dbo].[ProcedureOrderSetDm]    Script Date: 6/21/2018 11:44:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProcedureOrderSetDm]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ProcedureOrderSetDm](
	[ORDR_SET_CD] [bigint] IDENTITY(1,1) NOT NULL,
	[ORDR_SET_NM] [varchar](255) NULL,
 CONSTRAINT [PK_ProcedureOrderSetDm_ORDR_SET_CD] PRIMARY KEY CLUSTERED 
(
	[ORDR_SET_CD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[ProcedureOrderSetDm] ON 

INSERT [dbo].[ProcedureOrderSetDm] ([ORDR_SET_CD], [ORDR_SET_NM]) VALUES (1, N'6UBSKCFOR8EB4SL1JPHWK9EK3Q51PCK68VMTJPKC5IDE7CN2HAWBBW1WFQOU7EZEN7286RIU55Q2W0DR22JEG9VBUPES0P5RJZQZAE')
INSERT [dbo].[ProcedureOrderSetDm] ([ORDR_SET_CD], [ORDR_SET_NM]) VALUES (2, N'QS2566Y0FDXR4UKXECQEGDPTF0')
INSERT [dbo].[ProcedureOrderSetDm] ([ORDR_SET_CD], [ORDR_SET_NM]) VALUES (3, N'JW9DHN')
INSERT [dbo].[ProcedureOrderSetDm] ([ORDR_SET_CD], [ORDR_SET_NM]) VALUES (4, N'TME3O5VPYF3X0WY1CNJ0FC28Q67F36ZF4X1XJBNKIRFAPHZ2KVXQXMRGK5CIYFLSGOT3U0I0ZZIOXSJ874V888HH6LDDY5M25NT1OV7JCWRY42IRM4ATKDJ76BW9N42TDFIAYHKBWCVCGID32LRUUSIR3MUCZYV7TYLOK8T4JZX7H6QNYT61D8YLXQ6CM7CYGNJIXOJUSMAVUAAXV')
INSERT [dbo].[ProcedureOrderSetDm] ([ORDR_SET_CD], [ORDR_SET_NM]) VALUES (5, N'E6RTUKZ0RT1HHBNYRUN8Q99C9RY3QMG9GFT66MTYJWXQSA4Y7WIF9NH5WFK3MWA4CS02IHR51POTBJJZMZVT30ZTXN9R2PBMMSD092FQ4DEKYOTDWKGM0G0BS74U703BD26I5IPKK5PQMFU9UWUH8OL5S282XKI4A36WHA8DVW2VRAPCCU0B5L2PG0Q2AMMZNKFI9YRKNHL')
SET IDENTITY_INSERT [dbo].[ProcedureOrderSetDm] OFF
