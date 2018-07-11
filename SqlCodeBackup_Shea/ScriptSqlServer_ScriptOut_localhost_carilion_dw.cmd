powershell -NonInteractive -file "P:\Cube\Carlos - Contractor\CarilionCube-master\SqlCodeBackup_Shea\PowerShellScriptServer_Template.ps1" -sql_server ard-prd-app01
rem sqlcmd -S ard-prd-app01 -E -d CubeMetaData -Q "exec [dbo].[usp_BackupDatabase]"
