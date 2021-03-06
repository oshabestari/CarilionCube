USE [carilion_dw]
GO
set nocount on
GO

GO
/****** Object:  Table [dbo].[MedicationOrderRouteDim]    Script Date: 6/21/2018 11:44:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MedicationOrderRouteDim]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[MedicationOrderRouteDim](
	[RT_CDS] [int] IDENTITY(1,1) NOT NULL,
	[RT_DESC] [varchar](255) NULL,
 CONSTRAINT [PK_MedicationOrderRouteDim_RT_CDS] PRIMARY KEY CLUSTERED 
(
	[RT_CDS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[MedicationOrderRouteDim] ON 

INSERT [dbo].[MedicationOrderRouteDim] ([RT_CDS], [RT_DESC]) VALUES (1, N'venit. linguens quo in quartu venit. habitatio glavans quis habitatio fecit, glavans Tam plurissimum pladior')
INSERT [dbo].[MedicationOrderRouteDim] ([RT_CDS], [RT_DESC]) VALUES (2, N'apparens plorum habitatio et delerium. linguens eggredior. quantare e non Versus Quad fecundio, rarendum si')
INSERT [dbo].[MedicationOrderRouteDim] ([RT_CDS], [RT_DESC]) VALUES (3, N'et et Multum manifestum manifestum Et cognitio, Longam, non eudis parte si brevens, manifestum quad nomen')
INSERT [dbo].[MedicationOrderRouteDim] ([RT_CDS], [RT_DESC]) VALUES (4, N'Quad Pro estum. homo, Multum estis quantare fecit, ut bono essit. si quo Id delerium. eggredior. trepicandor')
INSERT [dbo].[MedicationOrderRouteDim] ([RT_CDS], [RT_DESC]) VALUES (5, N'habitatio gravis quorum bono Multum non ut et essit. Quad plorum esset apparens venit. rarendum plorum')
SET IDENTITY_INSERT [dbo].[MedicationOrderRouteDim] OFF
