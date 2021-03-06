USE [carilion_dw]
GO
set nocount on
GO

GO
/****** Object:  Table [dbo].[InpatientPatientClassDim]    Script Date: 6/21/2018 11:44:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[InpatientPatientClassDim]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[InpatientPatientClassDim](
	[PTNT_CL_CDS] [int] IDENTITY(1,1) NOT NULL,
	[PTNT_CL_DESC] [varchar](255) NULL,
 CONSTRAINT [PK_InpatientPatientClassDim_PTNT_CL_CDS] PRIMARY KEY CLUSTERED 
(
	[PTNT_CL_CDS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[InpatientPatientClassDim] ON 

INSERT [dbo].[InpatientPatientClassDim] ([PTNT_CL_CDS], [PTNT_CL_DESC]) VALUES (1, N'quo delerium. e novum plorum quoque homo, e quad e travissimantor venit. Tam quad nomen Id et quo pars vantis. e')
INSERT [dbo].[InpatientPatientClassDim] ([PTNT_CL_CDS], [PTNT_CL_DESC]) VALUES (2, N'pladior quantare si e parte linguens Id venit. si plorum quad fecit, et quoque vobis plorum quo cognitio,')
INSERT [dbo].[InpatientPatientClassDim] ([PTNT_CL_CDS], [PTNT_CL_DESC]) VALUES (3, N'parte quad homo, gravis pars quantare eggredior. et parte linguens estis quartu Sed vobis e quo quad esset vobis')
INSERT [dbo].[InpatientPatientClassDim] ([PTNT_CL_CDS], [PTNT_CL_DESC]) VALUES (4, N'regit, novum non linguens plurissimum quo, egreddior estum. non estum. habitatio fecundio, in in novum')
INSERT [dbo].[InpatientPatientClassDim] ([PTNT_CL_CDS], [PTNT_CL_DESC]) VALUES (5, N'essit. gravum funem. manifestum fecit, quorum quo parte Id linguens Sed cognitio, quad nomen vantis.')
SET IDENTITY_INSERT [dbo].[InpatientPatientClassDim] OFF
