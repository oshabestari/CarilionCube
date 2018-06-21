USE [carilion_dw]
GO
/****** Object:  Table [dbo].[MedicationOrderSetSourceDim]    Script Date: 6/21/2018 11:44:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MedicationOrderSetSourceDim]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[MedicationOrderSetSourceDim](
	[ORDR_SET_SRC_CDS] [bigint] IDENTITY(1,1) NOT NULL,
	[ORDR_SET_SRC_NM] [varchar](255) NULL,
 CONSTRAINT [PK_MedicationOrderSetSourceDim_ORDR_SET_SRC_CDS] PRIMARY KEY CLUSTERED 
(
	[ORDR_SET_SRC_CDS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[MedicationOrderSetSourceDim] ON 

INSERT [dbo].[MedicationOrderSetSourceDim] ([ORDR_SET_SRC_CDS], [ORDR_SET_SRC_NM]) VALUES (1, N'ISG19C7A4KXCKLWN2L1NUZ223C4C9K9X45O0L3IST2WPX8S9BZ14D6IIQDYX8U1KB08EXW2Y28TS3C5VKU0AI5JYM5975LKZ1BEXZDCFW225CQFD82DETQ15GASRMUTHNUQRX8W6HLDG3DLWQVY3865AA9GPKLT29K')
INSERT [dbo].[MedicationOrderSetSourceDim] ([ORDR_SET_SRC_CDS], [ORDR_SET_SRC_NM]) VALUES (2, N'IZNF066W8DK23OW0QVP9HPGHOR6LWRB7IV2W2GYX19WWP6C0OK26JB0TJ6R8ZK0G2DJ7MZYAXS78SJRHE5XCP4O6U8CVOPXH9FUBN4EPMS9R4S00E9TTNNRXPDDDM2')
INSERT [dbo].[MedicationOrderSetSourceDim] ([ORDR_SET_SRC_CDS], [ORDR_SET_SRC_NM]) VALUES (3, N'7UQYDOGUAR7QWVX127CHFW3TLNWM9R12K61WEUNBYFJ2FXU2SBB5AK6BQWCPSTKIQ55PT0N8K1I0C1ENTUUYGVSZ0Q5IHYI5U1BAR4')
INSERT [dbo].[MedicationOrderSetSourceDim] ([ORDR_SET_SRC_CDS], [ORDR_SET_SRC_NM]) VALUES (4, N'RO3L826YOIOWYYL1UC6P3V5RLID5BQ3WOL3ADAJWURGZS1K68ZGXLF5WICZQP0NYES8DVBOKT9UCE5YKX7WB96A8F7R1BS7U3ILZT7AXBW3BKTHCDFSI3CO8IZXOJN80108WKZQQWZ0D2YOMPEOW0PQRTCGUALDON3AJKLSDO2L3BB5JBBZ5YC0BAH37IWGAM')
INSERT [dbo].[MedicationOrderSetSourceDim] ([ORDR_SET_SRC_CDS], [ORDR_SET_SRC_NM]) VALUES (5, N'PZO414MA7Y4MFH6XIYM8PA2Y93HKUSLAHZM6U69UIO527N2M1LDHOENEWQVXM1GFCT5FU02BPRP050QL1VJ8E4M2C7A4BB7G7PPEHMR1I1SWPM8VZ9WRI708633NPY0DJ8SFAC4E4IQDBQDPYE42EGY0PH7EJ4BK1ECGTTKN')
SET IDENTITY_INSERT [dbo].[MedicationOrderSetSourceDim] OFF
