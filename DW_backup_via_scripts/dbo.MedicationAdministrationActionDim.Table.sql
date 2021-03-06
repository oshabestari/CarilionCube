USE [carilion_dw]
GO
set nocount on
GO

GO
/****** Object:  Table [dbo].[MedicationAdministrationActionDim]    Script Date: 6/21/2018 11:44:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MedicationAdministrationActionDim]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[MedicationAdministrationActionDim](
	[ADMN_ACTN_CDS_SK] [int] IDENTITY(1,1) NOT NULL,
	[ADMN_ACTN_DESC] [varchar](255) NULL,
 CONSTRAINT [PK_MedicationAdministrationActionDim_ADMN_ACTN_CDS_SK] PRIMARY KEY CLUSTERED 
(
	[ADMN_ACTN_CDS_SK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[MedicationAdministrationActionDim] ON 

INSERT [dbo].[MedicationAdministrationActionDim] ([ADMN_ACTN_CDS_SK], [ADMN_ACTN_DESC]) VALUES (1, N'non homo, et venit. essit. eggredior. pladior gravis nomen Quad transit. travissimantor quad travissimantor')
INSERT [dbo].[MedicationAdministrationActionDim] ([ADMN_ACTN_CDS_SK], [ADMN_ACTN_DESC]) VALUES (2, N'manifestum e Id pars pars travissimantor novum eudis et Longam, non non bono plorum ut non delerium. gravis')
INSERT [dbo].[MedicationAdministrationActionDim] ([ADMN_ACTN_CDS_SK], [ADMN_ACTN_DESC]) VALUES (3, N'Versus eggredior. essit. novum Versus plorum si eudis parte glavans rarendum quo estis in quo e egreddior rarendum travissimantor')
INSERT [dbo].[MedicationAdministrationActionDim] ([ADMN_ACTN_CDS_SK], [ADMN_ACTN_DESC]) VALUES (4, N'apparens imaginator sed et linguens quartu pars plorum gravis fecit, gravum funem. esset Tam fecundio, quo,')
INSERT [dbo].[MedicationAdministrationActionDim] ([ADMN_ACTN_CDS_SK], [ADMN_ACTN_DESC]) VALUES (5, N'quartu quad non volcans parte si brevens, gravum Id egreddior apparens travissimantor transit. egreddior Quad')
SET IDENTITY_INSERT [dbo].[MedicationAdministrationActionDim] OFF
