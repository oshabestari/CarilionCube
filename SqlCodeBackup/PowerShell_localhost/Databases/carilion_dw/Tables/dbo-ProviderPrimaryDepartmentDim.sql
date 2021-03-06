SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProviderPrimaryDepartmentDim](
	[PRMY_DEPT_CDS] [int] IDENTITY(1,1) NOT NULL,
	[PRMY_DEPT_NM] [varchar](254) NULL,
 CONSTRAINT [PK_ProviderPrimaryDepartmentDim_PRMY_DEPT_CDS] PRIMARY KEY CLUSTERED 
(
	[PRMY_DEPT_CDS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
