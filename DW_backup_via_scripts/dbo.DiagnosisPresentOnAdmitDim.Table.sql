USE [carilion_dw]
GO
set nocount on
GO

GO
/****** Object:  Table [dbo].[DiagnosisPresentOnAdmitDim]    Script Date: 6/21/2018 11:44:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DiagnosisPresentOnAdmitDim]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[DiagnosisPresentOnAdmitDim](
	[PRSNT_ON_ADMT_DESC] [varchar](255) NULL,
	[PRSNT_ON_ADMT_CD] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_DiagnosisPresentOnAdmitDim_PRSNT_ON_ADMT_CD] PRIMARY KEY CLUSTERED 
(
	[PRSNT_ON_ADMT_CD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[DiagnosisPresentOnAdmitDim] ON 

INSERT [dbo].[DiagnosisPresentOnAdmitDim] ([PRSNT_ON_ADMT_DESC], [PRSNT_ON_ADMT_CD]) VALUES (N'gravis quo, venit. vantis. Tam vobis Id travissimantor brevens, regit, Tam nomen vobis in travissimantor', 1)
INSERT [dbo].[DiagnosisPresentOnAdmitDim] ([PRSNT_ON_ADMT_DESC], [PRSNT_ON_ADMT_CD]) VALUES (N'Longam, gravum plorum et Tam Et gravis eggredior. regit, sed Pro glavans si trepicandor fecundio, manifestum', 2)
INSERT [dbo].[DiagnosisPresentOnAdmitDim] ([PRSNT_ON_ADMT_DESC], [PRSNT_ON_ADMT_CD]) VALUES (N'sed quad quoque eggredior. linguens trepicandor novum sed Versus volcans fecit. et quoque apparens plorum Versus', 3)
INSERT [dbo].[DiagnosisPresentOnAdmitDim] ([PRSNT_ON_ADMT_DESC], [PRSNT_ON_ADMT_CD]) VALUES (N'in delerium. in quoque vobis parte pars linguens quantare Longam, habitatio sed plorum sed dolorum linguens', 4)
INSERT [dbo].[DiagnosisPresentOnAdmitDim] ([PRSNT_ON_ADMT_DESC], [PRSNT_ON_ADMT_CD]) VALUES (N'in si et Tam parte delerium. et Multum apparens habitatio habitatio quartu Quad imaginator non eggredior. cognitio,', 5)
SET IDENTITY_INSERT [dbo].[DiagnosisPresentOnAdmitDim] OFF
