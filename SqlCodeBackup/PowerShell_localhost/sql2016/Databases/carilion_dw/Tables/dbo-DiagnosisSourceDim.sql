SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DiagnosisSourceDim](
	[SRC_TYPE] [varchar](50) NOT NULL,
	[SRC_TYPE_DSPLY_NM] [varchar](32) NULL,
 CONSTRAINT [PK_DiagnosisSourceDim_SRC_TYPE] PRIMARY KEY CLUSTERED 
(
	[SRC_TYPE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
