USE [carilion_dw]
GO
set nocount on
GO

GO
/****** Object:  StoredProcedure [dbo].[usp_TruncateAllTables]    Script Date: 6/21/2018 11:44:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_TruncateAllTables]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[usp_TruncateAllTables] AS' 
END
GO


ALTER PROC [dbo].[usp_TruncateAllTables]
as

-- Create the truncate table statements
/*
SELECT
    CONCAT('truncate table ', QUOTENAME(t.TABLE_SCHEMA), '.', QUOTENAME(t.TABLE_NAME))
FROM
    INFORMATION_SCHEMA.TABLES t
WHERE
    t.TABLE_SCHEMA NOT IN ('util')
    AND CONCAT(QUOTENAME(t.TABLE_SCHEMA), '.', QUOTENAME(t.TABLE_NAME)) NOT IN ('[dbo].[DateDim]', '[dbo].[sysdiagrams]')
ORDER BY
    CONCAT(QUOTENAME(t.TABLE_SCHEMA), '.', QUOTENAME(t.TABLE_NAME))
*/

truncate table [dbo].[BinaryDim]
truncate table [dbo].[CensusGeographicalAreaDim]
truncate table [dbo].[CensusMeasureFact]
truncate table [dbo].[CensusMeasureTypeDim]
truncate table [dbo].[CensusSourceDim]
truncate table [dbo].[DepartmentDim]
truncate table [dbo].[DiagnosisBridge]
truncate table [dbo].[DiagnosisFact]
truncate table [dbo].[DiagnosisHierarchy]
truncate table [dbo].[DiagnosisPresentOnAdmitDim]
truncate table [dbo].[DiagnosisSourceDim]
truncate table [dbo].[DM_Quality_Fact]
truncate table [dbo].[DRGDim]
truncate table [dbo].[DRGFact]
truncate table [dbo].[DRGSeqDim]
truncate table [dbo].[DRGTypeDim]
truncate table [dbo].[EDVisitAcuityLevelDim]
truncate table [dbo].[EDVisitDim]
truncate table [dbo].[EDVisitDispositionDim]
truncate table [dbo].[EDVisitFact]
truncate table [dbo].[EDVisitFinancialClass]
truncate table [dbo].[EDVisitMeansOfArrivalDim]
truncate table [dbo].[EncounterBillingClassDim]
truncate table [dbo].[EncounterDepartmentDim]
truncate table [dbo].[EncounterDim]
truncate table [dbo].[EncounterEncouterTypeDim]
truncate table [dbo].[EncounterFact]
truncate table [dbo].[EncounterLevelofCareDim]
truncate table [dbo].[EncounterPatientStatusDim]
truncate table [dbo].[EncounterProductLineDim]
truncate table [dbo].[EncouterBaseClassDim]
truncate table [dbo].[InpatientAdmitSourceDim]
truncate table [dbo].[InpatientAdmitTypeDim]
truncate table [dbo].[InpatientDim]
truncate table [dbo].[InpatientDischargeDestinationDim]
truncate table [dbo].[InpatientDischargeDispositionDim]
truncate table [dbo].[InpatientFact]
truncate table [dbo].[InpatientPatientClassDim]
truncate table [dbo].[LabComponentDim]
truncate table [dbo].[LabComponentResultFact]
truncate table [dbo].[LabComponentResultFactLabStatusDim]
truncate table [dbo].[LabComponentResultFactResultFlagDim]
truncate table [dbo].[LabComponentSubstrateDim]
truncate table [dbo].[LabComponentTypeDim]
truncate table [dbo].[LabDim]
truncate table [dbo].[LabTestCancellationReasonDim]
truncate table [dbo].[LabTestDim]
truncate table [dbo].[LabTestFact]
truncate table [dbo].[LabTestNameDim]
truncate table [dbo].[LabTestOrderPriorityDim]
truncate table [dbo].[LabTestOrderSourceTypeDim]
truncate table [dbo].[LabTestOrderTypeDim]
truncate table [dbo].[LabTestSpecimenSourceDim]
truncate table [dbo].[LabTestSpecimenTypeDim]
truncate table [dbo].[LabTestVerificationStatusDim]
truncate table [dbo].[MeasureDim]
truncate table [dbo].[MeasureGroupDim]
truncate table [dbo].[MeasureMDFact]
truncate table [dbo].[MeasureMLFact]
truncate table [dbo].[MeasureQDFact]
truncate table [dbo].[MeasureQLFact]
truncate table [dbo].[MeasureSourceDim]
truncate table [dbo].[MedicationAdministrationActionDim]
truncate table [dbo].[MedicationAdministrationFact]
truncate table [dbo].[MedicationAdministrationRouteDim]
truncate table [dbo].[MedicationDEAClassDim]
truncate table [dbo].[MedicationDim]
truncate table [dbo].[MedicationFormDim]
truncate table [dbo].[MedicationOrderCalculatedDoseUnitDim]
truncate table [dbo].[MedicationOrderClassDim]
truncate table [dbo].[MedicationOrderDim]
truncate table [dbo].[MedicationOrderDoseUnitDim]
truncate table [dbo].[MedicationOrderFact]
truncate table [dbo].[MedicationOrderFrequencyDim]
truncate table [dbo].[MedicationOrderModeDim]
truncate table [dbo].[MedicationOrderPriorityDim]
truncate table [dbo].[MedicationOrderQuantityUnitDim]
truncate table [dbo].[MedicationOrderRouteDim]
truncate table [dbo].[MedicationOrderSetSourceDim]
truncate table [dbo].[MedicationOrderSourceDim]
truncate table [dbo].[MedicationPharmacologicalClassDim]
truncate table [dbo].[MedicationPharmacologicalSubclassDim]
truncate table [dbo].[MedicationTherapeuticClassDim]
truncate table [dbo].[OutpatientAdmitConfStatrusDim]
truncate table [dbo].[OutpatientAppointmentConfirmationStatusDim]
truncate table [dbo].[OutpatientAppointmentStatusDim]
truncate table [dbo].[OutpatientCancellationReasonDim]
truncate table [dbo].[OutpatientDim]
truncate table [dbo].[OutpatientFact]
truncate table [dbo].[OutpatientFinancialClassDim]
truncate table [dbo].[PatientDim]
truncate table [dbo].[PharmacyDim]
truncate table [dbo].[PharmacyPhysicalTypeDim]
truncate table [dbo].[ProcedureCategoryDim]
truncate table [dbo].[ProcedureDim]
truncate table [dbo].[ProcedureOrderClassDim]
truncate table [dbo].[ProcedureOrderFact]
truncate table [dbo].[ProcedureOrderModeDim]
truncate table [dbo].[ProcedureOrderPriorityDim]
truncate table [dbo].[ProcedureOrderSetDm]
truncate table [dbo].[ProcedureOrderSourceDim]
truncate table [dbo].[ProcedureOrderStandingStatusDim]
truncate table [dbo].[ProcedureOrderStatusDim]
truncate table [dbo].[ProcedureOrderTypeDim]
truncate table [dbo].[ProcedureRevenueCodeDim]
truncate table [dbo].[ProcedureTypeDim]
truncate table [dbo].[ProgramDim]
truncate table [dbo].[ProviderAffiliationDim]
truncate table [dbo].[ProviderClinicianTitleDim]
truncate table [dbo].[ProviderDim]
truncate table [dbo].[ProviderFieldOfPracticeDim]
truncate table [dbo].[ProviderInternalExternalDim]
truncate table [dbo].[ProviderPrimaryDepartmentDim]
truncate table [dbo].[ProviderPrimarySpecialtyDim]
truncate table [dbo].[ProviderReportingStructureDim]
truncate table [dbo].[ProviderTypeDim]
truncate table [dbo].[SugicalProcedureEventWoundClassDim]
truncate table [dbo].[SurgicalCaseClassDim]
truncate table [dbo].[SurgicalCaseDim]
truncate table [dbo].[SurgicalCaseFact]
truncate table [dbo].[SurgicalCasePatientClassDim]
truncate table [dbo].[SurgicalCasePrimaryAnesthesiaTypeDim]
truncate table [dbo].[SurgicalCasePrimaryServiceDim]
truncate table [dbo].[SurgicalCaseProcedureLevelDim]
truncate table [dbo].[SurgicalCaseReasonNotPerformedDim]
truncate table [dbo].[SurgicalProcedureEventAnesthesiaTypeDim]
truncate table [dbo].[SurgicalProcedureEventFact]
truncate table [dbo].[SurgicalProcedureEventLateralityDim]
truncate table [dbo].[SurgicalProcedureEventProcedureSiteDim]
truncate table [dbo].[SurgicalProcedureEventServiceDim]
truncate table [dbo].[SurgicalSupplyDim]
truncate table [dbo].[SurgicalSupplyManufacturerDim]
truncate table [dbo].[SurgicalSupplyUseFact]
truncate table [dbo].[SurgicalSupplyUseLogStatusDim]
truncate table [dbo].[SurgicalSupplyUseORServiceDim]
truncate table [dbo].[SurgicalSupplyVendorDim]
truncate table [dbo].[tblExecSqlStatements_Results_TableType_V01]
truncate table [dbo].[TimeDim]
truncate table [dbo].[UserDim]
truncate table [dbo].[UserGenderDim]




GO
