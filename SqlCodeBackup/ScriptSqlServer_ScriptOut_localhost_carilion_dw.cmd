powershell -NonInteractive -file C:\_car\CarilionCube\SqlCodeBackup\PowerShellScriptServer_Template.ps1 -sql_server localhost\sql2016
sqlcmd -S localhost\sql2016 -E -d CubeMetaData -Q "exec [dbo].[usp_BackupDatabase]"
