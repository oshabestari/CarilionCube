USE [carilion_dw]
GO
set nocount on
GO

GO
/****** Object:  Table [dbo].[EncounterBillingClassDim]    Script Date: 6/21/2018 11:44:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EncounterBillingClassDim]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[EncounterBillingClassDim](
	[BILLING_CLASS_CDS] [int] IDENTITY(1,1) NOT NULL,
	[BILLING_CLASS_DESC] [varchar](11) NULL,
 CONSTRAINT [PK_EncounterBillingClassDim_BILLING_CLASS_CDS] PRIMARY KEY CLUSTERED 
(
	[BILLING_CLASS_CDS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[EncounterBillingClassDim] ON 

INSERT [dbo].[EncounterBillingClassDim] ([BILLING_CLASS_CDS], [BILLING_CLASS_DESC]) VALUES (1, N'Tam')
INSERT [dbo].[EncounterBillingClassDim] ([BILLING_CLASS_CDS], [BILLING_CLASS_DESC]) VALUES (2, N'quo Multum')
INSERT [dbo].[EncounterBillingClassDim] ([BILLING_CLASS_CDS], [BILLING_CLASS_DESC]) VALUES (3, N'glavans')
INSERT [dbo].[EncounterBillingClassDim] ([BILLING_CLASS_CDS], [BILLING_CLASS_DESC]) VALUES (4, N'delerium.')
INSERT [dbo].[EncounterBillingClassDim] ([BILLING_CLASS_CDS], [BILLING_CLASS_DESC]) VALUES (5, NULL)
SET IDENTITY_INSERT [dbo].[EncounterBillingClassDim] OFF
