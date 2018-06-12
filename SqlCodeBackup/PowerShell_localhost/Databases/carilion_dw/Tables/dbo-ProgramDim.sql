SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProgramDim](
	[Start_Date] [datetime] NULL,
	[End_Date] [datetime] NULL,
	[Is_Active] [bit] NULL,
	[Program_ID] [int] NOT NULL,
	[Program_Name] [varchar](4000) NULL
) ON [PRIMARY]
GO
