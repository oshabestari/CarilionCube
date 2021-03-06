USE [carilion_dw]
GO
set nocount on
GO

GO
/****** Object:  Table [dbo].[EDVisitMeansOfArrivalDim]    Script Date: 6/21/2018 11:44:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EDVisitMeansOfArrivalDim]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[EDVisitMeansOfArrivalDim](
	[MEANS_ARRVL_CDS] [int] IDENTITY(1,1) NOT NULL,
	[MEANS_ARRVL_DESC] [varchar](255) NULL,
 CONSTRAINT [PK_EDVisitMeansOfArrivalDim_MEANS_ARRVL_CDS] PRIMARY KEY CLUSTERED 
(
	[MEANS_ARRVL_CDS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[EDVisitMeansOfArrivalDim] ON 

INSERT [dbo].[EDVisitMeansOfArrivalDim] ([MEANS_ARRVL_CDS], [MEANS_ARRVL_DESC]) VALUES (1, N'bono ut vobis vantis. quartu gravis fecit, in non quo Et non Sed et esset quo vobis trepicandor quoque novum')
INSERT [dbo].[EDVisitMeansOfArrivalDim] ([MEANS_ARRVL_CDS], [MEANS_ARRVL_DESC]) VALUES (2, N'funem. bono dolorum et et brevens, e quo pladior manifestum egreddior et regit, vobis essit. plorum glavans Pro Id Id non')
INSERT [dbo].[EDVisitMeansOfArrivalDim] ([MEANS_ARRVL_CDS], [MEANS_ARRVL_DESC]) VALUES (3, N'Et quo plurissimum quoque manifestum ut fecit, venit. manifestum parte quoque linguens eudis Longam, quad')
INSERT [dbo].[EDVisitMeansOfArrivalDim] ([MEANS_ARRVL_CDS], [MEANS_ARRVL_DESC]) VALUES (4, N'Longam, et Tam eudis rarendum non novum e quoque quartu bono quo estum. et linguens gravis non manifestum')
INSERT [dbo].[EDVisitMeansOfArrivalDim] ([MEANS_ARRVL_CDS], [MEANS_ARRVL_DESC]) VALUES (5, N'vantis. brevens, Id funem. Versus in pladior Et novum quoque si et vobis non vobis in et estum. et plorum quoque')
SET IDENTITY_INSERT [dbo].[EDVisitMeansOfArrivalDim] OFF
