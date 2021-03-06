SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OutpatientAppointmentStatusDim](
	[APPT_STTS_CDS] [int] IDENTITY(1,1) NOT NULL,
	[APPT_STTS_NM] [varchar](255) NULL,
 CONSTRAINT [PK_OutpatientAppointmentStatusDim_APPT_STTS_CDS] PRIMARY KEY CLUSTERED 
(
	[APPT_STTS_CDS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
