SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCube_Data_Types](
	[type_name] [nvarchar](4000) NULL,
	[data_type] [int] NOT NULL,
	[column_size] [int] NULL,
	[literal_prefix] [nvarchar](4000) NULL,
	[literal_suffix] [nvarchar](4000) NULL,
	[create_params] [nvarchar](4000) NULL,
	[is_nullable] [bit] NULL,
	[case_sensitive] [bit] NULL,
	[searchable] [int] NULL,
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
	[is_fixedlength] [bit] NULL,
	[pkey]  AS (isnull(hashbytes('SHA2_512',[type_name]),(0))) PERSISTED NOT NULL,
 CONSTRAINT [PK_tblCube_Data_Types] PRIMARY KEY CLUSTERED 
(
	[data_type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
