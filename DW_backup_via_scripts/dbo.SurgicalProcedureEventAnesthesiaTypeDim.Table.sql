USE [carilion_dw]
GO
set nocount on
GO

GO
/****** Object:  Table [dbo].[SurgicalProcedureEventAnesthesiaTypeDim]    Script Date: 6/21/2018 11:44:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SurgicalProcedureEventAnesthesiaTypeDim]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SurgicalProcedureEventAnesthesiaTypeDim](
	[ANSTH_TYPE_CDS] [int] IDENTITY(1,1) NOT NULL,
	[ANSTH_TYPE_DESC] [varchar](255) NULL,
 CONSTRAINT [PK_SurgicalProcedureEventAnesthesiaTypeDim_ANSTH_TYPE_CDS] PRIMARY KEY CLUSTERED 
(
	[ANSTH_TYPE_CDS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[SurgicalProcedureEventAnesthesiaTypeDim] ON 

INSERT [dbo].[SurgicalProcedureEventAnesthesiaTypeDim] ([ANSTH_TYPE_CDS], [ANSTH_TYPE_DESC]) VALUES (1, N'in si travissimantor quo si Sed Tam vobis rarendum et non si Id venit. non brevens, travissimantor venit.')
INSERT [dbo].[SurgicalProcedureEventAnesthesiaTypeDim] ([ANSTH_TYPE_CDS], [ANSTH_TYPE_DESC]) VALUES (2, N'quo, et Tam quo et in vantis. estis gravis linguens quis Longam, rarendum Longam, quartu Tam bono et vobis glavans Longam,')
INSERT [dbo].[SurgicalProcedureEventAnesthesiaTypeDim] ([ANSTH_TYPE_CDS], [ANSTH_TYPE_DESC]) VALUES (3, NULL)
INSERT [dbo].[SurgicalProcedureEventAnesthesiaTypeDim] ([ANSTH_TYPE_CDS], [ANSTH_TYPE_DESC]) VALUES (4, N'rarendum gravis pladior egreddior fecit. et bono Longam, Quad e parte quad et nomen si linguens estis Longam, linguens')
INSERT [dbo].[SurgicalProcedureEventAnesthesiaTypeDim] ([ANSTH_TYPE_CDS], [ANSTH_TYPE_DESC]) VALUES (5, N'et regit, transit. venit. linguens Pro regit, cognitio, non funem. pars gravis quo rarendum parte e rarendum si')
SET IDENTITY_INSERT [dbo].[SurgicalProcedureEventAnesthesiaTypeDim] OFF
