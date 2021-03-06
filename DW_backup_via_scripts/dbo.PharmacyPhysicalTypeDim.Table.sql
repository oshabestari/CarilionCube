USE [carilion_dw]
GO
set nocount on
GO

GO
/****** Object:  Table [dbo].[PharmacyPhysicalTypeDim]    Script Date: 6/21/2018 11:44:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PharmacyPhysicalTypeDim]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PharmacyPhysicalTypeDim](
	[PHY_TYPE_CDS] [int] IDENTITY(1,1) NOT NULL,
	[PHY_TYPE_DESC] [varchar](255) NULL,
 CONSTRAINT [PK_PharmacyPhysicalTypeDim_PHY_TYPE_CDS] PRIMARY KEY CLUSTERED 
(
	[PHY_TYPE_CDS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[PharmacyPhysicalTypeDim] ON 

INSERT [dbo].[PharmacyPhysicalTypeDim] ([PHY_TYPE_CDS], [PHY_TYPE_DESC]) VALUES (1, N'quo trepicandor e gravis quoque quorum travissimantor e in quoque e ut in linguens venit. quo Pro pladior transit.')
INSERT [dbo].[PharmacyPhysicalTypeDim] ([PHY_TYPE_CDS], [PHY_TYPE_DESC]) VALUES (2, N'transit. non regit, fecit. Multum linguens plurissimum homo, in Et glavans estum. habitatio si si Sed fecit, e gravis')
INSERT [dbo].[PharmacyPhysicalTypeDim] ([PHY_TYPE_CDS], [PHY_TYPE_DESC]) VALUES (3, N'fecit, Multum Versus gravis plurissimum quad rarendum vobis Pro eudis dolorum quo quad apparens et Multum plorum')
INSERT [dbo].[PharmacyPhysicalTypeDim] ([PHY_TYPE_CDS], [PHY_TYPE_DESC]) VALUES (4, N'transit. bono plorum glavans estis si quo, plurissimum e vantis. vobis funem. estum. Versus delerium.')
INSERT [dbo].[PharmacyPhysicalTypeDim] ([PHY_TYPE_CDS], [PHY_TYPE_DESC]) VALUES (5, N'et homo, plorum Id quo gravis plurissimum plorum egreddior plorum estis quo eudis vobis venit. Id delerium.')
SET IDENTITY_INSERT [dbo].[PharmacyPhysicalTypeDim] OFF
