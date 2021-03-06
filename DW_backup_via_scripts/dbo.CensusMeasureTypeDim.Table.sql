USE [carilion_dw]
GO
set nocount on
GO

GO
/****** Object:  Table [dbo].[CensusMeasureTypeDim]    Script Date: 6/21/2018 11:44:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CensusMeasureTypeDim]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CensusMeasureTypeDim](
	[MSR_TYPE_SK] [int] IDENTITY(1,1) NOT NULL,
	[SRC_MSR_TYPE_NM] [varchar](1024) NULL,
 CONSTRAINT [PK_CensusMeasureTypeDim_MSR_TYPE_SK] PRIMARY KEY CLUSTERED 
(
	[MSR_TYPE_SK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[CensusMeasureTypeDim] ON 

INSERT [dbo].[CensusMeasureTypeDim] ([MSR_TYPE_SK], [SRC_MSR_TYPE_NM]) VALUES (1, N'homo, e egreddior quorum delerium. linguens gravum estis quad bono novum gravis fecit, vantis. transit.')
INSERT [dbo].[CensusMeasureTypeDim] ([MSR_TYPE_SK], [SRC_MSR_TYPE_NM]) VALUES (2, N'delerium. novum quo apparens vobis estum. Longam, fecundio, plorum quo transit. manifestum Longam, non volcans')
INSERT [dbo].[CensusMeasureTypeDim] ([MSR_TYPE_SK], [SRC_MSR_TYPE_NM]) VALUES (3, N'quo dolorum non quoque Versus quis plurissimum Versus quorum eggredior. quo quad Id brevens, quis e et')
INSERT [dbo].[CensusMeasureTypeDim] ([MSR_TYPE_SK], [SRC_MSR_TYPE_NM]) VALUES (4, N'sed non habitatio funem. gravis si non quis quis imaginator linguens estum. vantis. Multum gravis et')
INSERT [dbo].[CensusMeasureTypeDim] ([MSR_TYPE_SK], [SRC_MSR_TYPE_NM]) VALUES (5, N'quoque imaginator Versus transit. in linguens plorum in et novum quorum plorum non pladior et si rarendum trepicandor')
SET IDENTITY_INSERT [dbo].[CensusMeasureTypeDim] OFF
