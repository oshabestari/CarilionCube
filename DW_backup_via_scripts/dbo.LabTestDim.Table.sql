USE [carilion_dw]
GO
set nocount on
GO

GO
/****** Object:  Table [dbo].[LabTestDim]    Script Date: 6/21/2018 11:44:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LabTestDim]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[LabTestDim](
	[LAB_TST_SK] [bigint] IDENTITY(1,1) NOT NULL,
	[SRC_TST_ID] [varchar](255) NULL,
	[RSULT_LAB_CDS] [int] NULL,
	[TST_CDS] [bigint] NULL,
	[ABNRML_LEVL_DESC] [varchar](50) NULL,
	[VRFCTN_STS_CDS] [int] NULL,
	[ORDR_PRTY_CDS] [int] NULL,
	[ORDR_SRC_TYPE_CDS] [int] NULL,
	[SPCMN_NM] [varchar](255) NULL,
	[SPCMN_TYPE_CDS] [int] NULL,
	[SPCMN_SRC_CDS] [int] NULL,
	[CNCL_RSN_CDS] [int] NULL,
	[HI_PRTY_IND] [varchar](3) NULL,
	[CORR_IND] [varchar](3) NULL,
	[CRTCL_IND] [varchar](3) NULL,
	[ABNRML_IND] [varchar](3) NULL,
	[ORDR_TYPE_CDS] [int] NULL,
 CONSTRAINT [PK_LabTestDim_LAB_TST_SK] PRIMARY KEY CLUSTERED 
(
	[LAB_TST_SK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[LabTestDim] ON 

INSERT [dbo].[LabTestDim] ([LAB_TST_SK], [SRC_TST_ID], [RSULT_LAB_CDS], [TST_CDS], [ABNRML_LEVL_DESC], [VRFCTN_STS_CDS], [ORDR_PRTY_CDS], [ORDR_SRC_TYPE_CDS], [SPCMN_NM], [SPCMN_TYPE_CDS], [SPCMN_SRC_CDS], [CNCL_RSN_CDS], [HI_PRTY_IND], [CORR_IND], [CRTCL_IND], [ABNRML_IND], [ORDR_TYPE_CDS]) VALUES (1, N'73373', 121580200, 3, N'quad esset quorum transit. estis Id estum. Quad', 3, 5, 4, N'T9UXIKI7HJXRHTY9AQTOD75ASK4CVXSXSPVG0QQB1ZJXA8JQBTMT3GTL3J5XF6CJQ0ZRYI9K0HMEO70J1E01AZUCWACGLSWUMZ698SSTK2TLTEXWILW06A9R5NVN6SZ7LRRP0QB9M7H769IHDFXZWVOCQF4LW4NR3LZ1N8VR9NEZS1LW4EAQUZAQ3EYLMPCHKP3K9GT5K6P9GPK', 5, 4, 1, N'Z1', N'', N'KG', N'', 5)
INSERT [dbo].[LabTestDim] ([LAB_TST_SK], [SRC_TST_ID], [RSULT_LAB_CDS], [TST_CDS], [ABNRML_LEVL_DESC], [VRFCTN_STS_CDS], [ORDR_PRTY_CDS], [ORDR_SRC_TYPE_CDS], [SPCMN_NM], [SPCMN_TYPE_CDS], [SPCMN_SRC_CDS], [CNCL_RSN_CDS], [HI_PRTY_IND], [CORR_IND], [CRTCL_IND], [ABNRML_IND], [ORDR_TYPE_CDS]) VALUES (2, N'03834', -128858417, 1, N'Id gravis plurissimum quo pladior quo glavans et', 1, 1, 5, N'U8GHTWX4A9Y89A5KAWF2X0MNK55O919EUARE9VONSZ90ILV905ZKAHQTLSWOQ8V9ZKDYJRAF8R9YQM5Z9', 3, 2, 3, N'Q', N'QW', N'MQ9', N'', 1)
INSERT [dbo].[LabTestDim] ([LAB_TST_SK], [SRC_TST_ID], [RSULT_LAB_CDS], [TST_CDS], [ABNRML_LEVL_DESC], [VRFCTN_STS_CDS], [ORDR_PRTY_CDS], [ORDR_SRC_TYPE_CDS], [SPCMN_NM], [SPCMN_TYPE_CDS], [SPCMN_SRC_CDS], [CNCL_RSN_CDS], [HI_PRTY_IND], [CORR_IND], [CRTCL_IND], [ABNRML_IND], [ORDR_TYPE_CDS]) VALUES (3, N'89539', -461039111, 4, N'Versus novum homo, pladior habitatio egreddior', 5, 3, 1, N'N31P3DJXSGY0WK3Z0X7XQ9UKCI7', 2, 5, 5, N'', N'VS1', N'Y', N'C3M', 2)
INSERT [dbo].[LabTestDim] ([LAB_TST_SK], [SRC_TST_ID], [RSULT_LAB_CDS], [TST_CDS], [ABNRML_LEVL_DESC], [VRFCTN_STS_CDS], [ORDR_PRTY_CDS], [ORDR_SRC_TYPE_CDS], [SPCMN_NM], [SPCMN_TYPE_CDS], [SPCMN_SRC_CDS], [CNCL_RSN_CDS], [HI_PRTY_IND], [CORR_IND], [CRTCL_IND], [ABNRML_IND], [ORDR_TYPE_CDS]) VALUES (4, N'07607', -1878794785, 5, N'vantis. homo, in quad esset bono egreddior', 4, 4, 3, N'2YMXEUKS7AG0FLYTG8VPUQM7SC5E8HDL5RVUT1L1ZBSPH6H5A033MI', 1, 1, 2, N'JP', N'', NULL, N'1', 3)
INSERT [dbo].[LabTestDim] ([LAB_TST_SK], [SRC_TST_ID], [RSULT_LAB_CDS], [TST_CDS], [ABNRML_LEVL_DESC], [VRFCTN_STS_CDS], [ORDR_PRTY_CDS], [ORDR_SRC_TYPE_CDS], [SPCMN_NM], [SPCMN_TYPE_CDS], [SPCMN_SRC_CDS], [CNCL_RSN_CDS], [HI_PRTY_IND], [CORR_IND], [CRTCL_IND], [ABNRML_IND], [ORDR_TYPE_CDS]) VALUES (5, N'25742', 992869053, 2, N'travissimantor nomen quantare homo, regit,', 2, 2, 2, N'BBF41P6JQXUVOP40F', 4, 3, 4, N'', N'8U', N'Z', N'2PE', 4)
SET IDENTITY_INSERT [dbo].[LabTestDim] OFF
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[LabTestDim-LabTestCancellationReasonDim]') AND parent_object_id = OBJECT_ID(N'[dbo].[LabTestDim]'))
ALTER TABLE [dbo].[LabTestDim]  WITH CHECK ADD  CONSTRAINT [LabTestDim-LabTestCancellationReasonDim] FOREIGN KEY([CNCL_RSN_CDS])
REFERENCES [dbo].[LabTestCancellationReasonDim] ([CNCL_RSN_CDS])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[LabTestDim-LabTestCancellationReasonDim]') AND parent_object_id = OBJECT_ID(N'[dbo].[LabTestDim]'))
ALTER TABLE [dbo].[LabTestDim] CHECK CONSTRAINT [LabTestDim-LabTestCancellationReasonDim]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[LabTestDim-LabTestNameDim]') AND parent_object_id = OBJECT_ID(N'[dbo].[LabTestDim]'))
ALTER TABLE [dbo].[LabTestDim]  WITH CHECK ADD  CONSTRAINT [LabTestDim-LabTestNameDim] FOREIGN KEY([TST_CDS])
REFERENCES [dbo].[LabTestNameDim] ([TST_CDS])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[LabTestDim-LabTestNameDim]') AND parent_object_id = OBJECT_ID(N'[dbo].[LabTestDim]'))
ALTER TABLE [dbo].[LabTestDim] CHECK CONSTRAINT [LabTestDim-LabTestNameDim]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[LabTestDim-LabTestOrderPriorityDim]') AND parent_object_id = OBJECT_ID(N'[dbo].[LabTestDim]'))
ALTER TABLE [dbo].[LabTestDim]  WITH CHECK ADD  CONSTRAINT [LabTestDim-LabTestOrderPriorityDim] FOREIGN KEY([ORDR_PRTY_CDS])
REFERENCES [dbo].[LabTestOrderPriorityDim] ([ORDR_PRTY_CDS])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[LabTestDim-LabTestOrderPriorityDim]') AND parent_object_id = OBJECT_ID(N'[dbo].[LabTestDim]'))
ALTER TABLE [dbo].[LabTestDim] CHECK CONSTRAINT [LabTestDim-LabTestOrderPriorityDim]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[LabTestDim-LabTestOrderSourceTypeDim]') AND parent_object_id = OBJECT_ID(N'[dbo].[LabTestDim]'))
ALTER TABLE [dbo].[LabTestDim]  WITH CHECK ADD  CONSTRAINT [LabTestDim-LabTestOrderSourceTypeDim] FOREIGN KEY([ORDR_SRC_TYPE_CDS])
REFERENCES [dbo].[LabTestOrderSourceTypeDim] ([ORDR_SRC_TYPE_CDS])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[LabTestDim-LabTestOrderSourceTypeDim]') AND parent_object_id = OBJECT_ID(N'[dbo].[LabTestDim]'))
ALTER TABLE [dbo].[LabTestDim] CHECK CONSTRAINT [LabTestDim-LabTestOrderSourceTypeDim]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[LabTestDim-LabTestOrderType]') AND parent_object_id = OBJECT_ID(N'[dbo].[LabTestDim]'))
ALTER TABLE [dbo].[LabTestDim]  WITH CHECK ADD  CONSTRAINT [LabTestDim-LabTestOrderType] FOREIGN KEY([ORDR_TYPE_CDS])
REFERENCES [dbo].[LabTestOrderTypeDim] ([ORDR_TYPE_CDS])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[LabTestDim-LabTestOrderType]') AND parent_object_id = OBJECT_ID(N'[dbo].[LabTestDim]'))
ALTER TABLE [dbo].[LabTestDim] CHECK CONSTRAINT [LabTestDim-LabTestOrderType]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[LabTestDim-LabTestSpecimenSourceDim]') AND parent_object_id = OBJECT_ID(N'[dbo].[LabTestDim]'))
ALTER TABLE [dbo].[LabTestDim]  WITH CHECK ADD  CONSTRAINT [LabTestDim-LabTestSpecimenSourceDim] FOREIGN KEY([SPCMN_SRC_CDS])
REFERENCES [dbo].[LabTestSpecimenSourceDim] ([SPCMN_SRC_CDS])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[LabTestDim-LabTestSpecimenSourceDim]') AND parent_object_id = OBJECT_ID(N'[dbo].[LabTestDim]'))
ALTER TABLE [dbo].[LabTestDim] CHECK CONSTRAINT [LabTestDim-LabTestSpecimenSourceDim]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[LabTestDim-LabTestSpecimenTypeDim]') AND parent_object_id = OBJECT_ID(N'[dbo].[LabTestDim]'))
ALTER TABLE [dbo].[LabTestDim]  WITH CHECK ADD  CONSTRAINT [LabTestDim-LabTestSpecimenTypeDim] FOREIGN KEY([SPCMN_TYPE_CDS])
REFERENCES [dbo].[LabTestSpecimenTypeDim] ([SPCMN_TYPE_CDS])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[LabTestDim-LabTestSpecimenTypeDim]') AND parent_object_id = OBJECT_ID(N'[dbo].[LabTestDim]'))
ALTER TABLE [dbo].[LabTestDim] CHECK CONSTRAINT [LabTestDim-LabTestSpecimenTypeDim]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[LabTestDim-LabTestVerificationStatusDim]') AND parent_object_id = OBJECT_ID(N'[dbo].[LabTestDim]'))
ALTER TABLE [dbo].[LabTestDim]  WITH CHECK ADD  CONSTRAINT [LabTestDim-LabTestVerificationStatusDim] FOREIGN KEY([VRFCTN_STS_CDS])
REFERENCES [dbo].[LabTestVerificationStatusDim] ([VRFCTN_STS_CDS])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[LabTestDim-LabTestVerificationStatusDim]') AND parent_object_id = OBJECT_ID(N'[dbo].[LabTestDim]'))
ALTER TABLE [dbo].[LabTestDim] CHECK CONSTRAINT [LabTestDim-LabTestVerificationStatusDim]
GO
