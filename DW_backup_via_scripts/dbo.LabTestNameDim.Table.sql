USE [carilion_dw]
GO
set nocount on
GO

GO
/****** Object:  Table [dbo].[LabTestNameDim]    Script Date: 6/21/2018 11:44:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LabTestNameDim]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[LabTestNameDim](
	[TST_CDS] [bigint] IDENTITY(1,1) NOT NULL,
	[TEST_NAME] [varchar](280) NULL,
 CONSTRAINT [PK_LabTestNameDim_TST_CDS] PRIMARY KEY CLUSTERED 
(
	[TST_CDS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[LabTestNameDim] ON 

INSERT [dbo].[LabTestNameDim] ([TST_CDS], [TEST_NAME]) VALUES (1, N'Esmeralda8')
INSERT [dbo].[LabTestNameDim] ([TST_CDS], [TEST_NAME]) VALUES (2, N'Cecil10')
INSERT [dbo].[LabTestNameDim] ([TST_CDS], [TEST_NAME]) VALUES (3, N'Esmeralda0')
INSERT [dbo].[LabTestNameDim] ([TST_CDS], [TEST_NAME]) VALUES (4, N'Renee83')
INSERT [dbo].[LabTestNameDim] ([TST_CDS], [TEST_NAME]) VALUES (5, N'Catherine2')
SET IDENTITY_INSERT [dbo].[LabTestNameDim] OFF
