SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MedicationOrderDoseUnitDim](
	[DOSE_UNT_CDS] [int] IDENTITY(1,1) NOT NULL,
	[DOSE_UNT_DESC] [varchar](255) NULL,
 CONSTRAINT [PK_MedicationOrderDoseUnitDim_DOSE_UNT_CDS] PRIMARY KEY CLUSTERED 
(
	[DOSE_UNT_CDS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
