SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROC [dbo].[usp_BackupDatabase]
as

DBCC SHRINKDATABASE(N'CubeMetaData' )
DBCC SHRINKFILE (N'CubeMetaData_log' , 0)


BACKUP DATABASE CubeMetaData  
TO DISK = 'C:\_car\CarilionCube\DW_backup\CubeMetaData_stj.bak'  
   WITH FORMAT, COPY_ONLY, COMPRESSION,
      NAME = 'Copy Only Full Backup of CubeMetaData';
GO
