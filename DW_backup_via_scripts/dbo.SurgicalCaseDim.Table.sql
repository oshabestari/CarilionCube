USE [carilion_dw]
GO
set nocount on
GO

GO
/****** Object:  Table [dbo].[SurgicalCaseDim]    Script Date: 6/21/2018 11:44:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SurgicalCaseDim]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SurgicalCaseDim](
	[CASE_SK] [bigint] IDENTITY(1,1) NOT NULL,
	[PRMY_SRVC_CDS] [int] NULL,
	[PRCDR_LEVL_CDS] [int] NULL,
	[CL_CDS] [int] NULL,
	[SRG_PTNT_CLASS_CDS] [int] NULL,
	[PRMY_ANSTH_TYPE_CDS] [int] NULL,
	[RSN_NOT_PRFRM_CDS] [int] NULL,
 CONSTRAINT [PK_SurgicalCaseDim_CASE_SK] PRIMARY KEY CLUSTERED 
(
	[CASE_SK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[SurgicalCaseDim] ON 

INSERT [dbo].[SurgicalCaseDim] ([CASE_SK], [PRMY_SRVC_CDS], [PRCDR_LEVL_CDS], [CL_CDS], [SRG_PTNT_CLASS_CDS], [PRMY_ANSTH_TYPE_CDS], [RSN_NOT_PRFRM_CDS]) VALUES (1, 4, 5, 3, 2, 4, 2)
INSERT [dbo].[SurgicalCaseDim] ([CASE_SK], [PRMY_SRVC_CDS], [PRCDR_LEVL_CDS], [CL_CDS], [SRG_PTNT_CLASS_CDS], [PRMY_ANSTH_TYPE_CDS], [RSN_NOT_PRFRM_CDS]) VALUES (2, 5, 4, 4, 1, 2, 4)
INSERT [dbo].[SurgicalCaseDim] ([CASE_SK], [PRMY_SRVC_CDS], [PRCDR_LEVL_CDS], [CL_CDS], [SRG_PTNT_CLASS_CDS], [PRMY_ANSTH_TYPE_CDS], [RSN_NOT_PRFRM_CDS]) VALUES (3, 1, 3, 5, 4, 1, 5)
INSERT [dbo].[SurgicalCaseDim] ([CASE_SK], [PRMY_SRVC_CDS], [PRCDR_LEVL_CDS], [CL_CDS], [SRG_PTNT_CLASS_CDS], [PRMY_ANSTH_TYPE_CDS], [RSN_NOT_PRFRM_CDS]) VALUES (4, 3, 1, 2, 5, 3, 1)
INSERT [dbo].[SurgicalCaseDim] ([CASE_SK], [PRMY_SRVC_CDS], [PRCDR_LEVL_CDS], [CL_CDS], [SRG_PTNT_CLASS_CDS], [PRMY_ANSTH_TYPE_CDS], [RSN_NOT_PRFRM_CDS]) VALUES (5, 2, 2, 1, 3, 5, 3)
SET IDENTITY_INSERT [dbo].[SurgicalCaseDim] OFF
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[SurgicalCaseDim-SurgicalCaseClassDim]') AND parent_object_id = OBJECT_ID(N'[dbo].[SurgicalCaseDim]'))
ALTER TABLE [dbo].[SurgicalCaseDim]  WITH CHECK ADD  CONSTRAINT [SurgicalCaseDim-SurgicalCaseClassDim] FOREIGN KEY([CL_CDS])
REFERENCES [dbo].[SurgicalCaseClassDim] ([CL_CDS])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[SurgicalCaseDim-SurgicalCaseClassDim]') AND parent_object_id = OBJECT_ID(N'[dbo].[SurgicalCaseDim]'))
ALTER TABLE [dbo].[SurgicalCaseDim] CHECK CONSTRAINT [SurgicalCaseDim-SurgicalCaseClassDim]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[SurgicalCaseDim-SurgicalCasePatientClassDim]') AND parent_object_id = OBJECT_ID(N'[dbo].[SurgicalCaseDim]'))
ALTER TABLE [dbo].[SurgicalCaseDim]  WITH CHECK ADD  CONSTRAINT [SurgicalCaseDim-SurgicalCasePatientClassDim] FOREIGN KEY([SRG_PTNT_CLASS_CDS])
REFERENCES [dbo].[SurgicalCasePatientClassDim] ([SRG_PTNT_CLASS_CDS])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[SurgicalCaseDim-SurgicalCasePatientClassDim]') AND parent_object_id = OBJECT_ID(N'[dbo].[SurgicalCaseDim]'))
ALTER TABLE [dbo].[SurgicalCaseDim] CHECK CONSTRAINT [SurgicalCaseDim-SurgicalCasePatientClassDim]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[SurgicalCaseDim-SurgicalCasePrimaryAnesthesiaTypeDim]') AND parent_object_id = OBJECT_ID(N'[dbo].[SurgicalCaseDim]'))
ALTER TABLE [dbo].[SurgicalCaseDim]  WITH CHECK ADD  CONSTRAINT [SurgicalCaseDim-SurgicalCasePrimaryAnesthesiaTypeDim] FOREIGN KEY([PRMY_ANSTH_TYPE_CDS])
REFERENCES [dbo].[SurgicalCasePrimaryAnesthesiaTypeDim] ([PRMY_ANSTH_TYPE_CDS])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[SurgicalCaseDim-SurgicalCasePrimaryAnesthesiaTypeDim]') AND parent_object_id = OBJECT_ID(N'[dbo].[SurgicalCaseDim]'))
ALTER TABLE [dbo].[SurgicalCaseDim] CHECK CONSTRAINT [SurgicalCaseDim-SurgicalCasePrimaryAnesthesiaTypeDim]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[SurgicalCaseDim-SurgicalCasePrimaryServiceDim]') AND parent_object_id = OBJECT_ID(N'[dbo].[SurgicalCaseDim]'))
ALTER TABLE [dbo].[SurgicalCaseDim]  WITH CHECK ADD  CONSTRAINT [SurgicalCaseDim-SurgicalCasePrimaryServiceDim] FOREIGN KEY([PRMY_SRVC_CDS])
REFERENCES [dbo].[SurgicalCasePrimaryServiceDim] ([PRMY_SRVC_CDS])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[SurgicalCaseDim-SurgicalCasePrimaryServiceDim]') AND parent_object_id = OBJECT_ID(N'[dbo].[SurgicalCaseDim]'))
ALTER TABLE [dbo].[SurgicalCaseDim] CHECK CONSTRAINT [SurgicalCaseDim-SurgicalCasePrimaryServiceDim]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[SurgicalCaseDim-SurgicalCaseProcedureLevelDim]') AND parent_object_id = OBJECT_ID(N'[dbo].[SurgicalCaseDim]'))
ALTER TABLE [dbo].[SurgicalCaseDim]  WITH CHECK ADD  CONSTRAINT [SurgicalCaseDim-SurgicalCaseProcedureLevelDim] FOREIGN KEY([PRCDR_LEVL_CDS])
REFERENCES [dbo].[SurgicalCaseProcedureLevelDim] ([PRCDR_LEVL_CDS])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[SurgicalCaseDim-SurgicalCaseProcedureLevelDim]') AND parent_object_id = OBJECT_ID(N'[dbo].[SurgicalCaseDim]'))
ALTER TABLE [dbo].[SurgicalCaseDim] CHECK CONSTRAINT [SurgicalCaseDim-SurgicalCaseProcedureLevelDim]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[SurgicalCaseDim-SurgicalCaseReasonNotPerformedDim]') AND parent_object_id = OBJECT_ID(N'[dbo].[SurgicalCaseDim]'))
ALTER TABLE [dbo].[SurgicalCaseDim]  WITH CHECK ADD  CONSTRAINT [SurgicalCaseDim-SurgicalCaseReasonNotPerformedDim] FOREIGN KEY([RSN_NOT_PRFRM_CDS])
REFERENCES [dbo].[SurgicalCaseReasonNotPerformedDim] ([RSN_NOT_PRFRM_CDS])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[SurgicalCaseDim-SurgicalCaseReasonNotPerformedDim]') AND parent_object_id = OBJECT_ID(N'[dbo].[SurgicalCaseDim]'))
ALTER TABLE [dbo].[SurgicalCaseDim] CHECK CONSTRAINT [SurgicalCaseDim-SurgicalCaseReasonNotPerformedDim]
GO
