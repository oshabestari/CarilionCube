USE [carilion_dw]
GO
set nocount on
GO

GO
/****** Object:  Table [dbo].[tblCube_Data_Types]    Script Date: 6/21/2018 11:44:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblCube_Data_Types]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tblCube_Data_Types](
	[type_name] [nvarchar](4000) NULL,
	[data_type] [numeric](5, 0) NULL,
	[column_size] [numeric](10, 0) NULL,
	[literal_prefix] [nvarchar](4000) NULL,
	[literal_suffix] [nvarchar](4000) NULL,
	[create_params] [nvarchar](4000) NULL,
	[is_nullable] [bit] NULL,
	[case_sensitive] [bit] NULL,
	[searchable] [numeric](10, 0) NULL,
	[unsigned_attribute] [bit] NULL,
	[fixed_prec_scale] [bit] NULL,
	[auto_unique_value] [bit] NULL,
	[local_type_name] [nvarchar](4000) NULL,
	[minimum_scale] [smallint] NULL,
	[maximum_scale] [smallint] NULL,
	[guid] [uniqueidentifier] NULL,
	[typelib] [nvarchar](4000) NULL,
	[version] [nvarchar](4000) NULL,
	[is_long] [bit] NULL,
	[best_match] [bit] NULL,
	[is_fixedlength] [bit] NULL
) ON [PRIMARY]
END
GO
