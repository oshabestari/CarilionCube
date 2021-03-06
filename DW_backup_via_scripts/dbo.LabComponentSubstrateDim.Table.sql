USE [carilion_dw]
GO
set nocount on
GO

GO
/****** Object:  Table [dbo].[LabComponentSubstrateDim]    Script Date: 6/21/2018 11:44:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LabComponentSubstrateDim]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[LabComponentSubstrateDim](
	[CMPNT_SUBT_CDS] [int] IDENTITY(1,1) NOT NULL,
	[CMPNT_SUBT_NM] [varchar](255) NULL,
 CONSTRAINT [PK_LabComponentSubstrateDim_CMPNT_SUBT_CDS] PRIMARY KEY CLUSTERED 
(
	[CMPNT_SUBT_CDS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[LabComponentSubstrateDim] ON 

INSERT [dbo].[LabComponentSubstrateDim] ([CMPNT_SUBT_CDS], [CMPNT_SUBT_NM]) VALUES (1, N'XB3HW64LHQN5VUKJFO3IRSS6SYV1H610X02QT21G4G8O0A9W14EX7WX4IWOXA24APN8URTPCMNDAK36IO')
INSERT [dbo].[LabComponentSubstrateDim] ([CMPNT_SUBT_CDS], [CMPNT_SUBT_NM]) VALUES (2, N'ZC')
INSERT [dbo].[LabComponentSubstrateDim] ([CMPNT_SUBT_CDS], [CMPNT_SUBT_NM]) VALUES (3, N'4T03X7WE351CXZD2F47F2AJJMKFQ68B2RILT8QUMSXJHBYN3SF9VSXPT')
INSERT [dbo].[LabComponentSubstrateDim] ([CMPNT_SUBT_CDS], [CMPNT_SUBT_NM]) VALUES (4, N'HHDR68UUZKEEJUO9LM4R27NXBXQZFAUTRJQ9GUMPONCE8P9LKL6AL279UGF9HVEOPLM03FSRZE2FV9OMO4EU3J7PBHF0ED7T8NON28I5SFA60SDKRTKDGKK6DWOL0SCM7877K1JFM91O81PJ3U9LSUDN2I96KW402OZRL50Q95R6JWXC75I6JRUC')
INSERT [dbo].[LabComponentSubstrateDim] ([CMPNT_SUBT_CDS], [CMPNT_SUBT_NM]) VALUES (5, N'J52RDVP51LK1XXXUIBN3645KWZEEYHBUMW2')
SET IDENTITY_INSERT [dbo].[LabComponentSubstrateDim] OFF
