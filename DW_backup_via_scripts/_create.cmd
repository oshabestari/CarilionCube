sqlcmd -S localhost -i carilion_dw.Database.sql -o _output.txt
sqlcmd -S localhost -i dbo.BinaryDim.Table.sql -o _output.txt
sqlcmd -S localhost -i dbo.CensusGeographicalAreaDim.Table.sql -o _output.txt
sqlcmd -S localhost -i dbo.CensusMeasureFact.Table.sql -o _output.txt
sqlcmd -S localhost -i dbo.CensusMeasureTypeDim.Table.sql -o _output.txt
sqlcmd -S localhost -i dbo.CensusSourceDim.Table.sql -o _output.txt
sqlcmd -S localhost -i dbo.Cube_Data_Types.View.sql -o _output.txt
sqlcmd -S localhost -i dbo.Cube_Dimensions.View.sql -o _output.txt
sqlcmd -S localhost -i dbo.Cube_Dimension_Type.View.sql -o _output.txt
sqlcmd -S localhost -i dbo.Cube_Hierarchies.View.sql -o _output.txt
sqlcmd -S localhost -i dbo.Cube_Levels.View.sql -o _output.txt
sqlcmd -S localhost -i dbo.Cube_Measures.View.sql -o _output.txt
sqlcmd -S localhost -i dbo.Cube_Measure_Aggregator.View.sql -o _output.txt
sqlcmd -S localhost -i dbo.Cube_Measure_Groups.View.sql -o _output.txt
sqlcmd -S localhost -i dbo.Cube_Measure_Group_vs_Dimensions.View.sql -o _output.txt
sqlcmd -S localhost -i dbo.Cube_Usage_Between_Dimensions_And_Facts.View.sql -o _output.txt
sqlcmd -S localhost -i dbo.Cube_Usage_Between_Dimensions_And_Facts__Excel_Compatible.View.sql -o _output.txt
sqlcmd -S localhost -i dbo.DateDim.Table.sql -o _output.txt
sqlcmd -S localhost -i dbo.DepartmentDim.Table.sql -o _output.txt
sqlcmd -S localhost -i dbo.DiagnosisBridge.Table.sql -o _output.txt
sqlcmd -S localhost -i dbo.DiagnosisFact.Table.sql -o _output.txt
sqlcmd -S localhost -i dbo.DiagnosisHierarchy.Table.sql -o _output.txt
sqlcmd -S localhost -i dbo.DiagnosisPresentOnAdmitDim.Table.sql -o _output.txt
sqlcmd -S localhost -i dbo.DiagnosisSourceDim.Table.sql -o _output.txt
sqlcmd -S localhost -i dbo.DM_Quality_Fact.Table.sql -o _output.txt
sqlcmd -S localhost -i dbo.DRGDim.Table.sql -o _output.txt
sqlcmd -S localhost -i dbo.DRGFact.Table.sql -o _output.txt
sqlcmd -S localhost -i dbo.DRGSeqDim.Table.sql -o _output.txt
sqlcmd -S localhost -i dbo.DRGTypeDim.Table.sql -o _output.txt
sqlcmd -S localhost -i dbo.EDVisitAcuityLevelDim.Table.sql -o _output.txt
sqlcmd -S localhost -i dbo.EDVisitDim.Table.sql -o _output.txt
sqlcmd -S localhost -i dbo.EDVisitDispositionDim.Table.sql -o _output.txt
sqlcmd -S localhost -i dbo.EDVisitFact.Table.sql -o _output.txt
sqlcmd -S localhost -i dbo.EDVisitFinancialClass.Table.sql -o _output.txt
sqlcmd -S localhost -i dbo.EDVisitMeansOfArrivalDim.Table.sql -o _output.txt
sqlcmd -S localhost -i dbo.EncounterBillingClassDim.Table.sql -o _output.txt
sqlcmd -S localhost -i dbo.EncounterDepartmentDim.Table.sql -o _output.txt
sqlcmd -S localhost -i dbo.EncounterDim.Table.sql -o _output.txt
sqlcmd -S localhost -i dbo.EncounterEncouterTypeDim.Table.sql -o _output.txt
sqlcmd -S localhost -i dbo.EncounterFact.Table.sql -o _output.txt
sqlcmd -S localhost -i dbo.EncounterLevelofCareDim.Table.sql -o _output.txt
sqlcmd -S localhost -i dbo.EncounterPatientStatusDim.Table.sql -o _output.txt
sqlcmd -S localhost -i dbo.EncounterProductLineDim.Table.sql -o _output.txt
sqlcmd -S localhost -i dbo.EncouterBaseClassDim.Table.sql -o _output.txt
sqlcmd -S localhost -i dbo.ExecSqlStatementsTableType.UserDefinedTableType.sql -o _output.txt
sqlcmd -S localhost -i dbo.InpatientAdmitSourceDim.Table.sql -o _output.txt
sqlcmd -S localhost -i dbo.InpatientAdmitTypeDim.Table.sql -o _output.txt
sqlcmd -S localhost -i dbo.InpatientDim.Table.sql -o _output.txt
sqlcmd -S localhost -i dbo.InpatientDischargeDestinationDim.Table.sql -o _output.txt
sqlcmd -S localhost -i dbo.InpatientDischargeDispositionDim.Table.sql -o _output.txt
sqlcmd -S localhost -i dbo.InpatientFact.Table.sql -o _output.txt
sqlcmd -S localhost -i dbo.InpatientPatientClassDim.Table.sql -o _output.txt
sqlcmd -S localhost -i dbo.LabComponentDim.Table.sql -o _output.txt
sqlcmd -S localhost -i dbo.LabComponentResultFact.Table.sql -o _output.txt
sqlcmd -S localhost -i dbo.LabComponentResultFactLabStatusDim.Table.sql -o _output.txt
sqlcmd -S localhost -i dbo.LabComponentResultFactResultFlagDim.Table.sql -o _output.txt
sqlcmd -S localhost -i dbo.LabComponentSubstrateDim.Table.sql -o _output.txt
sqlcmd -S localhost -i dbo.LabComponentTypeDim.Table.sql -o _output.txt
sqlcmd -S localhost -i dbo.LabDim.Table.sql -o _output.txt
sqlcmd -S localhost -i dbo.LabTestCancellationReasonDim.Table.sql -o _output.txt
sqlcmd -S localhost -i dbo.LabTestDim.Table.sql -o _output.txt
sqlcmd -S localhost -i dbo.LabTestFact.Table.sql -o _output.txt
sqlcmd -S localhost -i dbo.LabTestNameDim.Table.sql -o _output.txt
sqlcmd -S localhost -i dbo.LabTestOrderPriorityDim.Table.sql -o _output.txt
sqlcmd -S localhost -i dbo.LabTestOrderSourceTypeDim.Table.sql -o _output.txt
sqlcmd -S localhost -i dbo.LabTestOrderTypeDim.Table.sql -o _output.txt
sqlcmd -S localhost -i dbo.LabTestSpecimenSourceDim.Table.sql -o _output.txt
sqlcmd -S localhost -i dbo.LabTestSpecimenTypeDim.Table.sql -o _output.txt
sqlcmd -S localhost -i dbo.LabTestVerificationStatusDim.Table.sql -o _output.txt
sqlcmd -S localhost -i dbo.LDAP_Dim.Table.sql -o _output.txt
sqlcmd -S localhost -i dbo.LDAP_UserProvider_ReportingBridge.Table.sql -o _output.txt
sqlcmd -S localhost -i dbo.MeasureDim.Table.sql -o _output.txt
sqlcmd -S localhost -i dbo.MeasureGroupDim.Table.sql -o _output.txt
sqlcmd -S localhost -i dbo.MeasureMDFact.Table.sql -o _output.txt
sqlcmd -S localhost -i dbo.MeasureMLFact.Table.sql -o _output.txt
sqlcmd -S localhost -i dbo.MeasureQDFact.Table.sql -o _output.txt
sqlcmd -S localhost -i dbo.MeasureQLFact.Table.sql -o _output.txt
sqlcmd -S localhost -i dbo.MeasureSourceDim.Table.sql -o _output.txt
sqlcmd -S localhost -i dbo.MedicationAdministrationActionDim.Table.sql -o _output.txt
sqlcmd -S localhost -i dbo.MedicationAdministrationFact.Table.sql -o _output.txt
sqlcmd -S localhost -i dbo.MedicationAdministrationRouteDim.Table.sql -o _output.txt
sqlcmd -S localhost -i dbo.MedicationDEAClassDim.Table.sql -o _output.txt
sqlcmd -S localhost -i dbo.MedicationDim.Table.sql -o _output.txt
sqlcmd -S localhost -i dbo.MedicationFormDim.Table.sql -o _output.txt
sqlcmd -S localhost -i dbo.MedicationOrderCalculatedDoseUnitDim.Table.sql -o _output.txt
sqlcmd -S localhost -i dbo.MedicationOrderClassDim.Table.sql -o _output.txt
sqlcmd -S localhost -i dbo.MedicationOrderDim.Table.sql -o _output.txt
sqlcmd -S localhost -i dbo.MedicationOrderDoseUnitDim.Table.sql -o _output.txt
sqlcmd -S localhost -i dbo.MedicationOrderFact.Table.sql -o _output.txt
sqlcmd -S localhost -i dbo.MedicationOrderFrequencyDim.Table.sql -o _output.txt
sqlcmd -S localhost -i dbo.MedicationOrderModeDim.Table.sql -o _output.txt
sqlcmd -S localhost -i dbo.MedicationOrderPriorityDim.Table.sql -o _output.txt
sqlcmd -S localhost -i dbo.MedicationOrderQuantityUnitDim.Table.sql -o _output.txt
sqlcmd -S localhost -i dbo.MedicationOrderRouteDim.Table.sql -o _output.txt
sqlcmd -S localhost -i dbo.MedicationOrderSetSourceDim.Table.sql -o _output.txt
sqlcmd -S localhost -i dbo.MedicationOrderSourceDim.Table.sql -o _output.txt
sqlcmd -S localhost -i dbo.MedicationPharmacologicalClassDim.Table.sql -o _output.txt
sqlcmd -S localhost -i dbo.MedicationPharmacologicalSubclassDim.Table.sql -o _output.txt
sqlcmd -S localhost -i dbo.MedicationTherapeuticClassDim.Table.sql -o _output.txt
sqlcmd -S localhost -i dbo.OutpatientAdmitConfStatrusDim.Table.sql -o _output.txt
sqlcmd -S localhost -i dbo.OutpatientAppointmentConfirmationStatusDim.Table.sql -o _output.txt
sqlcmd -S localhost -i dbo.OutpatientAppointmentStatusDim.Table.sql -o _output.txt
sqlcmd -S localhost -i dbo.OutpatientCancellationReasonDim.Table.sql -o _output.txt
sqlcmd -S localhost -i dbo.OutpatientDim.Table.sql -o _output.txt
sqlcmd -S localhost -i dbo.OutpatientFact.Table.sql -o _output.txt
sqlcmd -S localhost -i dbo.OutpatientFinancialClassDim.Table.sql -o _output.txt
sqlcmd -S localhost -i dbo.PatientDim.Table.sql -o _output.txt
sqlcmd -S localhost -i dbo.PharmacyDim.Table.sql -o _output.txt
sqlcmd -S localhost -i dbo.PharmacyPhysicalTypeDim.Table.sql -o _output.txt
sqlcmd -S localhost -i dbo.ProcedureCategoryDim.Table.sql -o _output.txt
sqlcmd -S localhost -i dbo.ProcedureDim.Table.sql -o _output.txt
sqlcmd -S localhost -i dbo.ProcedureOrderClassDim.Table.sql -o _output.txt
sqlcmd -S localhost -i dbo.ProcedureOrderFact.Table.sql -o _output.txt
sqlcmd -S localhost -i dbo.ProcedureOrderModeDim.Table.sql -o _output.txt
sqlcmd -S localhost -i dbo.ProcedureOrderPriorityDim.Table.sql -o _output.txt
sqlcmd -S localhost -i dbo.ProcedureOrderSetDm.Table.sql -o _output.txt
sqlcmd -S localhost -i dbo.ProcedureOrderSourceDim.Table.sql -o _output.txt
sqlcmd -S localhost -i dbo.ProcedureOrderStandingStatusDim.Table.sql -o _output.txt
sqlcmd -S localhost -i dbo.ProcedureOrderStatusDim.Table.sql -o _output.txt
sqlcmd -S localhost -i dbo.ProcedureOrderTypeDim.Table.sql -o _output.txt
sqlcmd -S localhost -i dbo.ProcedureRevenueCodeDim.Table.sql -o _output.txt
sqlcmd -S localhost -i dbo.ProcedureTypeDim.Table.sql -o _output.txt
sqlcmd -S localhost -i dbo.ProgramDim.Table.sql -o _output.txt
sqlcmd -S localhost -i dbo.ProviderAffiliationDim.Table.sql -o _output.txt
sqlcmd -S localhost -i dbo.ProviderClinicianTitleDim.Table.sql -o _output.txt
sqlcmd -S localhost -i dbo.ProviderDim.Table.sql -o _output.txt
sqlcmd -S localhost -i dbo.ProviderFieldOfPracticeDim.Table.sql -o _output.txt
sqlcmd -S localhost -i dbo.ProviderInternalExternalDim.Table.sql -o _output.txt
sqlcmd -S localhost -i dbo.ProviderPrimaryDepartmentDim.Table.sql -o _output.txt
sqlcmd -S localhost -i dbo.ProviderPrimarySpecialtyDim.Table.sql -o _output.txt
sqlcmd -S localhost -i dbo.ProviderReportingStructureDim.Table.sql -o _output.txt
sqlcmd -S localhost -i dbo.ProviderTypeDim.Table.sql -o _output.txt
sqlcmd -S localhost -i dbo.SugicalProcedureEventWoundClassDim.Table.sql -o _output.txt
sqlcmd -S localhost -i dbo.SurgicalCaseClassDim.Table.sql -o _output.txt
sqlcmd -S localhost -i dbo.SurgicalCaseDim.Table.sql -o _output.txt
sqlcmd -S localhost -i dbo.SurgicalCaseFact.Table.sql -o _output.txt
sqlcmd -S localhost -i dbo.SurgicalCasePatientClassDim.Table.sql -o _output.txt
sqlcmd -S localhost -i dbo.SurgicalCasePrimaryAnesthesiaTypeDim.Table.sql -o _output.txt
sqlcmd -S localhost -i dbo.SurgicalCasePrimaryServiceDim.Table.sql -o _output.txt
sqlcmd -S localhost -i dbo.SurgicalCaseProcedureLevelDim.Table.sql -o _output.txt
sqlcmd -S localhost -i dbo.SurgicalCaseReasonNotPerformedDim.Table.sql -o _output.txt
sqlcmd -S localhost -i dbo.SurgicalProcedureEventAnesthesiaTypeDim.Table.sql -o _output.txt
sqlcmd -S localhost -i dbo.SurgicalProcedureEventFact.Table.sql -o _output.txt
sqlcmd -S localhost -i dbo.SurgicalProcedureEventLateralityDim.Table.sql -o _output.txt
sqlcmd -S localhost -i dbo.SurgicalProcedureEventProcedureSiteDim.Table.sql -o _output.txt
sqlcmd -S localhost -i dbo.SurgicalProcedureEventServiceDim.Table.sql -o _output.txt
sqlcmd -S localhost -i dbo.SurgicalSupplyDim.Table.sql -o _output.txt
sqlcmd -S localhost -i dbo.SurgicalSupplyManufacturerDim.Table.sql -o _output.txt
sqlcmd -S localhost -i dbo.SurgicalSupplyUseFact.Table.sql -o _output.txt
sqlcmd -S localhost -i dbo.SurgicalSupplyUseLogStatusDim.Table.sql -o _output.txt
sqlcmd -S localhost -i dbo.SurgicalSupplyUseORServiceDim.Table.sql -o _output.txt
sqlcmd -S localhost -i dbo.SurgicalSupplyVendorDim.Table.sql -o _output.txt
sqlcmd -S localhost -i dbo.tblCube_Data_Types.Table.sql -o _output.txt
sqlcmd -S localhost -i dbo.tblCube_Dimensions.Table.sql -o _output.txt
sqlcmd -S localhost -i dbo.tblCube_Dimension_Type.Table.sql -o _output.txt
sqlcmd -S localhost -i dbo.tblCube_Hierarchies.Table.sql -o _output.txt
sqlcmd -S localhost -i dbo.tblCube_Levels.Table.sql -o _output.txt
sqlcmd -S localhost -i dbo.tblCube_Measures.Table.sql -o _output.txt
sqlcmd -S localhost -i dbo.tblCube_Measure_Aggregator.Table.sql -o _output.txt
sqlcmd -S localhost -i dbo.tblCube_Measure_Groups.Table.sql -o _output.txt
sqlcmd -S localhost -i dbo.tblCube_Measure_Group_vs_Dimensions.Table.sql -o _output.txt
sqlcmd -S localhost -i dbo.tblCube_Usage_Between_Dimensions_And_Facts.Table.sql -o _output.txt
sqlcmd -S localhost -i dbo.tblExecSqlStatements_Results_TableType_V01.Table.sql -o _output.txt
sqlcmd -S localhost -i dbo.TimeDim.Table.sql -o _output.txt
sqlcmd -S localhost -i dbo.ufn_BOMONTH.UserDefinedFunction.sql -o _output.txt
sqlcmd -S localhost -i dbo.ufn_DateToUnixEpochTimestamp.UserDefinedFunction.sql -o _output.txt
sqlcmd -S localhost -i dbo.ufn_FindPrimaryKey.UserDefinedFunction.sql -o _output.txt
sqlcmd -S localhost -i dbo.UserDim.Table.sql -o _output.txt
sqlcmd -S localhost -i dbo.UserGenderDim.Table.sql -o _output.txt
sqlcmd -S localhost -i dbo.usp_BackupDatabase.StoredProcedure.sql -o _output.txt
sqlcmd -S localhost -i dbo.usp_Cube_Load_Metadata.StoredProcedure.sql -o _output.txt
sqlcmd -S localhost -i dbo.usp_DropAllForeignKeyConstraints.StoredProcedure.sql -o _output.txt
sqlcmd -S localhost -i dbo.usp_ExecSqlStatements.StoredProcedure.sql -o _output.txt
sqlcmd -S localhost -i dbo.usp_FixForeignKeys.StoredProcedure.sql -o _output.txt
sqlcmd -S localhost -i dbo.usp_FixForeignKeys_BetweenDimensions.StoredProcedure.sql -o _output.txt
sqlcmd -S localhost -i dbo.usp_FixForeignKeys_FactsDimensions.StoredProcedure.sql -o _output.txt
sqlcmd -S localhost -i dbo.usp_MeasureGenerator_GrowthFromSamePeriodPreviousYear.StoredProcedure.sql -o _output.txt
sqlcmd -S localhost -i dbo.usp_MeasureGenerator_PercentageOfTotal.StoredProcedure.sql -o _output.txt
sqlcmd -S localhost -i dbo.usp_MeasureGenerator_PercentageOfTotal_For_Sum.StoredProcedure.sql -o _output.txt
sqlcmd -S localhost -i dbo.usp_MeasureGenerator_TestQueries.StoredProcedure.sql -o _output.txt
sqlcmd -S localhost -i dbo.usp_PopulateDateDimension.StoredProcedure.sql -o _output.txt
sqlcmd -S localhost -i dbo.usp_PopulateDiagnosisHierarchy.StoredProcedure.sql -o _output.txt
sqlcmd -S localhost -i dbo.usp_PopulateTally.StoredProcedure.sql -o _output.txt
sqlcmd -S localhost -i dbo.usp_PopulateTimeDimension.StoredProcedure.sql -o _output.txt
sqlcmd -S localhost -i dbo.usp_PopulateUserGenderDim.StoredProcedure.sql -o _output.txt
sqlcmd -S localhost -i dbo.usp_TruncateAllTables.StoredProcedure.sql -o _output.txt
sqlcmd -S localhost -i dbo.WriteToFile.StoredProcedure.sql -o _output.txt
sqlcmd -S localhost -i util.Schema.sql -o _output.txt
sqlcmd -S localhost -i util.Tally.Table.sql -o _output.txt
sqlcmd -S localhost -i util.usp_FixData_DepartmentDim.StoredProcedure.sql -o _output.txt
sqlcmd -S localhost -i util.usp_FixData_LabTestFact.StoredProcedure.sql -o _output.txt
sqlcmd -S localhost -i util.usp_FixData_LDAP_Values.StoredProcedure.sql -o _output.txt
sqlcmd -S localhost -i util.usp_RolePermissions.StoredProcedure.sql -o _output.txt
