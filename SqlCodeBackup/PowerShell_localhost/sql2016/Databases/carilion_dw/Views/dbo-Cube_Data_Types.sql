SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Cube_Data_Types]
AS
-- select * from [dbo].[Cube_Data_Types]

SELECT 
    CAST(type_name AS NVARCHAR(4000)) AS type_name,
    data_type,
    column_size,
    CAST(literal_prefix AS NVARCHAR(4000)) AS literal_prefix,
    CAST(literal_suffix AS NVARCHAR(4000)) AS literal_suffix,
    CAST(create_params AS NVARCHAR(4000)) AS create_params,
    is_nullable,
    case_sensitive,
    searchable,
    unsigned_attribute,
    fixed_prec_scale,
    auto_unique_value,
    CAST(local_type_name AS NVARCHAR(4000)) AS local_type_name,
    minimum_scale,
    maximum_scale,
    guid,
    CAST(typelib AS NVARCHAR(4000)) AS typelib,
    CAST(version AS NVARCHAR(4000)) AS version,
    is_long,
    best_match,
    is_fixedlength
FROM
    OPENQUERY(ANALYTICS, 
'select
*
FROM
$system.DBSCHEMA_PROVIDER_TYPES;'
)
GO
