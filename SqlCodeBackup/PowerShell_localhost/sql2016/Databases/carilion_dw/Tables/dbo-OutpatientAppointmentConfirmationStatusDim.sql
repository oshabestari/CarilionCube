SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OutpatientAppointmentConfirmationStatusDim](
	[APPT_CNF_STT_CDS] [int] IDENTITY(1,1) NOT NULL,
	[APPT_CNF_STT_NM] [varchar](255) NULL,
 CONSTRAINT [PK_OutpatientAppointmentConfirmationStatusDim_APPT_CNF_STT_CDS] PRIMARY KEY CLUSTERED 
(
	[APPT_CNF_STT_CDS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
