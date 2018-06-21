USE [carilion_dw]
GO
/****** Object:  Table [dbo].[OutpatientCancellationReasonDim]    Script Date: 6/21/2018 11:44:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OutpatientCancellationReasonDim]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[OutpatientCancellationReasonDim](
	[CNCL_RSN_CDS] [int] IDENTITY(1,1) NOT NULL,
	[CNCL_RSN_NM] [varchar](255) NULL,
 CONSTRAINT [PK_OutpatientCancellationReasonDim_CNCL_RSN_CDS] PRIMARY KEY CLUSTERED 
(
	[CNCL_RSN_CDS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[OutpatientCancellationReasonDim] ON 

INSERT [dbo].[OutpatientCancellationReasonDim] ([CNCL_RSN_CDS], [CNCL_RSN_NM]) VALUES (1, N'6WZM8T0RXVJYHRZ84C04NHWX2JX3RV34IMPUF0YRR3XT4B4K2P6PBGFP01KPVX02RFGV24S3D8CJJ2SQFC11ODS16ZUDF9VU2V2PU8IXW2C23V6X8TAJWYDEMEO2AFO4CIGO03V6U34M1QYBTW5MZCY4HO3GKFMHE7PLEHW5X3OSTRCVGD9D9150JC7C0FMFGN8U0DWB00OVO6AQB706697C2P11AK5IH9B6IIV3GXD9')
INSERT [dbo].[OutpatientCancellationReasonDim] ([CNCL_RSN_CDS], [CNCL_RSN_NM]) VALUES (2, N'ABD2H0SFF87FWRBBV0FU6DEU37TCWQ8VYZRDNZTJC3204RMQJRLWXE6XXJY97FIOZBGW0XOV7WI2AEPCK2S55CYJSUG31KBXKE0SAPQM3PP1W3MITMO5NDINDX35HKUMLLHWDW1UC62FNXMO8XAFV697VDFCML4IV2G')
INSERT [dbo].[OutpatientCancellationReasonDim] ([CNCL_RSN_CDS], [CNCL_RSN_NM]) VALUES (3, N'MP5WKTTGB20GAFWJAFREBA1ZHO8Q1JKKHA2JRDU1DSWSDZ26OK8GA10BN5FVK2FRIFZZCDSXKP1ID9MHM12GB39FAQVLXZGBD59X02UASAVLZIYEJY8JZYGE5JPLH6ZL8Q48ZOHK7RN07OGSSH2ZQXBEPVSHC8SMBAC8DPEVHNB7')
INSERT [dbo].[OutpatientCancellationReasonDim] ([CNCL_RSN_CDS], [CNCL_RSN_NM]) VALUES (4, N'F6G2XT030UBFQJ4VZ8YY1PXC7E226I2L339OBEFFSIBF0TN6AZHFD99Q94UIQYWHSPBM9GKLSI6IEHBERVS71M8UUJF7JXPTMTNBI1XUFWNU2RCRSGQU5PG5GGSQ0C1VTCWKU0WQYYS5ZDS27NE36UOWCHU196T2UR1PVRXSK0V7XB62OP')
INSERT [dbo].[OutpatientCancellationReasonDim] ([CNCL_RSN_CDS], [CNCL_RSN_NM]) VALUES (5, N'DXYPYOZ8C5UHS5PA8C27GPMI5ZGZ1BRDJNF4W130VILMQJ3271XQLI3OBGJY8070DHX4PKE691BX30SMVDRZD0R1KQTGI4SVBK88LZCNNRHJ65KBNX3U87NC')
SET IDENTITY_INSERT [dbo].[OutpatientCancellationReasonDim] OFF
