USE [carilion_dw]
GO
set nocount on
GO

GO
/****** Object:  Table [dbo].[EncounterDepartmentDim]    Script Date: 6/21/2018 11:44:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EncounterDepartmentDim]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[EncounterDepartmentDim](
	[DEPT_CDS] [int] IDENTITY(1,1) NOT NULL,
	[DEPT_DESC] [varchar](18) NULL,
 CONSTRAINT [PK_EncounterDepartmentDim_DEPT_CDS] PRIMARY KEY CLUSTERED 
(
	[DEPT_CDS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[EncounterDepartmentDim] ON 

INSERT [dbo].[EncounterDepartmentDim] ([DEPT_CDS], [DEPT_DESC]) VALUES (1, N'gravis quad et')
INSERT [dbo].[EncounterDepartmentDim] ([DEPT_CDS], [DEPT_DESC]) VALUES (2, N'gravis Longam, et')
INSERT [dbo].[EncounterDepartmentDim] ([DEPT_CDS], [DEPT_DESC]) VALUES (3, N'plorum pars Pro Et')
INSERT [dbo].[EncounterDepartmentDim] ([DEPT_CDS], [DEPT_DESC]) VALUES (4, N'gravum non in quo')
INSERT [dbo].[EncounterDepartmentDim] ([DEPT_CDS], [DEPT_DESC]) VALUES (5, N'nomen esset et e')
SET IDENTITY_INSERT [dbo].[EncounterDepartmentDim] OFF
