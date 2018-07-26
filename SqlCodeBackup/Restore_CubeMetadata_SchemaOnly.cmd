sqlcmd -S localhost\sql2016 -E -d CubeMetaData -Q "exec [dbo].[usp_RestoreDatabaseAsSchemaOnly_Carlos]"
sqlcmd -S localhost\sql2016 -E -d CubeMetaData_SchemaOnly -Q "exec dbo.usp_TruncateAllTables"
sqlcmd -S localhost\sql2016 -E -d CubeMetaData_SchemaOnly -Q "exec [dbo].[usp_BackupDatabase_Carlos]"
.bak"
