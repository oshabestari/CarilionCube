USE [carilion_dw]
GO
set nocount on
GO

GO
/****** Object:  Table [dbo].[ProviderFieldOfPracticeDim]    Script Date: 6/21/2018 11:44:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProviderFieldOfPracticeDim]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ProviderFieldOfPracticeDim](
	[MU_FLD_OF_PRACT_CDS] [int] IDENTITY(1,1) NOT NULL,
	[MU_FLD_OF_PRACT_DESC] [varchar](254) NULL,
 CONSTRAINT [PK_ProviderFieldOfPracticeDim_MU_FLD_OF_PRACT_CDS] PRIMARY KEY CLUSTERED 
(
	[MU_FLD_OF_PRACT_CDS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[ProviderFieldOfPracticeDim] ON 

INSERT [dbo].[ProviderFieldOfPracticeDim] ([MU_FLD_OF_PRACT_CDS], [MU_FLD_OF_PRACT_DESC]) VALUES (1, N'apparens ut quad quoque eggredior. si vobis venit. quad gravis estum. et egreddior regit, regit, apparens Sed trepicandor linguens quo, Pro')
INSERT [dbo].[ProviderFieldOfPracticeDim] ([MU_FLD_OF_PRACT_CDS], [MU_FLD_OF_PRACT_DESC]) VALUES (2, N'quo, et regit, Multum et sed esset quo Multum e non travissimantor et dolorum plorum fecit, imaginator')
INSERT [dbo].[ProviderFieldOfPracticeDim] ([MU_FLD_OF_PRACT_CDS], [MU_FLD_OF_PRACT_DESC]) VALUES (3, N'quartu quis vobis funem. ut linguens et Quad quad et si et et quo venit. quo non quad trepicandor quis')
INSERT [dbo].[ProviderFieldOfPracticeDim] ([MU_FLD_OF_PRACT_CDS], [MU_FLD_OF_PRACT_DESC]) VALUES (4, N'in estis novum funem. non quo rarendum Longam, et nomen plorum in ut gravum eggredior. transit. Pro linguens')
INSERT [dbo].[ProviderFieldOfPracticeDim] ([MU_FLD_OF_PRACT_CDS], [MU_FLD_OF_PRACT_DESC]) VALUES (5, N'non fecit. gravis Longam, plorum glavans quoque essit. regit, novum parte quorum vantis. quorum Id fecit.')
SET IDENTITY_INSERT [dbo].[ProviderFieldOfPracticeDim] OFF
