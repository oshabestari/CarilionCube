USE [carilion_dw]
GO
set nocount on
GO

GO
/****** Object:  Table [dbo].[LabTestCancellationReasonDim]    Script Date: 6/21/2018 11:44:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LabTestCancellationReasonDim]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[LabTestCancellationReasonDim](
	[CNCL_RSN_CDS] [int] IDENTITY(1,1) NOT NULL,
	[CNCL_RSN_DESC] [varchar](255) NULL,
 CONSTRAINT [PK_LabTestCancellationReasonDim_CNCL_RSN_CDS] PRIMARY KEY CLUSTERED 
(
	[CNCL_RSN_CDS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[LabTestCancellationReasonDim] ON 

INSERT [dbo].[LabTestCancellationReasonDim] ([CNCL_RSN_CDS], [CNCL_RSN_DESC]) VALUES (1, N'fecundio, nomen quis gravum et Quad delerium. regit, in et nomen eudis eudis Et quad Et plorum pars parte cognitio,')
INSERT [dbo].[LabTestCancellationReasonDim] ([CNCL_RSN_CDS], [CNCL_RSN_DESC]) VALUES (2, N'si si novum in quad novum plorum quoque nomen quad Longam, non quantare apparens quo, et quad novum parte Et e')
INSERT [dbo].[LabTestCancellationReasonDim] ([CNCL_RSN_CDS], [CNCL_RSN_DESC]) VALUES (3, N'quorum venit. Id imaginator linguens trepicandor habitatio linguens eudis homo, eggredior. Versus rarendum e')
INSERT [dbo].[LabTestCancellationReasonDim] ([CNCL_RSN_CDS], [CNCL_RSN_DESC]) VALUES (4, N'quartu quad transit. egreddior dolorum fecit. pladior trepicandor dolorum e volcans Quad Multum fecit.')
INSERT [dbo].[LabTestCancellationReasonDim] ([CNCL_RSN_CDS], [CNCL_RSN_DESC]) VALUES (5, N'estis gravis Pro apparens estum. nomen funem. funem. Longam, travissimantor nomen Pro plorum plorum et et rarendum nomen gravis pladior')
SET IDENTITY_INSERT [dbo].[LabTestCancellationReasonDim] OFF
