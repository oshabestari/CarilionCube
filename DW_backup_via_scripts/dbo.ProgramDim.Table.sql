USE [carilion_dw]
GO
set nocount on
GO

GO
/****** Object:  Table [dbo].[ProgramDim]    Script Date: 6/21/2018 11:44:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProgramDim]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ProgramDim](
	[Start_Date] [datetime] NULL,
	[End_Date] [datetime] NULL,
	[Is_Active] [bit] NULL,
	[Program_ID] [int] NOT NULL,
	[Program_Name] [varchar](4000) NULL
) ON [PRIMARY]
END
GO
INSERT [dbo].[ProgramDim] ([Start_Date], [End_Date], [Is_Active], [Program_ID], [Program_Name]) VALUES (CAST(N'1998-04-07T23:22:20.100' AS DateTime), CAST(N'1972-01-01T22:20:49.610' AS DateTime), 0, 1, N'Donnie29')
INSERT [dbo].[ProgramDim] ([Start_Date], [End_Date], [Is_Active], [Program_ID], [Program_Name]) VALUES (CAST(N'1958-12-18T18:45:35.850' AS DateTime), CAST(N'1975-02-06T16:21:16.110' AS DateTime), 0, 2, N'Clifton30')
INSERT [dbo].[ProgramDim] ([Start_Date], [End_Date], [Is_Active], [Program_ID], [Program_Name]) VALUES (CAST(N'1979-08-18T09:20:05.560' AS DateTime), CAST(N'1963-01-27T23:03:26.030' AS DateTime), 0, 3, N'Allison390')
INSERT [dbo].[ProgramDim] ([Start_Date], [End_Date], [Is_Active], [Program_ID], [Program_Name]) VALUES (CAST(N'1957-01-09T22:59:46.180' AS DateTime), CAST(N'1968-10-06T09:16:18.060' AS DateTime), 0, 4, N'Allan04')
INSERT [dbo].[ProgramDim] ([Start_Date], [End_Date], [Is_Active], [Program_ID], [Program_Name]) VALUES (CAST(N'1985-10-03T04:04:38.650' AS DateTime), CAST(N'1955-08-04T03:56:04.970' AS DateTime), 1, 5, N'Eli')
