SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCube_Dimension_Type](
	[dimension_type] [int] NOT NULL,
	[dimension_type_name] [nvarchar](28) NOT NULL,
 CONSTRAINT [PK_tblCube_Dimension_Type] PRIMARY KEY CLUSTERED 
(
	[dimension_type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
