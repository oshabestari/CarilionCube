SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LabTestCancellationReasonDim](
	[CNCL_RSN_CDS] [int] IDENTITY(1,1) NOT NULL,
	[CNCL_RSN_DESC] [varchar](255) NULL,
 CONSTRAINT [PK_LabTestCancellationReasonDim_CNCL_RSN_CDS] PRIMARY KEY CLUSTERED 
(
	[CNCL_RSN_CDS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
