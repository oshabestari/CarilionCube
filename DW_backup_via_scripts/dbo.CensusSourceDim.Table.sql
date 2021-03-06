USE [carilion_dw]
GO
set nocount on
GO

GO
/****** Object:  Table [dbo].[CensusSourceDim]    Script Date: 6/21/2018 11:44:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CensusSourceDim]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CensusSourceDim](
	[SRC_SK] [int] IDENTITY(1,1) NOT NULL,
	[SRC_DESC] [varchar](255) NULL,
	[SRC_YR] [varchar](50) NULL,
	[SRC_ESTMTE_IN_YRS] [varchar](16) NULL,
 CONSTRAINT [PK_CensusSourceDim_SRC_SK] PRIMARY KEY CLUSTERED 
(
	[SRC_SK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[CensusSourceDim] ON 

INSERT [dbo].[CensusSourceDim] ([SRC_SK], [SRC_DESC], [SRC_YR], [SRC_ESTMTE_IN_YRS]) VALUES (1, N'quad trepicandor rarendum quo non Pro quis brevens, non linguens cognitio, imaginator estis trepicandor travissimantor', N'878ES1CYEEUTHGBHRM2', N'JXGUNHU3S5MHZ6')
INSERT [dbo].[CensusSourceDim] ([SRC_SK], [SRC_DESC], [SRC_YR], [SRC_ESTMTE_IN_YRS]) VALUES (2, N'homo, et travissimantor non transit. venit. nomen quad esset pladior Sed non esset quantare Versus et Sed', N'8KNBA9UGG2W7QKDL54TI8R0INKNHUIOVCQ', N'')
INSERT [dbo].[CensusSourceDim] ([SRC_SK], [SRC_DESC], [SRC_YR], [SRC_ESTMTE_IN_YRS]) VALUES (3, N'Multum glavans trepicandor ut egreddior trepicandor apparens essit. transit. Multum Sed esset venit. pladior', N'OKX3J7VICIM2W3PBMSK2GJ4OQLCMXD0', N'D')
INSERT [dbo].[CensusSourceDim] ([SRC_SK], [SRC_DESC], [SRC_YR], [SRC_ESTMTE_IN_YRS]) VALUES (4, N'si quad habitatio estis quoque Sed et et rarendum gravis in vantis. Longam, linguens novum Tam quartu', N'Z6O1819B', N'GGHQ0F')
INSERT [dbo].[CensusSourceDim] ([SRC_SK], [SRC_DESC], [SRC_YR], [SRC_ESTMTE_IN_YRS]) VALUES (5, N'essit. quis fecit, Longam, linguens Sed gravum funem. nomen bono quo, egreddior parte glavans ut quorum', N'9O00HRE5622SNX4F8DYU9LYHS3PEO3LI', N'3')
SET IDENTITY_INSERT [dbo].[CensusSourceDim] OFF
