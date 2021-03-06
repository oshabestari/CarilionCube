SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SurgicalCaseReasonNotPerformedDim](
	[RSN_NOT_PRFRM_CDS] [int] IDENTITY(1,1) NOT NULL,
	[RSN_NOT_PRFRM_DESC] [varchar](254) NULL,
 CONSTRAINT [PK_SurgicalCaseReasonNotPerformedDim_RSN_NOT_PRFRM_CDS] PRIMARY KEY CLUSTERED 
(
	[RSN_NOT_PRFRM_CDS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
