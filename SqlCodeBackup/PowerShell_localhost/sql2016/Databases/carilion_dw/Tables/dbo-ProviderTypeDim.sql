SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProviderTypeDim](
	[PROVDR_TYPE_CDS] [int] IDENTITY(1,1) NOT NULL,
	[PROVDR_TYPE_DESC] [varchar](254) NULL,
 CONSTRAINT [PK_ProviderTypeDim_PROVDR_TYPE_CDS] PRIMARY KEY CLUSTERED 
(
	[PROVDR_TYPE_CDS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
