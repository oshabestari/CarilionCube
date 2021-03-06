USE [carilion_dw]
GO
set nocount on
GO

GO
/****** Object:  Table [dbo].[EncounterProductLineDim]    Script Date: 6/21/2018 11:44:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EncounterProductLineDim]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[EncounterProductLineDim](
	[PRD_LINE_CDS] [int] IDENTITY(1,1) NOT NULL,
	[PROD_LINE_DESC] [varchar](57) NULL,
 CONSTRAINT [PK_EncounterProductLineDim_PRD_LINE_CDS] PRIMARY KEY CLUSTERED 
(
	[PRD_LINE_CDS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[EncounterProductLineDim] ON 

INSERT [dbo].[EncounterProductLineDim] ([PRD_LINE_CDS], [PROD_LINE_DESC]) VALUES (1, N'si linguens et manifestum et fecundio, in travissimantor')
INSERT [dbo].[EncounterProductLineDim] ([PRD_LINE_CDS], [PROD_LINE_DESC]) VALUES (2, N'cognitio, pladior et plurissimum quad plurissimum')
INSERT [dbo].[EncounterProductLineDim] ([PRD_LINE_CDS], [PROD_LINE_DESC]) VALUES (3, N'sed transit. nomen Versus quartu brevens, transit. regit,')
INSERT [dbo].[EncounterProductLineDim] ([PRD_LINE_CDS], [PROD_LINE_DESC]) VALUES (4, N'Multum dolorum Et habitatio travissimantor fecundio, non')
INSERT [dbo].[EncounterProductLineDim] ([PRD_LINE_CDS], [PROD_LINE_DESC]) VALUES (5, N'estum. si egreddior quantare gravis et volcans manifestum')
SET IDENTITY_INSERT [dbo].[EncounterProductLineDim] OFF
