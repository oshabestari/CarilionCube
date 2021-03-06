SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DiagnosisBridge](
	[DIAG_CD_SK] [int] IDENTITY(1,1) NOT NULL,
	[DIAG_CD_DESC] [varchar](255) NULL,
	[MSTR_DIAG_CD] [varchar](50) NULL,
	[ICD9_CD] [varchar](50) NULL,
	[ICD9_CD_LST] [varchar](255) NULL,
	[ICD10_CD] [varchar](50) NULL,
	[ICD10_CD_LST] [varchar](255) NULL,
	[DIAG_HIR_SK] [int] NULL,
 CONSTRAINT [PK_DiagnosisBridge_DIAG_CD_SK] PRIMARY KEY CLUSTERED 
(
	[DIAG_CD_SK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DiagnosisBridge]  WITH CHECK ADD  CONSTRAINT [DiagnosisBridge-DiagnosisHierarchy] FOREIGN KEY([DIAG_HIR_SK])
REFERENCES [dbo].[DiagnosisHierarchy] ([DIAG_HIR_SK])
GO
ALTER TABLE [dbo].[DiagnosisBridge] CHECK CONSTRAINT [DiagnosisBridge-DiagnosisHierarchy]
GO
