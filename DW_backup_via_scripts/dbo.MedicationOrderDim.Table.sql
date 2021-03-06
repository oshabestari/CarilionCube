USE [carilion_dw]
GO
set nocount on
GO

GO
/****** Object:  Table [dbo].[MedicationOrderDim]    Script Date: 6/21/2018 11:44:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MedicationOrderDim]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[MedicationOrderDim](
	[MDCTN_ORDR_SK] [bigint] IDENTITY(1,1) NOT NULL,
	[PTNT_INSTR] [varchar](255) NULL,
	[RT_CDS] [int] NULL,
	[QTY_UNT_CDS] [int] NULL,
	[DOSE_UNT_CDS] [int] NULL,
	[CLCLTD_DOSE_UNT_CDS] [int] NULL,
	[ORDR_SRC_CDS] [int] NULL,
	[ORDR_CLASS_CDS] [int] NULL,
	[ORDR_MODE_CDS] [int] NULL,
	[ORDR_PRTY_CDS] [int] NULL,
	[ORDR_SET_SRC_CDS] [bigint] NULL,
	[PRN_RSN_1] [varchar](255) NULL,
	[INDC_FOR_USE_1] [varchar](255) NULL,
	[CPOE_IND] [varchar](3) NULL,
	[DSPNS_AS_WRTN_IND] [varchar](3) NULL,
	[ORDRD_AS_NONFORM_IND] [varchar](3) NULL,
	[VRFD_AS_NONFORM_IND] [varchar](3) NULL,
	[AUTOMAT_VRFD_IND] [varchar](3) NULL,
	[VRBL_IND] [varchar](3) NULL,
	[REQR_COSIG_IND] [varchar](3) NULL,
	[COSIG_IND] [varchar](3) NULL,
	[VRBL_SGN_IND] [varchar](3) NULL,
	[SRC_ORDR_ID] [varchar](255) NULL,
	[FREQ_DESC] [varchar](255) NULL,
 CONSTRAINT [PK_MedicationOrderDim_MDCTN_ORDR_SK] PRIMARY KEY CLUSTERED 
(
	[MDCTN_ORDR_SK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[MedicationOrderDim] ON 

INSERT [dbo].[MedicationOrderDim] ([MDCTN_ORDR_SK], [PTNT_INSTR], [RT_CDS], [QTY_UNT_CDS], [DOSE_UNT_CDS], [CLCLTD_DOSE_UNT_CDS], [ORDR_SRC_CDS], [ORDR_CLASS_CDS], [ORDR_MODE_CDS], [ORDR_PRTY_CDS], [ORDR_SET_SRC_CDS], [PRN_RSN_1], [INDC_FOR_USE_1], [CPOE_IND], [DSPNS_AS_WRTN_IND], [ORDRD_AS_NONFORM_IND], [VRFD_AS_NONFORM_IND], [AUTOMAT_VRFD_IND], [VRBL_IND], [REQR_COSIG_IND], [COSIG_IND], [VRBL_SGN_IND], [SRC_ORDR_ID], [FREQ_DESC]) VALUES (1, N'TOXHAVESBABRMFT21T161I8755AMR9GPQON6R72UW1VLP4GYL8WIGWLBGPB5LS12UL0YSNBTQ790NMH0PB0ICX9', 2, 1, 1, 5, 5, 3, 3, 4, 2, N'RO2Z1CF10N4MTF2983XHI6P6KQHDS', N'1D9FWSX5DEWBC4OOV4AMRC2A7L3NLBC50I4A83BAYC3EEVM11IUIO3NOBZ7BP9J21RAU0EFRS0OE9OVCZ2L3GTGXVGY9V0LOS1CNKS1M23POF8FN4VBNOGL7BDZKG6WSFZM7B7S70Y1D3RIM0B50OY0C', NULL, N'MR', N'', N'76', N'IVC', N'T', N'39R', N'E', N'OO7', N'93496', N'si vobis pars delerium. venit. rarendum quartu et rarendum et e e in fecit. brevens, plorum novum cognitio,')
INSERT [dbo].[MedicationOrderDim] ([MDCTN_ORDR_SK], [PTNT_INSTR], [RT_CDS], [QTY_UNT_CDS], [DOSE_UNT_CDS], [CLCLTD_DOSE_UNT_CDS], [ORDR_SRC_CDS], [ORDR_CLASS_CDS], [ORDR_MODE_CDS], [ORDR_PRTY_CDS], [ORDR_SET_SRC_CDS], [PRN_RSN_1], [INDC_FOR_USE_1], [CPOE_IND], [DSPNS_AS_WRTN_IND], [ORDRD_AS_NONFORM_IND], [VRFD_AS_NONFORM_IND], [AUTOMAT_VRFD_IND], [VRBL_IND], [REQR_COSIG_IND], [COSIG_IND], [VRBL_SGN_IND], [SRC_ORDR_ID], [FREQ_DESC]) VALUES (2, N'2CP1VX93ZSR44H6XW2R8MLOU8BG9RJPXB5VG', 3, 5, 4, 4, 4, 5, 5, 1, 3, N'2QZ53GKXRIORZ', N'4C7TH6V6X8FM8BW34MPF74JUCJ41V3HZAR6VKEJR566J30SZ8WKBAX80TCGX2UAURFBG50IQ2X91YZRCR4SZI5ODJ628XMPBVBSNOBU8EU9DN62TK36Y1BBLQYXYY9SG8Y5M74NF9KKOWB', N'', N'C', N'', N'8EL', N'A', N'J', N'1', N'', N'R', N'93077', N'plorum Et bono Sed essit. gravis et pars Pro travissimantor quorum et ut fecundio, et e gravis pladior nomen quartu')
INSERT [dbo].[MedicationOrderDim] ([MDCTN_ORDR_SK], [PTNT_INSTR], [RT_CDS], [QTY_UNT_CDS], [DOSE_UNT_CDS], [CLCLTD_DOSE_UNT_CDS], [ORDR_SRC_CDS], [ORDR_CLASS_CDS], [ORDR_MODE_CDS], [ORDR_PRTY_CDS], [ORDR_SET_SRC_CDS], [PRN_RSN_1], [INDC_FOR_USE_1], [CPOE_IND], [DSPNS_AS_WRTN_IND], [ORDRD_AS_NONFORM_IND], [VRFD_AS_NONFORM_IND], [AUTOMAT_VRFD_IND], [VRBL_IND], [REQR_COSIG_IND], [COSIG_IND], [VRBL_SGN_IND], [SRC_ORDR_ID], [FREQ_DESC]) VALUES (3, N'AYTY60UVCW7', 1, 3, 3, 3, 2, 4, 2, 2, 5, N'IJLYXEESHWDKYVEAV182KDMNCMPBCETQ', N'C38OUGR9KZ7WQEV942S5P1FMGFQOHRNOF8KVQLY0GOKM07X0DAGM360ANL7EP2STCIHIU0J', N'2H', N'O', N'WS', N'', N'FS8', N'5HX', N'', N'', N'', N'51980', N'Versus e apparens Et gravis gravum estis funem. gravum plurissimum Quad linguens et quantare imaginator')
INSERT [dbo].[MedicationOrderDim] ([MDCTN_ORDR_SK], [PTNT_INSTR], [RT_CDS], [QTY_UNT_CDS], [DOSE_UNT_CDS], [CLCLTD_DOSE_UNT_CDS], [ORDR_SRC_CDS], [ORDR_CLASS_CDS], [ORDR_MODE_CDS], [ORDR_PRTY_CDS], [ORDR_SET_SRC_CDS], [PRN_RSN_1], [INDC_FOR_USE_1], [CPOE_IND], [DSPNS_AS_WRTN_IND], [ORDRD_AS_NONFORM_IND], [VRFD_AS_NONFORM_IND], [AUTOMAT_VRFD_IND], [VRBL_IND], [REQR_COSIG_IND], [COSIG_IND], [VRBL_SGN_IND], [SRC_ORDR_ID], [FREQ_DESC]) VALUES (4, N'2LA508GNVSKHZBG3UTYLQZM4YAGLTZVE84PXERAXES3HDCYUJR0JYLE3Z66QSVTWW58UMJO2I16YW5QLBM12YCGNQLY8LK5JY7K744702Y1WEF7UGLE5UQXKPL30LGHXWNZOKIH7E0ZZAJ8AE4R06ZO790IJ06FMH40RGI9X36RTRYA5CTLGOHQWZRFKZY77LDI6JHUWUUW07UGBQD67LYYZD3RO2P', 5, 2, 2, 1, 3, 1, 4, 3, 1, N'UN15JGEJA93SIHOIGNMJXA5WXLAO2G32MD47D5BLTIA4JVT40TVR679JI57X5QGU5155DH5BB1PE00C2R6O9KCVF3KP7YEF32GYIQNRJNKF5HUJHS56Z169T5Q2TRXCXLLCK2UC3F4M0WPX818FT8G1V64C0LYRQ7IJVHYFXS2KWK9XFSTRJIJP5KHDXICIGDWSD61Q2TH06V', N'4SO1GTM9IQA6A1L97974EJAEVRAIPE5DRYHAHYTUZYVZRMIAW8AKTE4KIA6PJ4J3KXFCJAR8FD4FOBM99ZLH4LKCTXS7S4AVESET66RMH15FAOV6NWFKI2ZZD2ILH', N'', N'', N'5', N'U', N'SRY', N'', N'0Y', N'WDX', N'9P', N'19205', N'novum estis quorum plurissimum egreddior imaginator imaginator ut Pro et sed quad fecit, fecundio, quantare brevens,')
INSERT [dbo].[MedicationOrderDim] ([MDCTN_ORDR_SK], [PTNT_INSTR], [RT_CDS], [QTY_UNT_CDS], [DOSE_UNT_CDS], [CLCLTD_DOSE_UNT_CDS], [ORDR_SRC_CDS], [ORDR_CLASS_CDS], [ORDR_MODE_CDS], [ORDR_PRTY_CDS], [ORDR_SET_SRC_CDS], [PRN_RSN_1], [INDC_FOR_USE_1], [CPOE_IND], [DSPNS_AS_WRTN_IND], [ORDRD_AS_NONFORM_IND], [VRFD_AS_NONFORM_IND], [AUTOMAT_VRFD_IND], [VRBL_IND], [REQR_COSIG_IND], [COSIG_IND], [VRBL_SGN_IND], [SRC_ORDR_ID], [FREQ_DESC]) VALUES (5, N'5YJ8EF3LVYPMUKQP', 4, 4, 5, 2, 1, 2, 1, 5, 4, NULL, N'GA291WWS237YZ2G4252LJWPQCCSFF4N54XLUD1NZAVUCCK2WJ90CJWZKLBWO3HCYF1U2HLQ1I2BO1CES9WW63AM8X1814YWTIWWAP0FXIZUHKBI9X3F6', N'', N'4V', N'JH', N'02', N'T', N'T', N'D', N'BA5', N'XI1', N'62246', N'plurissimum plorum sed vobis cognitio, vobis et non cognitio, plorum quartu Versus Id in quoque quad')
SET IDENTITY_INSERT [dbo].[MedicationOrderDim] OFF
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[MedicationOrderDim-MedicationOrderCalculatedDoseUnitDim]') AND parent_object_id = OBJECT_ID(N'[dbo].[MedicationOrderDim]'))
ALTER TABLE [dbo].[MedicationOrderDim]  WITH CHECK ADD  CONSTRAINT [MedicationOrderDim-MedicationOrderCalculatedDoseUnitDim] FOREIGN KEY([CLCLTD_DOSE_UNT_CDS])
REFERENCES [dbo].[MedicationOrderCalculatedDoseUnitDim] ([CLCLTD_DOSE_UNT_CDS])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[MedicationOrderDim-MedicationOrderCalculatedDoseUnitDim]') AND parent_object_id = OBJECT_ID(N'[dbo].[MedicationOrderDim]'))
ALTER TABLE [dbo].[MedicationOrderDim] CHECK CONSTRAINT [MedicationOrderDim-MedicationOrderCalculatedDoseUnitDim]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[MedicationOrderDim-MedicationOrderClassDim]') AND parent_object_id = OBJECT_ID(N'[dbo].[MedicationOrderDim]'))
ALTER TABLE [dbo].[MedicationOrderDim]  WITH CHECK ADD  CONSTRAINT [MedicationOrderDim-MedicationOrderClassDim] FOREIGN KEY([ORDR_CLASS_CDS])
REFERENCES [dbo].[MedicationOrderClassDim] ([ORDR_CLASS_CDS])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[MedicationOrderDim-MedicationOrderClassDim]') AND parent_object_id = OBJECT_ID(N'[dbo].[MedicationOrderDim]'))
ALTER TABLE [dbo].[MedicationOrderDim] CHECK CONSTRAINT [MedicationOrderDim-MedicationOrderClassDim]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[MedicationOrderDim-MedicationOrderDoseUnitDim]') AND parent_object_id = OBJECT_ID(N'[dbo].[MedicationOrderDim]'))
ALTER TABLE [dbo].[MedicationOrderDim]  WITH CHECK ADD  CONSTRAINT [MedicationOrderDim-MedicationOrderDoseUnitDim] FOREIGN KEY([DOSE_UNT_CDS])
REFERENCES [dbo].[MedicationOrderDoseUnitDim] ([DOSE_UNT_CDS])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[MedicationOrderDim-MedicationOrderDoseUnitDim]') AND parent_object_id = OBJECT_ID(N'[dbo].[MedicationOrderDim]'))
ALTER TABLE [dbo].[MedicationOrderDim] CHECK CONSTRAINT [MedicationOrderDim-MedicationOrderDoseUnitDim]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[MedicationOrderDim-MedicationOrderModeDim]') AND parent_object_id = OBJECT_ID(N'[dbo].[MedicationOrderDim]'))
ALTER TABLE [dbo].[MedicationOrderDim]  WITH CHECK ADD  CONSTRAINT [MedicationOrderDim-MedicationOrderModeDim] FOREIGN KEY([ORDR_MODE_CDS])
REFERENCES [dbo].[MedicationOrderModeDim] ([ORDR_MODE_CDS])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[MedicationOrderDim-MedicationOrderModeDim]') AND parent_object_id = OBJECT_ID(N'[dbo].[MedicationOrderDim]'))
ALTER TABLE [dbo].[MedicationOrderDim] CHECK CONSTRAINT [MedicationOrderDim-MedicationOrderModeDim]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[MedicationOrderDim-MedicationOrderPriorityDim]') AND parent_object_id = OBJECT_ID(N'[dbo].[MedicationOrderDim]'))
ALTER TABLE [dbo].[MedicationOrderDim]  WITH CHECK ADD  CONSTRAINT [MedicationOrderDim-MedicationOrderPriorityDim] FOREIGN KEY([ORDR_PRTY_CDS])
REFERENCES [dbo].[MedicationOrderPriorityDim] ([ORDR_PRTY_CDS])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[MedicationOrderDim-MedicationOrderPriorityDim]') AND parent_object_id = OBJECT_ID(N'[dbo].[MedicationOrderDim]'))
ALTER TABLE [dbo].[MedicationOrderDim] CHECK CONSTRAINT [MedicationOrderDim-MedicationOrderPriorityDim]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[MedicationOrderDim-MedicationOrderQuantityUnitDim]') AND parent_object_id = OBJECT_ID(N'[dbo].[MedicationOrderDim]'))
ALTER TABLE [dbo].[MedicationOrderDim]  WITH CHECK ADD  CONSTRAINT [MedicationOrderDim-MedicationOrderQuantityUnitDim] FOREIGN KEY([QTY_UNT_CDS])
REFERENCES [dbo].[MedicationOrderQuantityUnitDim] ([QTY_UNT_CDS])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[MedicationOrderDim-MedicationOrderQuantityUnitDim]') AND parent_object_id = OBJECT_ID(N'[dbo].[MedicationOrderDim]'))
ALTER TABLE [dbo].[MedicationOrderDim] CHECK CONSTRAINT [MedicationOrderDim-MedicationOrderQuantityUnitDim]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[MedicationOrderDim-MedicationOrderRouteDim]') AND parent_object_id = OBJECT_ID(N'[dbo].[MedicationOrderDim]'))
ALTER TABLE [dbo].[MedicationOrderDim]  WITH CHECK ADD  CONSTRAINT [MedicationOrderDim-MedicationOrderRouteDim] FOREIGN KEY([RT_CDS])
REFERENCES [dbo].[MedicationOrderRouteDim] ([RT_CDS])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[MedicationOrderDim-MedicationOrderRouteDim]') AND parent_object_id = OBJECT_ID(N'[dbo].[MedicationOrderDim]'))
ALTER TABLE [dbo].[MedicationOrderDim] CHECK CONSTRAINT [MedicationOrderDim-MedicationOrderRouteDim]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[MedicationOrderDim-MedicationOrderSetSourceDim]') AND parent_object_id = OBJECT_ID(N'[dbo].[MedicationOrderDim]'))
ALTER TABLE [dbo].[MedicationOrderDim]  WITH CHECK ADD  CONSTRAINT [MedicationOrderDim-MedicationOrderSetSourceDim] FOREIGN KEY([ORDR_SET_SRC_CDS])
REFERENCES [dbo].[MedicationOrderSetSourceDim] ([ORDR_SET_SRC_CDS])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[MedicationOrderDim-MedicationOrderSetSourceDim]') AND parent_object_id = OBJECT_ID(N'[dbo].[MedicationOrderDim]'))
ALTER TABLE [dbo].[MedicationOrderDim] CHECK CONSTRAINT [MedicationOrderDim-MedicationOrderSetSourceDim]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[MedicationOrderDim-MedicationOrderSourceDim]') AND parent_object_id = OBJECT_ID(N'[dbo].[MedicationOrderDim]'))
ALTER TABLE [dbo].[MedicationOrderDim]  WITH CHECK ADD  CONSTRAINT [MedicationOrderDim-MedicationOrderSourceDim] FOREIGN KEY([ORDR_SRC_CDS])
REFERENCES [dbo].[MedicationOrderSourceDim] ([ORDR_SRC_CDS])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[MedicationOrderDim-MedicationOrderSourceDim]') AND parent_object_id = OBJECT_ID(N'[dbo].[MedicationOrderDim]'))
ALTER TABLE [dbo].[MedicationOrderDim] CHECK CONSTRAINT [MedicationOrderDim-MedicationOrderSourceDim]
GO
