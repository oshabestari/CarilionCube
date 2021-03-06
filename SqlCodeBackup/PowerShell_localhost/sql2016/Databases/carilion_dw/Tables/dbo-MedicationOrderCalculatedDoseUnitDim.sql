SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MedicationOrderCalculatedDoseUnitDim](
	[CLCLTD_DOSE_UNT_CDS] [int] IDENTITY(1,1) NOT NULL,
	[CLCLTD_DOSE_UNT_DESC] [varchar](255) NULL,
 CONSTRAINT [PK_MedicationOrderCalculatedDoseUnitDim_CLCLTD_DOSE_UNT_CDS] PRIMARY KEY CLUSTERED 
(
	[CLCLTD_DOSE_UNT_CDS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
