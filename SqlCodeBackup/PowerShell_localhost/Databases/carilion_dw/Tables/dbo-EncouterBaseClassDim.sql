SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EncouterBaseClassDim](
	[PTNT_BSE_CLSS_CDS] [int] IDENTITY(1,1) NOT NULL,
	[PTNT_BSE_CLSS_NM] [varchar](255) NULL,
 CONSTRAINT [PK_EncouterBaseClassDim_PTNT_BSE_CLSS_CDS] PRIMARY KEY CLUSTERED 
(
	[PTNT_BSE_CLSS_CDS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
