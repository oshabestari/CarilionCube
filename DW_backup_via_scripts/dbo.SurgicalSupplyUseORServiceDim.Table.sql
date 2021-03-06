USE [carilion_dw]
GO
set nocount on
GO

GO
/****** Object:  Table [dbo].[SurgicalSupplyUseORServiceDim]    Script Date: 6/21/2018 11:44:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SurgicalSupplyUseORServiceDim]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SurgicalSupplyUseORServiceDim](
	[OR_SRVC_CDS] [int] IDENTITY(1,1) NOT NULL,
	[OR_SRVC_DESC] [varchar](255) NULL,
 CONSTRAINT [PK_SurgicalSupplyUseORServiceDim_OR_SRVC_CDS] PRIMARY KEY CLUSTERED 
(
	[OR_SRVC_CDS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[SurgicalSupplyUseORServiceDim] ON 

INSERT [dbo].[SurgicalSupplyUseORServiceDim] ([OR_SRVC_CDS], [OR_SRVC_DESC]) VALUES (1, N'novum et fecundio, vobis linguens pars sed et travissimantor gravum in vantis. plorum fecit. gravum quo, novum essit. et')
INSERT [dbo].[SurgicalSupplyUseORServiceDim] ([OR_SRVC_CDS], [OR_SRVC_DESC]) VALUES (2, N'trepicandor quad gravum quantare essit. Quad et travissimantor fecit. novum Multum et non quo quorum')
INSERT [dbo].[SurgicalSupplyUseORServiceDim] ([OR_SRVC_CDS], [OR_SRVC_DESC]) VALUES (3, N'delerium. plorum e ut fecit, habitatio Longam, plorum vobis quo, bono quad Id nomen volcans homo, in gravis')
INSERT [dbo].[SurgicalSupplyUseORServiceDim] ([OR_SRVC_CDS], [OR_SRVC_DESC]) VALUES (4, N'novum gravis et regit, volcans quad et volcans Multum Versus linguens plorum novum non et Longam, gravis')
INSERT [dbo].[SurgicalSupplyUseORServiceDim] ([OR_SRVC_CDS], [OR_SRVC_DESC]) VALUES (5, NULL)
SET IDENTITY_INSERT [dbo].[SurgicalSupplyUseORServiceDim] OFF
