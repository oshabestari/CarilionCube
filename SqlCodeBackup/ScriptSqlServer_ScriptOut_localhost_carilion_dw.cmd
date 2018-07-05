powershell -NonInteractive -file C:\_car\CarilionCube\SqlCodeBackup\PowerShellScriptServer_Template.ps1 -sql_server localhost
sqlcmd -S localhost -E -d carilion_dw -Q "exec [dbo].[usp_BackupDatabase]"
