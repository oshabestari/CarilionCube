SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[usp_BackupDatabase_Carlos]
as

DBCC SHRINKFILE (N'CubeMetaData' , EMPTYFILE )
DBCC SHRINKFILE (N'CubeMetaData_log' , 0, TRUNCATEONLY)

DBCC SHRINKDATABASE (N'CubeMetaData' , TRUNCATEONLY)
DBCC SHRINKDATABASE (N'CubeMetaData_log' , TRUNCATEONLY)

declare @file nvarchar(4000) = concat('C:\_car\CarilionCube\DW_backup\', DB_NAME(), '.bak')
declare @name nvarchar(4000) = concat('Copy Only Full Backup of ', DB_NAME())


BACKUP DATABASE CubeMetaData  
TO DISK =  @file
    WITH FORMAT, COPY_ONLY, --COMPRESSION,
        NAME = @name;
GO
