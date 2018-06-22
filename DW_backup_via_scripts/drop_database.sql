EXEC msdb.dbo.sp_delete_database_backuphistory @database_name = N'carilion_dw_cubeonly'
GO
USE [master]
GO
DROP DATABASE [carilion_dw_cubeonly]
GO
