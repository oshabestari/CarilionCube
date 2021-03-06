USE [carilion_dw]
GO
set nocount on
GO

GO
/****** Object:  Table [dbo].[LabTestOrderSourceTypeDim]    Script Date: 6/21/2018 11:44:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LabTestOrderSourceTypeDim]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[LabTestOrderSourceTypeDim](
	[ORDR_SRC_TYPE_CDS] [int] IDENTITY(1,1) NOT NULL,
	[ORDR_SRC_TYPE_DESC] [varchar](255) NULL,
 CONSTRAINT [PK_LabTestOrderSourceTypeDim_ORDR_SRC_TYPE_CDS] PRIMARY KEY CLUSTERED 
(
	[ORDR_SRC_TYPE_CDS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[LabTestOrderSourceTypeDim] ON 

INSERT [dbo].[LabTestOrderSourceTypeDim] ([ORDR_SRC_TYPE_CDS], [ORDR_SRC_TYPE_DESC]) VALUES (1, N'pladior gravis Tam delerium. imaginator plorum dolorum essit. fecit. et linguens regit, estum. et eudis estis')
INSERT [dbo].[LabTestOrderSourceTypeDim] ([ORDR_SRC_TYPE_CDS], [ORDR_SRC_TYPE_DESC]) VALUES (2, N'quo, Et nomen plorum regit, delerium. imaginator egreddior quad sed estum. nomen funem. plorum Sed nomen')
INSERT [dbo].[LabTestOrderSourceTypeDim] ([ORDR_SRC_TYPE_CDS], [ORDR_SRC_TYPE_DESC]) VALUES (3, N'Et fecundio, in si glavans quo, pars glavans novum et vantis. pladior gravis apparens estum. plorum quoque vobis')
INSERT [dbo].[LabTestOrderSourceTypeDim] ([ORDR_SRC_TYPE_CDS], [ORDR_SRC_TYPE_DESC]) VALUES (4, N'parte eggredior. gravum fecundio, et sed trepicandor homo, quad et fecit, imaginator quorum nomen Pro')
INSERT [dbo].[LabTestOrderSourceTypeDim] ([ORDR_SRC_TYPE_CDS], [ORDR_SRC_TYPE_DESC]) VALUES (5, NULL)
SET IDENTITY_INSERT [dbo].[LabTestOrderSourceTypeDim] OFF
