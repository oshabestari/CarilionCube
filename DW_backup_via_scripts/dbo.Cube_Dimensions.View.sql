USE [carilion_dw]
GO
set nocount on
GO

GO
/****** Object:  View [dbo].[Cube_Dimensions]    Script Date: 6/21/2018 11:44:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Cube_Dimensions]'))
EXEC dbo.sp_executesql @statement = N'






CREATE VIEW [dbo].[Cube_Dimensions]
AS
--   select * from [dbo].[Cube_Dimensions]

SELECT
     CAST([cube_name] AS NVARCHAR(4000)) AS [cube_name]
    ,CAST([dimension_name] AS NVARCHAR(4000)) AS [dimension_name]
    ,CAST([dimension_unique_name] AS NVARCHAR(4000)) AS [dimension_unique_name]
    ,CAST([dimension_caption] AS NVARCHAR(4000)) AS [dimension_caption]
    ,CAST([default_hierarchy] AS NVARCHAR(4000)) AS [default_hierarchy]
    ,CAST([description] AS NVARCHAR(4000)) AS [description]
    ,CAST([dimension_master_name] AS NVARCHAR(4000)) AS [dimension_master_name]
    ,[dimension_ordinal]
    ,[dimension_type]
    ,[dimension_cardinality]
    ,[is_virtual]
    ,[is_readwrite]
    ,[dimension_unique_settings]
    ,[dimension_is_visible]
FROM
    OPENQUERY(SSAS_LH_ANALYTICS, 
''SELECT 
 [cube_name]
,[dimension_name]
,[dimension_unique_name]
,[dimension_caption]
,[default_hierarchy]
,[description]
,[dimension_master_name]
,[dimension_ordinal]
,[dimension_type]
,[dimension_cardinality]
,[is_virtual]
,[is_readwrite]
,[dimension_unique_settings]
,[dimension_is_visible]
FROM   $system.mdschema_dimensions
WHERE  cube_name = ''''Analytics'''' or cube_name = ''''Census'''';''
)


' 
GO
