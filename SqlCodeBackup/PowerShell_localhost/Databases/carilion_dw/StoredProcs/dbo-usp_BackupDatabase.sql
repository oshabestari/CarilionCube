SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[usp_BackupDatabase]
as

DBCC SHRINKDATABASE(N'carilion_dw' )
DBCC SHRINKFILE (N'carilion_dw_log' , 0)


BACKUP DATABASE carilion_dw  
TO DISK = 'C:\_car\CarilionCube\DW_backup\carilion_dw.bak'  
   WITH FORMAT, COPY_ONLY, COMPRESSION,
      NAME = 'Copy Only Full Backup of carilion_dw';  
GO
