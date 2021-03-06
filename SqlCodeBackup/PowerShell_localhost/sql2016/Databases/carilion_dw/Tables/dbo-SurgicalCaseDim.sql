SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
GO
ALTER TABLE [dbo].[SurgicalCaseDim]  WITH CHECK ADD  CONSTRAINT [SurgicalCaseDim-SurgicalCaseClassDim] FOREIGN KEY([CL_CDS])
REFERENCES [dbo].[SurgicalCaseClassDim] ([CL_CDS])
GO
ALTER TABLE [dbo].[SurgicalCaseDim] CHECK CONSTRAINT [SurgicalCaseDim-SurgicalCaseClassDim]
GO
ALTER TABLE [dbo].[SurgicalCaseDim]  WITH CHECK ADD  CONSTRAINT [SurgicalCaseDim-SurgicalCasePatientClassDim] FOREIGN KEY([SRG_PTNT_CLASS_CDS])
REFERENCES [dbo].[SurgicalCasePatientClassDim] ([SRG_PTNT_CLASS_CDS])
GO
ALTER TABLE [dbo].[SurgicalCaseDim] CHECK CONSTRAINT [SurgicalCaseDim-SurgicalCasePatientClassDim]
GO
ALTER TABLE [dbo].[SurgicalCaseDim]  WITH CHECK ADD  CONSTRAINT [SurgicalCaseDim-SurgicalCasePrimaryAnesthesiaTypeDim] FOREIGN KEY([PRMY_ANSTH_TYPE_CDS])
REFERENCES [dbo].[SurgicalCasePrimaryAnesthesiaTypeDim] ([PRMY_ANSTH_TYPE_CDS])
GO
ALTER TABLE [dbo].[SurgicalCaseDim] CHECK CONSTRAINT [SurgicalCaseDim-SurgicalCasePrimaryAnesthesiaTypeDim]
GO
ALTER TABLE [dbo].[SurgicalCaseDim]  WITH CHECK ADD  CONSTRAINT [SurgicalCaseDim-SurgicalCasePrimaryServiceDim] FOREIGN KEY([PRMY_SRVC_CDS])
REFERENCES [dbo].[SurgicalCasePrimaryServiceDim] ([PRMY_SRVC_CDS])
GO
ALTER TABLE [dbo].[SurgicalCaseDim] CHECK CONSTRAINT [SurgicalCaseDim-SurgicalCasePrimaryServiceDim]
GO
ALTER TABLE [dbo].[SurgicalCaseDim]  WITH CHECK ADD  CONSTRAINT [SurgicalCaseDim-SurgicalCaseProcedureLevelDim] FOREIGN KEY([PRCDR_LEVL_CDS])
REFERENCES [dbo].[SurgicalCaseProcedureLevelDim] ([PRCDR_LEVL_CDS])
GO
ALTER TABLE [dbo].[SurgicalCaseDim] CHECK CONSTRAINT [SurgicalCaseDim-SurgicalCaseProcedureLevelDim]
GO
ALTER TABLE [dbo].[SurgicalCaseDim]  WITH CHECK ADD  CONSTRAINT [SurgicalCaseDim-SurgicalCaseReasonNotPerformedDim] FOREIGN KEY([RSN_NOT_PRFRM_CDS])
REFERENCES [dbo].[SurgicalCaseReasonNotPerformedDim] ([RSN_NOT_PRFRM_CDS])
GO
ALTER TABLE [dbo].[SurgicalCaseDim] CHECK CONSTRAINT [SurgicalCaseDim-SurgicalCaseReasonNotPerformedDim]
GO
