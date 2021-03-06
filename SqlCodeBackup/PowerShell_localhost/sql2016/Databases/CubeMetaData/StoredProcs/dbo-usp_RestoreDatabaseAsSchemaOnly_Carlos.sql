SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[usp_RestoreDatabaseAsSchemaOnly_Carlos]
as

RESTORE DATABASE [CubeMetaData_SchemaOnly] 
FROM  DISK = N'C:\_car\CarilionCube\DW_backup\CubeMetaData.bak' 
    WITH FILE = 1,  
    MOVE N'CubeMetaData' TO N'c:\SqlData\MSSQL13.SQL2016\MSSQL\DATA\CubeMetaData_SchemaOnly.mdf',  
    MOVE N'CubeMetaData_log' TO N'c:\SqlData\MSSQL13.SQL2016\MSSQL\DATA\CubeMetaData_SchemaOnly_log.ldf',  
    NOUNLOAD,  STATS = 5

GO
