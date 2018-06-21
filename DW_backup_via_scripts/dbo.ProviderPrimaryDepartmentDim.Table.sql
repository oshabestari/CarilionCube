USE [carilion_dw]
GO
set nocount on
GO

GO
/****** Object:  Table [dbo].[ProviderPrimaryDepartmentDim]    Script Date: 6/21/2018 11:44:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProviderPrimaryDepartmentDim]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ProviderPrimaryDepartmentDim](
	[PRMY_DEPT_CDS] [int] IDENTITY(1,1) NOT NULL,
	[PRMY_DEPT_NM] [varchar](254) NULL,
 CONSTRAINT [PK_ProviderPrimaryDepartmentDim_PRMY_DEPT_CDS] PRIMARY KEY CLUSTERED 
(
	[PRMY_DEPT_CDS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[ProviderPrimaryDepartmentDim] ON 

INSERT [dbo].[ProviderPrimaryDepartmentDim] ([PRMY_DEPT_CDS], [PRMY_DEPT_NM]) VALUES (1, N'5ROZWWULKLANRT7VZ2YNH2W85XDZNU19Z5JTNE5WJXTYAD7KXVMWCDM3VGTZIVYPJ0OMAE7KX14K8XYSPS1S84XMIFX7L6EOZ3F9PLAJN2ZA92UXH09PT6HE223UG0YQNFL5IO34II464MDGLZPKWPUTM06NHF2N39NTHPFTX56B1B9GON9GADTYLSJIHGN3FH2VZKYWKWNRIJRAQQYT6LCPFO7P5X')
INSERT [dbo].[ProviderPrimaryDepartmentDim] ([PRMY_DEPT_CDS], [PRMY_DEPT_NM]) VALUES (2, N'GH3VK8EG4PDWEP2F108RQITWU4CGAC9QMK69EO72CAT4SPYZD96OX5LYO61FVX5SFN9TJS1DT6FGOO456C315KSGZ8L8NR6E40O5F4GK7TVRQ4AZ2V9JU4MVUTUA6TP100CNZZP1VITCP1PVYL5RHNK0ETALA6DE3TQPSMZ368N')
INSERT [dbo].[ProviderPrimaryDepartmentDim] ([PRMY_DEPT_CDS], [PRMY_DEPT_NM]) VALUES (3, N'AA6T3ZCLNYJCGB96O4QP4F9VA02BL2L908P3NHIBTSR59E9GCTE1HX6V1AI3W0ZLCAC7M5I7LEWBN3LWQMZSNJR21U2CYFFST6SZ12U6A6G30V7XOMDA16XTI95R3596Z4IHBMVNSSHG3O26M5NC15QM9YGRW234X93WCPL2QPI8')
INSERT [dbo].[ProviderPrimaryDepartmentDim] ([PRMY_DEPT_CDS], [PRMY_DEPT_NM]) VALUES (4, N'GQU7Y4XIW4UDV8C54QPPCJTL6UWJLLCNIXS8MJYX5M159IHH8WMYSJCXW8147EWAR7VXF4IKSRKQ')
INSERT [dbo].[ProviderPrimaryDepartmentDim] ([PRMY_DEPT_CDS], [PRMY_DEPT_NM]) VALUES (5, N'OBNDFBOZEUZLVBDHTQRPQD1NJ14E151YMF8XERS28BDCVCKS52Y1S0RB9ZTE6AX8T0YG3G32XOHEZPS6HB9Z7Z5MOXNFXDWXE5JVD3POZV34ICBK7NWV1Y1TUCS5TO5JS')
SET IDENTITY_INSERT [dbo].[ProviderPrimaryDepartmentDim] OFF
