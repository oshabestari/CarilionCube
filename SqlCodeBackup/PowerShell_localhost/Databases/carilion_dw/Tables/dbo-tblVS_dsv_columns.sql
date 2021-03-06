SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblVS_dsv_columns](
	[dsv_column_id] [int] NOT NULL,
	[dsv_table_id] [int] NULL,
	[Name] [nvarchar](max) NULL,
	[FriendlyName] [nvarchar](max) NULL,
	[DataType] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[AllowNull] [bit] NULL,
	[Length] [int] NULL,
	[DbColumnName] [nvarchar](max) NULL,
 CONSTRAINT [PK_tblVS_dsv_columns] PRIMARY KEY CLUSTERED 
(
	[dsv_column_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
