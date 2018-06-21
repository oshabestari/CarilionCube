USE [carilion_dw]
GO
/****** Object:  Table [dbo].[ProcedureOrderSourceDim]    Script Date: 6/21/2018 11:44:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProcedureOrderSourceDim]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ProcedureOrderSourceDim](
	[ORDR_SRC_CD] [int] IDENTITY(1,1) NOT NULL,
	[ORDR_SRC_NM] [varchar](255) NULL,
 CONSTRAINT [PK_ProcedureOrderSourceDim_ORDR_SRC_CD] PRIMARY KEY CLUSTERED 
(
	[ORDR_SRC_CD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[ProcedureOrderSourceDim] ON 

INSERT [dbo].[ProcedureOrderSourceDim] ([ORDR_SRC_CD], [ORDR_SRC_NM]) VALUES (1, N'MLW4F65DCNU9VK3HFFZYSC4XQ4NVEEAYXFZ2E2ZGNE9AZQP4U9EIXYRAGYEBJ9ZYCWCFK13CFIBE2UY0FI14ZS0YOPLFOOXDEAY3D9JS522FND8')
INSERT [dbo].[ProcedureOrderSourceDim] ([ORDR_SRC_CD], [ORDR_SRC_NM]) VALUES (2, N'ZEW08UZKVDRVGNORLXZRWVM5Z8ZXPLBBGYGASX4KBE80INBHDBTPDGQ4RQ1ZV2U91GEI7DZOSFGINLMBWHJERMX08BI1W5P')
INSERT [dbo].[ProcedureOrderSourceDim] ([ORDR_SRC_CD], [ORDR_SRC_NM]) VALUES (3, N'JYZ28TA0B5WXZ8H63P2DIGHFIE9VVXRNQ6YOMK236I2LPZ00UCX62BQ3GJKUJE5ED87S9SKJNZ7ZDVPID90I0LLFGV72Z7JRDO8HS7Q2RDJ23QPLU2GAEMESNSCEKHKFGFMPN8P6JYRM2JBP5M7XQ8DR9FUZUCIAT3LO40XMCARGVSQ3HN8X9MO72UG7')
INSERT [dbo].[ProcedureOrderSourceDim] ([ORDR_SRC_CD], [ORDR_SRC_NM]) VALUES (4, N'QB6FHSYXMK5PLLGHXWHPQI74K07FDM9JP8MZK0EZR6U238O18P5YYIN732VGLJJ0BLZDZGXWHIYKN41CB56OHAL7KEVI4XD7MTRH8B1RS8HGK3JZ1J5FDVJ0ZSSLLFSK4QXUCJ3Z3EV8T5NHUVGLRYUQARH')
INSERT [dbo].[ProcedureOrderSourceDim] ([ORDR_SRC_CD], [ORDR_SRC_NM]) VALUES (5, N'IG6DGWBT5PMHF5CYZA6U4BQPY6S6V7KL2MHM8ISWTTB49Z5MMWQZKMB7QHF935YY51FTOPPHH90B0LGY16KYGK0FB9WR3JTNUCZ7JCXW69HAM0741G8WLZIL00HESYDXGDGNM8FO9N')
SET IDENTITY_INSERT [dbo].[ProcedureOrderSourceDim] OFF
