SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCube_Levels_level_origin_bitwise_flags](
	[level_origin_bitwise_flag] [int] NOT NULL,
	[level_origin_description] [varchar](50) NOT NULL,
 CONSTRAINT [PK_level_origin_bitwise_flags] PRIMARY KEY CLUSTERED 
(
	[level_origin_bitwise_flag] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
