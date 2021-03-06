USE [carilion_dw]
GO
set nocount on
GO

GO
/****** Object:  StoredProcedure [dbo].[usp_BackupDatabase]    Script Date: 6/21/2018 11:44:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_BackupDatabase]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[usp_BackupDatabase] AS' 
END
GO

ALTER PROC [dbo].[usp_BackupDatabase]
as

DBCC SHRINKDATABASE(N'carilion_dw' )
DBCC SHRINKFILE (N'carilion_dw_log' , 0)


BACKUP DATABASE carilion_dw  
TO DISK = 'C:\_car\CarilionCube\DW_backup\carilion_dw.bak'  
   WITH FORMAT, COPY_ONLY, COMPRESSION,
      NAME = 'Copy Only Full Backup of carilion_dw';  
GO
