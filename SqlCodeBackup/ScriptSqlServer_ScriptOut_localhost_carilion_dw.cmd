powershell -NonInteractive -file C:\_car\CarilionCube\SqlCodeBackup\PowerShellScriptServer_Template.ps1 -sql_server localhost\sql2016
sqlcmd -S localhost\sql2016 -E -d CubeMetaData -Q "exec [dbo].[usp_BackupDatabase_Carlos]"
sqlcmd -S localhost\sql2016 -E -d CubeMetaData_stj -Q "exec [dbo].[usp_BackupDatabase_Carlos]"
sqlcmd -S localhost\sql2016 -E -d carilion_dw -Q "exec [dbo].[usp_BackupDatabase_Carlos]"

del /Q C:\_car\CarilionCube\DW_backup\CubeMetaData.bak.7z
del /Q C:\_car\CarilionCube\DW_backup\carilion_dw.bak.7z

"c:\Program Files\7-Zip\7z.exe" a -t7z -m0=PPMd -mx=9 "C:\_car\CarilionCube\DW_backup\CubeMetaData.bak.7z" "C:\_car\CarilionCube\DW_backup\CubeMetaData.bak"
"c:\Program Files\7-Zip\7z.exe" a -t7z -m0=PPMd -mx=9 "C:\_car\CarilionCube\DW_backup\carilion_dw.bak.7z" "C:\_car\CarilionCube\DW_backup\carilion_dw.bak"
