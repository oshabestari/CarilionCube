USE [carilion_dw]
GO
set nocount on
GO

GO
/****** Object:  Table [dbo].[SurgicalCaseReasonNotPerformedDim]    Script Date: 6/21/2018 11:44:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SurgicalCaseReasonNotPerformedDim]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SurgicalCaseReasonNotPerformedDim](
	[RSN_NOT_PRFRM_CDS] [int] IDENTITY(1,1) NOT NULL,
	[RSN_NOT_PRFRM_DESC] [varchar](254) NULL,
 CONSTRAINT [PK_SurgicalCaseReasonNotPerformedDim_RSN_NOT_PRFRM_CDS] PRIMARY KEY CLUSTERED 
(
	[RSN_NOT_PRFRM_CDS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[SurgicalCaseReasonNotPerformedDim] ON 

INSERT [dbo].[SurgicalCaseReasonNotPerformedDim] ([RSN_NOT_PRFRM_CDS], [RSN_NOT_PRFRM_DESC]) VALUES (1, N'travissimantor travissimantor linguens quorum brevens, e gravis quoque brevens, Multum habitatio travissimantor')
INSERT [dbo].[SurgicalCaseReasonNotPerformedDim] ([RSN_NOT_PRFRM_CDS], [RSN_NOT_PRFRM_DESC]) VALUES (2, N'dolorum fecit. eggredior. ut rarendum sed Pro et non et in rarendum quis quantare vobis Et essit. nomen fecundio,')
INSERT [dbo].[SurgicalCaseReasonNotPerformedDim] ([RSN_NOT_PRFRM_CDS], [RSN_NOT_PRFRM_DESC]) VALUES (3, N'quo fecit. fecundio, essit. egreddior novum e et quorum et esset et Id quantare linguens quo e parte')
INSERT [dbo].[SurgicalCaseReasonNotPerformedDim] ([RSN_NOT_PRFRM_CDS], [RSN_NOT_PRFRM_DESC]) VALUES (4, N'manifestum gravum funem. in vobis linguens quad esset e quorum Pro glavans manifestum vobis Id plurissimum')
INSERT [dbo].[SurgicalCaseReasonNotPerformedDim] ([RSN_NOT_PRFRM_CDS], [RSN_NOT_PRFRM_DESC]) VALUES (5, N'estum. eggredior. estum. pladior fecundio, linguens sed quo, eudis non et Id Et imaginator quo, glavans')
SET IDENTITY_INSERT [dbo].[SurgicalCaseReasonNotPerformedDim] OFF
