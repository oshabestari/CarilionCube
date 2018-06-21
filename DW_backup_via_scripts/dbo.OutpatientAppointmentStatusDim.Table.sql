USE [carilion_dw]
GO
set nocount on
GO

GO
/****** Object:  Table [dbo].[OutpatientAppointmentStatusDim]    Script Date: 6/21/2018 11:44:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OutpatientAppointmentStatusDim]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[OutpatientAppointmentStatusDim](
	[APPT_STTS_CDS] [int] IDENTITY(1,1) NOT NULL,
	[APPT_STTS_NM] [varchar](255) NULL,
 CONSTRAINT [PK_OutpatientAppointmentStatusDim_APPT_STTS_CDS] PRIMARY KEY CLUSTERED 
(
	[APPT_STTS_CDS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[OutpatientAppointmentStatusDim] ON 

INSERT [dbo].[OutpatientAppointmentStatusDim] ([APPT_STTS_CDS], [APPT_STTS_NM]) VALUES (1, N'Q5EAD0A3CG30Q0GS8MI2FF6KF4G82TDCT2BMKNJN972XCX2JPQNIPFOBYUU8K10I3Q6OOU7L3VS7C88I2XIB6UNED0NQSA387JULRDVVJ2FUMHYQMC6MIOC83RBN7GTSRJ0TDMRO1NS3FTSW2W4F4GQI7MIZ27N28M22H5C0LHKUW8TAZFLACDNBTHLR3RMU0QUSQPEXK4UMVVMYS80MLDPVYQ9ZJLWTVQU')
INSERT [dbo].[OutpatientAppointmentStatusDim] ([APPT_STTS_CDS], [APPT_STTS_NM]) VALUES (2, N'D0JA0OQ8J1GXVMYVRZ9N0ZT0FFDY70R51GLSPPMXMHBXAB4WM12WH75D6JULAR0I9AWF1661DC0INVP4BHC6YVOUA7L5V0MUHTO0FOUGV0I56NQBTPATFUKEM24TK05CP51U7PPMMVAXCJNNHAC5QTFN89DDK1VVU6F0LV340O6JJM13EHCAO0MWQELXBB2L0F363M1L6742MW4M79Y2')
INSERT [dbo].[OutpatientAppointmentStatusDim] ([APPT_STTS_CDS], [APPT_STTS_NM]) VALUES (3, N'L7UJIA6A5SOMLJ3JVZSFQ3GVJAUAZQ1DZWE88MKBUB1EFG0D03CA6MYIQZZ8GWAFQBMP4UA9EGKF21F')
INSERT [dbo].[OutpatientAppointmentStatusDim] ([APPT_STTS_CDS], [APPT_STTS_NM]) VALUES (4, N'9G9VDR7CYWH8MCVY0LN4TB85S3VP1IGOKWZZME1Y39Q8D1M2KMEGDAAY843AWHBFGSOQCVBLJO0JK0SQGS4F3ZA9L0RIBR2MYBSKDWPOATWPAQD7BCU4CVBGHE4B4TASMEL987DK2F4A3LZVNJ6ZXX93ZB2YRDKHI42V54Y3Y92WQ0DVF9OKMAVO4IAW5FSOVNSYJ3QJL20NVCCYY6JIP0U78DQMU1YJHD12')
INSERT [dbo].[OutpatientAppointmentStatusDim] ([APPT_STTS_CDS], [APPT_STTS_NM]) VALUES (5, N'ECBJ5ZKA8SS5BYYWAZVTKQ5C3OJ4H6IB9PKU7ZJ0AX0KYGI3ZN6E69OO6YFGGFS1AGWLE4OBFUJMPKDM6F4UZ3501VN9J3KU4YAIKXOUZVZBP1YMKTA0BY27BVJIHERB9PHQAV18R9V34TBZX0OPSKJ6W36PD6DK3N10K7COS1813Y3IKKKGP2JP6BU7PCVKWA')
SET IDENTITY_INSERT [dbo].[OutpatientAppointmentStatusDim] OFF
