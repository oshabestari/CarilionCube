USE [carilion_dw]
GO
set nocount on
GO

GO
/****** Object:  View [dbo].[Cube_Levels]    Script Date: 6/21/2018 11:44:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Cube_Levels]'))
EXEC dbo.sp_executesql @statement = N'







CREATE VIEW [dbo].[Cube_Levels]
AS
--    select * from [dbo].[Cube_Levels]
SELECT
     CAST([cube_name] AS NVARCHAR(4000)) AS [cube_name]
    ,CAST([dimension_unique_name] AS NVARCHAR(4000)) AS [dimension_unique_name]
    ,CAST([hierarchy_unique_name] AS NVARCHAR(4000)) AS [hierarchy_unique_name]
    ,CAST([level_name] AS NVARCHAR(4000)) AS [level_name]
    ,CAST([level_unique_name] AS NVARCHAR(4000)) AS [level_unique_name]
    ,CAST([level_caption] AS NVARCHAR(4000)) AS [level_caption]
    ,CAST([level_ordering_property] AS NVARCHAR(4000)) AS [level_ordering_property]
    ,CAST([description] AS NVARCHAR(4000)) AS [description]
    ,CAST([level_master_unique_name] AS NVARCHAR(4000)) AS [level_master_unique_name]
    ,CAST([level_name_sql_column_name] AS NVARCHAR(4000)) AS [level_name_sql_column_name]
    ,CAST([level_key_sql_column_name] AS NVARCHAR(4000)) AS [level_key_sql_column_name]
    ,CAST([level_unique_name_sql_column_name] AS NVARCHAR(4000)) AS [level_unique_name_sql_column_name]
    ,CAST([level_attribute_hierarchy_name] AS NVARCHAR(4000)) AS [level_attribute_hierarchy_name]
    ,CASE level_type
        WHEN 0x2001 THEN N''MDLEVEL_TYPE_GEO_CONTINENT''
        WHEN 0x2002 THEN N''MDLEVEL_TYPE_GEO_REGION''
        WHEN 0x2003 THEN N''MDLEVEL_TYPE_GEO_COUNTRY''
        WHEN 0x2004 THEN N''MDLEVEL_TYPE_GEO_STATE_OR_PROVINCE''
        WHEN 0x2005 THEN N''MDLEVEL_TYPE_GEO_COUNTY''
        WHEN 0x2006 THEN N''MDLEVEL_TYPE_GEO_CITY''
        WHEN 0x2007 THEN N''MDLEVEL_TYPE_GEO_POSTALCODE''
        WHEN 0x2008 THEN N''MDLEVEL_TYPE_GEO_POINT''
        WHEN 0x1011 THEN N''MDLEVEL_TYPE_ORG_UNIT''
        WHEN 0x1012 THEN N''MDLEVEL_TYPE_BOM_RESOURCE''
        WHEN 0x1013 THEN N''MDLEVEL_TYPE_QUANTITATIVE''
        WHEN 0x1014 THEN N''MDLEVEL_TYPE_ACCOUNT''
        WHEN 0x1021 THEN N''MDLEVEL_TYPE_CUSTOMER''
        WHEN 0x1022 THEN N''MDLEVEL_TYPE_CUSTOMER_GROUP''
        WHEN 0x1023 THEN N''MDLEVEL_TYPE_CUSTOMER_HOUSEHOLD''
        WHEN 0x1031 THEN N''MDLEVEL_TYPE_PRODUCT''
        WHEN 0x1032 THEN N''MDLEVEL_TYPE_PRODUCT_GROUP''
        WHEN 0x1015 THEN N''MDLEVEL_TYPE_SCENARIO''
        WHEN 0x1016 THEN N''MDLEVEL_TYPE_UTILITY''
        WHEN 0x1041 THEN N''MDLEVEL_TYPE_PERSON''
        WHEN 0x1042 THEN N''MDLEVEL_TYPE_COMPANY''
        WHEN 0x1051 THEN N''MDLEVEL_TYPE_CURRENCY_SOURCE''
        WHEN 0x1052 THEN N''MDLEVEL_TYPE_CURRENCY_DESTINATION''
        WHEN 0x1061 THEN N''MDLEVEL_TYPE_CHANNEL''
        WHEN 0x1062 THEN N''MDLEVEL_TYPE_REPRESENTATIVE''
        WHEN 0x1071 THEN N''MDLEVEL_TYPE_PROMOTION''
    END AS level_type_name
    ,CASE [custom_rollup_settings]
        WHEN 0x00 THEN N''NO_CUSTOM_ROLLUP''
        WHEN 0x01 THEN N''MDLEVELS_CUSTOM_ROLLUP_EXPRESSION''
        WHEN 0x02 THEN N''MDLEVELS_CUSTOM_ROLLUP_COLUMN''
        WHEN 0x04 THEN N''MDLEVELS_SKIPPED_LEVELS''
        WHEN 0x08 THEN N''MDLEVELS_CUSTOM_MEMBER_PROPERTIES''
        WHEN 0x10 THEN N''MDLEVELS_UNARY_OPERATOR''
    END AS [custom_rollup_settings_name]
    ,CASE [level_unique_settings]
        WHEN 0 THEN N''NOT UNIQUE''
        WHEN 1 THEN N''MDDIMENSIONS_MEMBER_KEY_UNIQUE''
        WHEN 2 THEN N''MDDIMENSIONS_MEMBER_NAME_UNIQUE''
    END AS [level_unique_settings_name]
    ,CASE [level_origin]
        WHEN 1 THEN N''MD_ORIGIN_USER_DEFINED''
        WHEN 2 THEN N''MD_ORIGIN_ATTRIBUTE''
        WHEN 4 THEN N''MD_ORIGIN_KEY_ATTRIBUTE''
        WHEN 8 THEN N''MD_ORIGIN_INTERNAL''
    END AS [level_origin_name]
    ,[level_number]
    ,[level_cardinality]
    ,[level_type]
    ,[custom_rollup_settings]
    ,[level_unique_settings]
    ,[level_is_visible]
    ,[level_dbtype]
    ,[level_key_cardinality]
    ,[level_origin]
FROM
    OPENQUERY(SSAS_LH_ANALYTICS, 
''select
 [cube_name]
,[dimension_unique_name]
,[hierarchy_unique_name]
,[level_name]
,[level_unique_name]
,[level_caption]
,[level_ordering_property]
,[description]
,[level_master_unique_name]
,[level_name_sql_column_name]
,[level_key_sql_column_name]
,[level_unique_name_sql_column_name]
,[level_attribute_hierarchy_name]
,[level_number]
,[level_cardinality]
,[level_type]
,[custom_rollup_settings]
,[level_unique_settings]
,[level_is_visible]
,[level_dbtype]
,[level_key_cardinality]
,[level_origin]
from $system.mdschema_levels
WHERE  cube_name = ''''Analytics'''' or cube_name = ''''Census'''';''
)


' 
GO
