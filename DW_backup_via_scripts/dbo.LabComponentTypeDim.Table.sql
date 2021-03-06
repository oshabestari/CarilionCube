USE [carilion_dw]
GO
set nocount on
GO

GO
/****** Object:  Table [dbo].[LabComponentTypeDim]    Script Date: 6/21/2018 11:44:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LabComponentTypeDim]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[LabComponentTypeDim](
	[CMPNT_TYPE_CDS] [int] IDENTITY(1,1) NOT NULL,
	[CMPNT_TYPE_NM] [varchar](255) NULL,
 CONSTRAINT [PK_LabComponentTypeDim_CMPNT_TYPE_CDS] PRIMARY KEY CLUSTERED 
(
	[CMPNT_TYPE_CDS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[LabComponentTypeDim] ON 

INSERT [dbo].[LabComponentTypeDim] ([CMPNT_TYPE_CDS], [CMPNT_TYPE_NM]) VALUES (1, N'esset et pars in et Multum transit. brevens, regit, Et quad estis estis gravis delerium. pars nomen nomen')
INSERT [dbo].[LabComponentTypeDim] ([CMPNT_TYPE_CDS], [CMPNT_TYPE_NM]) VALUES (2, N'gravis plorum nomen non Quad quoque quo, gravis gravis plorum quad Sed Multum et quis et et si dolorum')
INSERT [dbo].[LabComponentTypeDim] ([CMPNT_TYPE_CDS], [CMPNT_TYPE_NM]) VALUES (3, N'quorum et delerium. eggredior. quad et gravum travissimantor novum linguens et quad linguens homo, plurissimum in plorum')
INSERT [dbo].[LabComponentTypeDim] ([CMPNT_TYPE_CDS], [CMPNT_TYPE_NM]) VALUES (4, N'et venit. Versus trepicandor estis quo et novum rarendum quo fecit, quad nomen quo Pro eudis non in manifestum egreddior imaginator')
INSERT [dbo].[LabComponentTypeDim] ([CMPNT_TYPE_CDS], [CMPNT_TYPE_NM]) VALUES (5, N'funem. pars et esset nomen in Pro essit. venit. plorum pars imaginator non dolorum Sed quad apparens')
SET IDENTITY_INSERT [dbo].[LabComponentTypeDim] OFF
