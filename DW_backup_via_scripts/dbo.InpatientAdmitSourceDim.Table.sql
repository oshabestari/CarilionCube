USE [carilion_dw]
GO
set nocount on
GO

GO
/****** Object:  Table [dbo].[InpatientAdmitSourceDim]    Script Date: 6/21/2018 11:44:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[InpatientAdmitSourceDim]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[InpatientAdmitSourceDim](
	[ADMT_SRC_CDS] [int] IDENTITY(1,1) NOT NULL,
	[ADMT_SRC_DESC] [varchar](255) NULL,
 CONSTRAINT [PK_InpatientAdmitSourceDim_ADMT_SRC_CDS] PRIMARY KEY CLUSTERED 
(
	[ADMT_SRC_CDS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[InpatientAdmitSourceDim] ON 

INSERT [dbo].[InpatientAdmitSourceDim] ([ADMT_SRC_CDS], [ADMT_SRC_DESC]) VALUES (1, N'fecit. non essit. plorum non novum vobis homo, imaginator plorum vantis. quantare sed sed e trepicandor egreddior Versus regit,')
INSERT [dbo].[InpatientAdmitSourceDim] ([ADMT_SRC_CDS], [ADMT_SRC_DESC]) VALUES (2, N'egreddior ut transit. fecundio, delerium. estum. essit. Multum quo funem. rarendum plorum essit. vantis.')
INSERT [dbo].[InpatientAdmitSourceDim] ([ADMT_SRC_CDS], [ADMT_SRC_DESC]) VALUES (3, N'quad et homo, quartu gravum quoque volcans e imaginator plurissimum glavans regit, e sed manifestum Tam gravum quad trepicandor in')
INSERT [dbo].[InpatientAdmitSourceDim] ([ADMT_SRC_CDS], [ADMT_SRC_DESC]) VALUES (4, N'homo, quad non apparens non brevens, bono manifestum apparens in bono funem. vobis e fecundio, non estum. estum.')
INSERT [dbo].[InpatientAdmitSourceDim] ([ADMT_SRC_CDS], [ADMT_SRC_DESC]) VALUES (5, N'e Tam imaginator et fecit. Id fecit. fecit, imaginator et si quoque glavans e in et sed regit, quo si')
SET IDENTITY_INSERT [dbo].[InpatientAdmitSourceDim] OFF
