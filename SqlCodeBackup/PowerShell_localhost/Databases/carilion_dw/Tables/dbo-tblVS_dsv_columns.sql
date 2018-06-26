SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblVS_dsv_columns](
	[dsv_column_id] [int] NULL,
	[dsv_table_id] [int] NULL,
	[Name] [nvarchar](max) NULL,
	[FriendlyName] [nvarchar](max) NULL,
	[DataType] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[AllowNull] [bit] NULL,
	[Length] [int] NULL,
	[DbColumnName] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
