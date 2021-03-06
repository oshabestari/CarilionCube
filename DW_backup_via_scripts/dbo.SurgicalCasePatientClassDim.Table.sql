USE [carilion_dw]
GO
set nocount on
GO

GO
/****** Object:  Table [dbo].[SurgicalCasePatientClassDim]    Script Date: 6/21/2018 11:44:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SurgicalCasePatientClassDim]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SurgicalCasePatientClassDim](
	[SRG_PTNT_CLASS_CDS] [int] IDENTITY(1,1) NOT NULL,
	[SRG_PTNT_CLASS_DESC] [varchar](254) NULL,
 CONSTRAINT [PK_SurgicalCasePatientClassDim_SRG_PTNT_CLASS_CDS] PRIMARY KEY CLUSTERED 
(
	[SRG_PTNT_CLASS_CDS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[SurgicalCasePatientClassDim] ON 

INSERT [dbo].[SurgicalCasePatientClassDim] ([SRG_PTNT_CLASS_CDS], [SRG_PTNT_CLASS_DESC]) VALUES (1, N'brevens, non plorum apparens quoque quo gravis esset Et et in in novum travissimantor transit. et bono')
INSERT [dbo].[SurgicalCasePatientClassDim] ([SRG_PTNT_CLASS_CDS], [SRG_PTNT_CLASS_DESC]) VALUES (2, N'brevens, linguens homo, et plorum quartu quad estis estis vantis. sed quad si plorum quorum gravis delerium. in')
INSERT [dbo].[SurgicalCasePatientClassDim] ([SRG_PTNT_CLASS_CDS], [SRG_PTNT_CLASS_DESC]) VALUES (3, N'nomen quis plorum glavans trepicandor quo fecit. e quorum habitatio in dolorum delerium. egreddior Quad')
INSERT [dbo].[SurgicalCasePatientClassDim] ([SRG_PTNT_CLASS_CDS], [SRG_PTNT_CLASS_DESC]) VALUES (4, N'in quoque et homo, quad quo, egreddior quad linguens linguens Sed eudis quo, volcans fecit. et esset quantare')
INSERT [dbo].[SurgicalCasePatientClassDim] ([SRG_PTNT_CLASS_CDS], [SRG_PTNT_CLASS_DESC]) VALUES (5, N'pars in eggredior. travissimantor in gravis in fecundio, eggredior. imaginator quoque pladior gravis')
SET IDENTITY_INSERT [dbo].[SurgicalCasePatientClassDim] OFF
