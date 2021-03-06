SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
GO
ALTER TABLE [dbo].[LabTestDim]  WITH CHECK ADD  CONSTRAINT [LabTestDim-LabTestCancellationReasonDim] FOREIGN KEY([CNCL_RSN_CDS])
REFERENCES [dbo].[LabTestCancellationReasonDim] ([CNCL_RSN_CDS])
GO
ALTER TABLE [dbo].[LabTestDim] CHECK CONSTRAINT [LabTestDim-LabTestCancellationReasonDim]
GO
ALTER TABLE [dbo].[LabTestDim]  WITH CHECK ADD  CONSTRAINT [LabTestDim-LabTestNameDim] FOREIGN KEY([TST_CDS])
REFERENCES [dbo].[LabTestNameDim] ([TST_CDS])
GO
ALTER TABLE [dbo].[LabTestDim] CHECK CONSTRAINT [LabTestDim-LabTestNameDim]
GO
ALTER TABLE [dbo].[LabTestDim]  WITH CHECK ADD  CONSTRAINT [LabTestDim-LabTestOrderPriorityDim] FOREIGN KEY([ORDR_PRTY_CDS])
REFERENCES [dbo].[LabTestOrderPriorityDim] ([ORDR_PRTY_CDS])
GO
ALTER TABLE [dbo].[LabTestDim] CHECK CONSTRAINT [LabTestDim-LabTestOrderPriorityDim]
GO
ALTER TABLE [dbo].[LabTestDim]  WITH CHECK ADD  CONSTRAINT [LabTestDim-LabTestOrderSourceTypeDim] FOREIGN KEY([ORDR_SRC_TYPE_CDS])
REFERENCES [dbo].[LabTestOrderSourceTypeDim] ([ORDR_SRC_TYPE_CDS])
GO
ALTER TABLE [dbo].[LabTestDim] CHECK CONSTRAINT [LabTestDim-LabTestOrderSourceTypeDim]
GO
ALTER TABLE [dbo].[LabTestDim]  WITH CHECK ADD  CONSTRAINT [LabTestDim-LabTestOrderType] FOREIGN KEY([ORDR_TYPE_CDS])
REFERENCES [dbo].[LabTestOrderTypeDim] ([ORDR_TYPE_CDS])
GO
ALTER TABLE [dbo].[LabTestDim] CHECK CONSTRAINT [LabTestDim-LabTestOrderType]
GO
ALTER TABLE [dbo].[LabTestDim]  WITH CHECK ADD  CONSTRAINT [LabTestDim-LabTestSpecimenSourceDim] FOREIGN KEY([SPCMN_SRC_CDS])
REFERENCES [dbo].[LabTestSpecimenSourceDim] ([SPCMN_SRC_CDS])
GO
ALTER TABLE [dbo].[LabTestDim] CHECK CONSTRAINT [LabTestDim-LabTestSpecimenSourceDim]
GO
ALTER TABLE [dbo].[LabTestDim]  WITH CHECK ADD  CONSTRAINT [LabTestDim-LabTestSpecimenTypeDim] FOREIGN KEY([SPCMN_TYPE_CDS])
REFERENCES [dbo].[LabTestSpecimenTypeDim] ([SPCMN_TYPE_CDS])
GO
ALTER TABLE [dbo].[LabTestDim] CHECK CONSTRAINT [LabTestDim-LabTestSpecimenTypeDim]
GO
ALTER TABLE [dbo].[LabTestDim]  WITH CHECK ADD  CONSTRAINT [LabTestDim-LabTestVerificationStatusDim] FOREIGN KEY([VRFCTN_STS_CDS])
REFERENCES [dbo].[LabTestVerificationStatusDim] ([VRFCTN_STS_CDS])
GO
ALTER TABLE [dbo].[LabTestDim] CHECK CONSTRAINT [LabTestDim-LabTestVerificationStatusDim]
GO
