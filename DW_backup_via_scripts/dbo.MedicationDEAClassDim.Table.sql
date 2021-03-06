USE [carilion_dw]
GO
set nocount on
GO

GO
/****** Object:  Table [dbo].[MedicationDEAClassDim]    Script Date: 6/21/2018 11:44:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MedicationDEAClassDim]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[MedicationDEAClassDim](
	[DEA_CLASS_CDS] [int] IDENTITY(1,1) NOT NULL,
	[DEA_CLASS_DESC] [varchar](255) NULL,
 CONSTRAINT [PK_MedicationDEAClassDim_DEA_CLASS_CDS] PRIMARY KEY CLUSTERED 
(
	[DEA_CLASS_CDS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[MedicationDEAClassDim] ON 

INSERT [dbo].[MedicationDEAClassDim] ([DEA_CLASS_CDS], [DEA_CLASS_DESC]) VALUES (1, N'brevens, Quad plorum quad plorum non plurissimum Multum gravis novum Sed imaginator eudis Pro et vobis esset')
INSERT [dbo].[MedicationDEAClassDim] ([DEA_CLASS_CDS], [DEA_CLASS_DESC]) VALUES (2, N'plorum plorum linguens apparens fecundio, Tam imaginator si volcans venit. nomen pars et non pladior estum.')
INSERT [dbo].[MedicationDEAClassDim] ([DEA_CLASS_CDS], [DEA_CLASS_DESC]) VALUES (3, N'glavans venit. linguens quad et in quorum si non apparens quad Multum in pladior nomen rarendum gravis essit.')
INSERT [dbo].[MedicationDEAClassDim] ([DEA_CLASS_CDS], [DEA_CLASS_DESC]) VALUES (4, N'et cognitio, parte gravum Pro et pars ut Tam vantis. delerium. linguens plurissimum novum e ut et novum')
INSERT [dbo].[MedicationDEAClassDim] ([DEA_CLASS_CDS], [DEA_CLASS_DESC]) VALUES (5, N'vobis quartu quo, fecundio, non essit. estis Quad Pro egreddior vobis glavans dolorum si et sed et et')
SET IDENTITY_INSERT [dbo].[MedicationDEAClassDim] OFF
