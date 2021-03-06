copy nul > _output.txt
rem sqlcmd -S localhost -i drop_database.sql >> _output.txt
sqlcmd -S localhost -i carilion_dw.Database.sql >> _output.txt
sqlcmd -S localhost -i dbo.ExecSqlStatementsTableType.UserDefinedTableType.sql >> _output.txt
sqlcmd -S localhost -i dbo.tblCube_Data_Types.Table.sql >> _output.txt
sqlcmd -S localhost -i dbo.tblCube_Dimensions.Table.sql >> _output.txt
sqlcmd -S localhost -i dbo.tblCube_Dimension_Type.Table.sql >> _output.txt
sqlcmd -S localhost -i dbo.tblCube_Hierarchies.Table.sql >> _output.txt
sqlcmd -S localhost -i dbo.tblCube_Levels.Table.sql >> _output.txt
sqlcmd -S localhost -i dbo.tblCube_Measures.Table.sql >> _output.txt
sqlcmd -S localhost -i dbo.tblCube_Measure_Aggregator.Table.sql >> _output.txt
sqlcmd -S localhost -i dbo.tblCube_Measure_Groups.Table.sql >> _output.txt
sqlcmd -S localhost -i dbo.tblCube_Measure_Group_vs_Dimensions.Table.sql >> _output.txt
sqlcmd -S localhost -i dbo.tblCube_Usage_Between_Dimensions_And_Facts.Table.sql >> _output.txt
sqlcmd -S localhost -i dbo.tblExecSqlStatements_Results_TableType_V01.Table.sql >> _output.txt
sqlcmd -S localhost -i dbo.Cube_Data_Types.View.sql >> _output.txt
sqlcmd -S localhost -i dbo.Cube_Dimensions.View.sql >> _output.txt
sqlcmd -S localhost -i dbo.Cube_Dimension_Type.View.sql >> _output.txt
sqlcmd -S localhost -i dbo.Cube_Hierarchies.View.sql >> _output.txt
sqlcmd -S localhost -i dbo.Cube_Levels.View.sql >> _output.txt
sqlcmd -S localhost -i dbo.Cube_Measures.View.sql >> _output.txt
sqlcmd -S localhost -i dbo.Cube_Measure_Aggregator.View.sql >> _output.txt
sqlcmd -S localhost -i dbo.Cube_Measure_Groups.View.sql >> _output.txt
sqlcmd -S localhost -i dbo.Cube_Measure_Group_vs_Dimensions.View.sql >> _output.txt
sqlcmd -S localhost -i dbo.Cube_Usage_Between_Dimensions_And_Facts.View.sql >> _output.txt
sqlcmd -S localhost -i dbo.Cube_Usage_Between_Dimensions_And_Facts__Excel_Compatible.View.sql >> _output.txt
sqlcmd -S localhost -i dbo.ufn_BOMONTH.UserDefinedFunction.sql >> _output.txt
sqlcmd -S localhost -i dbo.ufn_DateToUnixEpochTimestamp.UserDefinedFunction.sql >> _output.txt
sqlcmd -S localhost -i dbo.ufn_FindPrimaryKey.UserDefinedFunction.sql >> _output.txt
sqlcmd -S localhost -i dbo.usp_ExecSqlStatements.StoredProcedure.sql >> _output.txt
sqlcmd -S localhost -i dbo.usp_BackupDatabase.StoredProcedure.sql >> _output.txt
sqlcmd -S localhost -i dbo.usp_Cube_Load_Metadata.StoredProcedure.sql >> _output.txt
sqlcmd -S localhost -i dbo.usp_DropAllForeignKeyConstraints.StoredProcedure.sql >> _output.txt
sqlcmd -S localhost -i dbo.usp_FixForeignKeys_BetweenDimensions.StoredProcedure.sql >> _output.txt
sqlcmd -S localhost -i dbo.usp_FixForeignKeys_FactsDimensions.StoredProcedure.sql >> _output.txt
sqlcmd -S localhost -i dbo.usp_FixForeignKeys.StoredProcedure.sql >> _output.txt
sqlcmd -S localhost -i dbo.usp_MeasureGenerator_GrowthFromSamePeriodPreviousYear.StoredProcedure.sql >> _output.txt
sqlcmd -S localhost -i dbo.usp_MeasureGenerator_PercentageOfTotal.StoredProcedure.sql >> _output.txt
sqlcmd -S localhost -i dbo.usp_MeasureGenerator_PercentageOfTotal_For_Sum.StoredProcedure.sql >> _output.txt
sqlcmd -S localhost -i dbo.usp_MeasureGenerator_TestQueries.StoredProcedure.sql >> _output.txt
sqlcmd -S localhost -i dbo.usp_PopulateDateDimension.StoredProcedure.sql >> _output.txt
sqlcmd -S localhost -i dbo.usp_PopulateDiagnosisHierarchy.StoredProcedure.sql >> _output.txt
sqlcmd -S localhost -i dbo.usp_PopulateTally.StoredProcedure.sql >> _output.txt
sqlcmd -S localhost -i dbo.usp_PopulateTimeDimension.StoredProcedure.sql >> _output.txt
sqlcmd -S localhost -i dbo.usp_PopulateUserGenderDim.StoredProcedure.sql >> _output.txt
sqlcmd -S localhost -i dbo.usp_TruncateAllTables.StoredProcedure.sql >> _output.txt
sqlcmd -S localhost -i dbo.WriteToFile.StoredProcedure.sql >> _output.txt
sqlcmd -S localhost -i util.Schema.sql >> _output.txt
sqlcmd -S localhost -i util.Tally.Table.sql >> _output.txt
sqlcmd -S localhost -i util.usp_FixData_DepartmentDim.StoredProcedure.sql >> _output.txt
sqlcmd -S localhost -i util.usp_FixData_LabTestFact.StoredProcedure.sql >> _output.txt
sqlcmd -S localhost -i util.usp_FixData_LDAP_Values.StoredProcedure.sql >> _output.txt
sqlcmd -S localhost -i util.usp_RolePermissions.StoredProcedure.sql >> _output.txt
