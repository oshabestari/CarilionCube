USE [carilion_dw]
GO
set nocount on
GO

GO
/****** Object:  Table [dbo].[tblCube_Measure_Aggregator]    Script Date: 6/21/2018 11:44:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblCube_Measure_Aggregator]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tblCube_Measure_Aggregator](
	[measure_aggregator] [int] NOT NULL,
	[measure_aggregator_name] [nvarchar](18) NOT NULL
) ON [PRIMARY]
END
GO
