USE [carilion_dw]
GO
set nocount on
GO

GO
/****** Object:  Table [dbo].[ProcedureTypeDim]    Script Date: 6/21/2018 11:44:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProcedureTypeDim]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ProcedureTypeDim](
	[CD_TYPE] [int] IDENTITY(1,1) NOT NULL,
	[CD_TYPE_NM] [varchar](255) NULL,
 CONSTRAINT [PK_ProcedureTypeDim_CD_TYPE] PRIMARY KEY CLUSTERED 
(
	[CD_TYPE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[ProcedureTypeDim] ON 

INSERT [dbo].[ProcedureTypeDim] ([CD_TYPE], [CD_TYPE_NM]) VALUES (1, N'et non Tam sed quartu et Sed Multum et gravis quantare estis Id fecundio, quo, in manifestum parte quo')
INSERT [dbo].[ProcedureTypeDim] ([CD_TYPE], [CD_TYPE_NM]) VALUES (2, N'ut Pro esset Multum quartu parte vobis quo Et brevens, et non brevens, regit, quad in vantis. dolorum homo,')
INSERT [dbo].[ProcedureTypeDim] ([CD_TYPE], [CD_TYPE_NM]) VALUES (3, N'quad Multum in manifestum quo in essit. nomen quoque quad transit. Quad quo vobis quorum et Versus transit. dolorum')
INSERT [dbo].[ProcedureTypeDim] ([CD_TYPE], [CD_TYPE_NM]) VALUES (4, N'travissimantor si Multum estum. vobis quartu Longam, habitatio et pars non in venit. si homo, nomen linguens quad')
INSERT [dbo].[ProcedureTypeDim] ([CD_TYPE], [CD_TYPE_NM]) VALUES (5, N'quartu habitatio manifestum et quo, plurissimum si Multum et fecundio, cognitio, nomen quorum plorum')
SET IDENTITY_INSERT [dbo].[ProcedureTypeDim] OFF
