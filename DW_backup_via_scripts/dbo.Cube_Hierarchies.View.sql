USE [carilion_dw]
GO
set nocount on
GO

GO
/****** Object:  View [dbo].[Cube_Hierarchies]    Script Date: 6/21/2018 11:44:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Cube_Hierarchies]'))
EXEC dbo.sp_executesql @statement = N'



CREATE VIEW [dbo].[Cube_Hierarchies]
AS
--   select * from [dbo].[Cube_Hierarchies]

SELECT
     CAST([cube_name] AS NVARCHAR(4000)) AS [cube_name]
    ,CAST([dimension_unique_name] AS NVARCHAR(4000)) AS [dimension_unique_name]
    ,CAST([hierarchy_name] AS NVARCHAR(4000)) AS [hierarchy_name]
    ,CAST([hierarchy_unique_name] AS NVARCHAR(4000)) AS [hierarchy_unique_name]
    ,CAST([hierarchy_caption] AS NVARCHAR(4000)) AS [hierarchy_caption]
    ,[dimension_type]
    ,[hierarchy_cardinality]
    ,CAST([default_member] AS NVARCHAR(4000)) AS [default_member]
    ,CAST([all_member] AS NVARCHAR(4000)) AS [all_member]
    ,CAST([description] AS NVARCHAR(4000)) AS [description]
    ,[structure]
    ,[is_virtual]
    ,[is_readwrite]
    ,[dimension_unique_settings]
    ,CAST([dimension_master_unique_name] AS NVARCHAR(4000)) AS [dimension_master_unique_name]
    ,[dimension_is_visible]
    ,[hierarchy_ordinal]
    ,[dimension_is_shared]
    ,[hierarchy_is_visible]
    ,[hierarchy_origin]
    ,CAST([hierarchy_display_folder] AS NVARCHAR(4000)) AS [hierarchy_display_folder]
    ,[instance_selection]
    ,[grouping_behavior]
    ,CAST([structure_type] AS NVARCHAR(4000)) AS [structure_type]
FROM
    OPENQUERY(SSAS_LH_ANALYTICS, 
''
SELECT 
[cube_name]
,[dimension_unique_name]
,[hierarchy_name]
,[hierarchy_unique_name]
,[hierarchy_caption]
,[dimension_type]
,[hierarchy_cardinality]
,[default_member]
,[all_member]
,[description]
,[structure]
,[is_virtual]
,[is_readwrite]
,[dimension_unique_settings]
,[dimension_master_unique_name]
,[dimension_is_visible]
,[hierarchy_ordinal]
,[dimension_is_shared]
,[hierarchy_is_visible]
,[hierarchy_origin]
,[hierarchy_display_folder]
,[instance_selection]
,[grouping_behavior]
,[structure_type]
FROM   $system.mdschema_hierarchies
WHERE  cube_name = ''''Analytics'''' or cube_name = ''''Census'''';''
)




' 
GO
