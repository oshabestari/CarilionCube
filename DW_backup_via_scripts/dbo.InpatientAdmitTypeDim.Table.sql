USE [carilion_dw]
GO
set nocount on
GO

GO
/****** Object:  Table [dbo].[InpatientAdmitTypeDim]    Script Date: 6/21/2018 11:44:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[InpatientAdmitTypeDim]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[InpatientAdmitTypeDim](
	[ADMT_TYPE_CDS] [int] IDENTITY(1,1) NOT NULL,
	[ADMT_TYPE_DESC] [varchar](255) NULL,
 CONSTRAINT [PK_InpatientAdmitTypeDim_ADMT_TYPE_CDS] PRIMARY KEY CLUSTERED 
(
	[ADMT_TYPE_CDS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[InpatientAdmitTypeDim] ON 

INSERT [dbo].[InpatientAdmitTypeDim] ([ADMT_TYPE_CDS], [ADMT_TYPE_DESC]) VALUES (1, N'linguens nomen dolorum et novum non Et quo manifestum glavans Versus si dolorum bono vobis quorum imaginator quorum')
INSERT [dbo].[InpatientAdmitTypeDim] ([ADMT_TYPE_CDS], [ADMT_TYPE_DESC]) VALUES (2, N'essit. Quad fecit, glavans gravis gravis si quad gravis quis plurissimum estum. vobis apparens et regit,')
INSERT [dbo].[InpatientAdmitTypeDim] ([ADMT_TYPE_CDS], [ADMT_TYPE_DESC]) VALUES (3, N'vobis quorum quartu novum Sed dolorum quo, gravum novum et non Quad delerium. quorum quad linguens quo habitatio')
INSERT [dbo].[InpatientAdmitTypeDim] ([ADMT_TYPE_CDS], [ADMT_TYPE_DESC]) VALUES (4, N'non parte in vantis. nomen ut homo, dolorum quo plorum quorum eudis non quo gravum fecit, manifestum travissimantor egreddior Longam,')
INSERT [dbo].[InpatientAdmitTypeDim] ([ADMT_TYPE_CDS], [ADMT_TYPE_DESC]) VALUES (5, N'estis et transit. homo, fecundio, parte quad esset volcans si ut et et Quad vobis si habitatio egreddior et brevens, quis pars')
SET IDENTITY_INSERT [dbo].[InpatientAdmitTypeDim] OFF
