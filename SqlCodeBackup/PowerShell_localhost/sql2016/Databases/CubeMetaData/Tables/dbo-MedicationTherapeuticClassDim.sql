SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MedicationTherapeuticClassDim](
	[THRPC_CLASS_CDS] [int] IDENTITY(1,1) NOT NULL,
	[THRPC_CLASS_DESC] [varchar](255) NULL,
 CONSTRAINT [PK_MedicationTherapeuticClassDim_THRPC_CLASS_CDS] PRIMARY KEY CLUSTERED 
(
	[THRPC_CLASS_CDS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
