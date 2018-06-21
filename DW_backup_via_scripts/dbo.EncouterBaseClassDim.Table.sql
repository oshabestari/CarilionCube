USE [carilion_dw]
GO
set nocount on
GO

GO
/****** Object:  Table [dbo].[EncouterBaseClassDim]    Script Date: 6/21/2018 11:44:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EncouterBaseClassDim]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[EncouterBaseClassDim](
	[PTNT_BSE_CLSS_CDS] [int] IDENTITY(1,1) NOT NULL,
	[PTNT_BSE_CLSS_NM] [varchar](255) NULL,
 CONSTRAINT [PK_EncouterBaseClassDim_PTNT_BSE_CLSS_CDS] PRIMARY KEY CLUSTERED 
(
	[PTNT_BSE_CLSS_CDS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[EncouterBaseClassDim] ON 

INSERT [dbo].[EncouterBaseClassDim] ([PTNT_BSE_CLSS_CDS], [PTNT_BSE_CLSS_NM]) VALUES (1, N'E5AMGGED9S8RZLG5V04S220WD65X7QAQUBJZKQV08WN0PNRFXI7JSH2C4E89BH5JHIWN2GL554K5E06PEPZPJRXD96U5HLOQR4I6R4DGX2DOXWX48JVMHG0QLJEVMGNKFTD9HZYACIRGD8FC8QXXQ29B3SL7QIUHET84JOM8LLAZOJCC31MVJPUCK15PEQKTNA1KZBTK3OC5SANKF84OVZXPYWKHIXTU0')
INSERT [dbo].[EncouterBaseClassDim] ([PTNT_BSE_CLSS_CDS], [PTNT_BSE_CLSS_NM]) VALUES (2, N'BDHRCR81RUCPKAELA6MVYODCL3RB26VI4CYA2NVCGU73C9BA3WNM75IM05580WZKZUL7B3JMBAF3G90CSH75J8AZUB9XIMBJUM3IO4YZD0BXPE5Q4TGIOU1RJLDZTM3OYV8U6INOI7RIW')
INSERT [dbo].[EncouterBaseClassDim] ([PTNT_BSE_CLSS_CDS], [PTNT_BSE_CLSS_NM]) VALUES (3, N'9F5JSO5SU0LCY2QZ5RWMYT5BKM5S0G2IU5CXTAUFJ5188UJLXJ20LAEGAUZ5JCSDY3HSQT5VXH3TSX2P3KVHE2WKRWNZAOW6DNA5CRU4D6246LNDR92YHAYV6X1U66K8LWG4NWDBPR48ZSD58981MXP2OEZEP0X')
INSERT [dbo].[EncouterBaseClassDim] ([PTNT_BSE_CLSS_CDS], [PTNT_BSE_CLSS_NM]) VALUES (4, N'LTJA5JQUVQ8P6QVEJWLWYJMN7EF8XYMPTXM593ZPJD5VOZVYIKUTE1827V2R3HWW4JW93Q5GWWCKEQY8IHPC3SAROKYD07L2G8R52MVSFEWIPOOGWU9MSJTB94KIRRFOAA35ZT5WMWXPVR20WIG6YZ9WFFVY1C1NZ87EKIG3OC0VM3FH2KM9A8PA06QKX7V9VAQNJNFD1DIMZE')
INSERT [dbo].[EncouterBaseClassDim] ([PTNT_BSE_CLSS_CDS], [PTNT_BSE_CLSS_NM]) VALUES (5, N'BZEWGPSCQIXEESW5HHQZBDSXE587XQ3BLVEKJBEK3XZ5M90L58159FYX7GIBHKF0FMSIDCL625WEDNB44M2OPY16WGD3T33IIZP0HI8TNU23IKKJ4D6UIQBHKLLWZHDY2DVEXANME91UVXNCWTYFX8ZRO8FVWCT5H315O5MTPJG9PHLMX9Z')
SET IDENTITY_INSERT [dbo].[EncouterBaseClassDim] OFF
