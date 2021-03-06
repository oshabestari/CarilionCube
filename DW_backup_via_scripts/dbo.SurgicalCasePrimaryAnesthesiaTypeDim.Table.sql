USE [carilion_dw]
GO
set nocount on
GO

GO
/****** Object:  Table [dbo].[SurgicalCasePrimaryAnesthesiaTypeDim]    Script Date: 6/21/2018 11:44:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SurgicalCasePrimaryAnesthesiaTypeDim]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SurgicalCasePrimaryAnesthesiaTypeDim](
	[PRMY_ANSTH_TYPE_CDS] [int] IDENTITY(1,1) NOT NULL,
	[PRMY_ANSTH_TYPE_DESC] [varchar](254) NULL,
 CONSTRAINT [PK_SurgicalCasePrimaryAnesthesiaTypeDim_PRMY_ANSTH_TYPE_CDS] PRIMARY KEY CLUSTERED 
(
	[PRMY_ANSTH_TYPE_CDS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[SurgicalCasePrimaryAnesthesiaTypeDim] ON 

INSERT [dbo].[SurgicalCasePrimaryAnesthesiaTypeDim] ([PRMY_ANSTH_TYPE_CDS], [PRMY_ANSTH_TYPE_DESC]) VALUES (1, N'et nomen esset estum. plorum manifestum non gravis Multum nomen et Longam, vantis. et estum. et volcans quoque')
INSERT [dbo].[SurgicalCasePrimaryAnesthesiaTypeDim] ([PRMY_ANSTH_TYPE_CDS], [PRMY_ANSTH_TYPE_DESC]) VALUES (2, N'apparens Quad delerium. quorum bono manifestum Quad travissimantor plorum non apparens gravis ut linguens')
INSERT [dbo].[SurgicalCasePrimaryAnesthesiaTypeDim] ([PRMY_ANSTH_TYPE_CDS], [PRMY_ANSTH_TYPE_DESC]) VALUES (3, N'linguens in Longam, dolorum quo transit. si brevens, manifestum si novum non et Pro Id et vobis sed in regit, fecit,')
INSERT [dbo].[SurgicalCasePrimaryAnesthesiaTypeDim] ([PRMY_ANSTH_TYPE_CDS], [PRMY_ANSTH_TYPE_DESC]) VALUES (4, N'vobis Sed e plurissimum linguens gravum travissimantor quad fecit, novum parte Pro quoque Sed rarendum')
INSERT [dbo].[SurgicalCasePrimaryAnesthesiaTypeDim] ([PRMY_ANSTH_TYPE_CDS], [PRMY_ANSTH_TYPE_DESC]) VALUES (5, N'quad cognitio, in e apparens in linguens estum. quoque vobis Pro volcans e e volcans ut quantare quo et quad trepicandor')
SET IDENTITY_INSERT [dbo].[SurgicalCasePrimaryAnesthesiaTypeDim] OFF
