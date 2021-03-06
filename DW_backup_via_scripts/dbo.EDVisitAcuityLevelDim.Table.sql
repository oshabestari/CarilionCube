USE [carilion_dw]
GO
set nocount on
GO

GO
/****** Object:  Table [dbo].[EDVisitAcuityLevelDim]    Script Date: 6/21/2018 11:44:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EDVisitAcuityLevelDim]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[EDVisitAcuityLevelDim](
	[ACTY_LVL_CDS] [int] IDENTITY(1,1) NOT NULL,
	[ACTY_LVL_DESC] [varchar](15) NULL,
 CONSTRAINT [PK_EDVisitAcuityLevelDim_ACTY_LVL_CDS] PRIMARY KEY CLUSTERED 
(
	[ACTY_LVL_CDS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[EDVisitAcuityLevelDim] ON 

INSERT [dbo].[EDVisitAcuityLevelDim] ([ACTY_LVL_CDS], [ACTY_LVL_DESC]) VALUES (1, N'Versus non bono')
INSERT [dbo].[EDVisitAcuityLevelDim] ([ACTY_LVL_CDS], [ACTY_LVL_DESC]) VALUES (2, N'vobis ut vobis')
INSERT [dbo].[EDVisitAcuityLevelDim] ([ACTY_LVL_CDS], [ACTY_LVL_DESC]) VALUES (3, N'estum. quo quo')
INSERT [dbo].[EDVisitAcuityLevelDim] ([ACTY_LVL_CDS], [ACTY_LVL_DESC]) VALUES (4, N'quorum quis')
INSERT [dbo].[EDVisitAcuityLevelDim] ([ACTY_LVL_CDS], [ACTY_LVL_DESC]) VALUES (5, N'novum volcans')
SET IDENTITY_INSERT [dbo].[EDVisitAcuityLevelDim] OFF
