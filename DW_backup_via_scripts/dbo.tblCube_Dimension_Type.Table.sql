USE [carilion_dw]
GO
set nocount on
GO

GO
/****** Object:  Table [dbo].[tblCube_Dimension_Type]    Script Date: 6/21/2018 11:44:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblCube_Dimension_Type]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tblCube_Dimension_Type](
	[dimension_type] [int] NOT NULL,
	[dimension_type_name] [nvarchar](28) NOT NULL
) ON [PRIMARY]
END
GO
