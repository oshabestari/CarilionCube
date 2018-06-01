-- drop all foreign keys
exec dbo.usp_DropAllForeignKeyConstraints




-- drop table statements
drop table if exists BinaryDim
drop table if exists CensusGeographicalAreaDim
drop table if exists CensusMeasureFact
drop table if exists CensusMeasureTypeDim
drop table if exists CensusSourceDim
drop table if exists DRGDim
drop table if exists DRGFact
drop table if exists DRGSeqDim
drop table if exists DRGTypeDim
drop table if exists DW_CLNDR_DIM
drop table if exists DW_ENCNT_DIM
drop table if exists DW_ENCNT_FACT
drop table if exists DW_TM_OF_DY_DIM
drop table if exists DepartmentDim
drop table if exists DiagnosisPresentOnAdmit
drop table if exists DiagnosisSourceDim
drop table if exists EDVisitActivityLevelDim
drop table if exists EDVisitDim
drop table if exists EDVisitDispositionDim
drop table if exists EDVisitFact
drop table if exists EDVisitFinancialClass
drop table if exists EDVisitMeansOfArrivalDim
drop table if exists EncounterBillingClassDim
drop table if exists EncounterDepartmentDim
drop table if exists EncounterEncouterypeDim
drop table if exists EncounterLevelofCareDim
drop table if exists EncounterPatientStatusDim
drop table if exists EncounterProductLineDim
drop table if exists EncouterBaseClassDim
drop table if exists InpatientAdmitSourceDim
drop table if exists InpatientAdmitTypeDim
drop table if exists InpatientDim
drop table if exists InpatientDischargeDestinationDim
drop table if exists InpatientDischargeDispositionDim
drop table if exists InpatientFact
drop table if exists InpatientPatientClassDim
drop table if exists LDW_DIAG_FACT
drop table if exists LDW_PTNT_DIM
drop table if exists LabComponentDim
drop table if exists LabComponentResultFact
drop table if exists LabComponentResultFactLabStatusDim
drop table if exists LabComponentResultFactResultFlagDim
drop table if exists LabComponentSubstrateDim
drop table if exists LabComponentTypeDim
drop table if exists LabDim
drop table if exists LabTestCancellationReasonDim
drop table if exists LabTestDim
drop table if exists LabTestFact
drop table if exists LabTestNameDim
drop table if exists LabTestOrderPriorityDim
drop table if exists LabTestOrderSourceTypeDim
drop table if exists LabTestOrderType
drop table if exists LabTestSpecimenSourceDim
drop table if exists LabTestSpecimenTypeDim
drop table if exists LabTestVerificationStatusDim
drop table if exists MeasureMDFact
drop table if exists MeasureMLFact
drop table if exists MeasureQDFact
drop table if exists MeasureQLFact
drop table if exists MedicationAdministrationActionDim
drop table if exists MedicationAdministrationFact
drop table if exists MedicationAdministrationRouteDim
drop table if exists MedicationDEAClassDim
drop table if exists MedicationDim
drop table if exists MedicationFormDim
drop table if exists MedicationOrderCalculatedDoseUnitDim
drop table if exists MedicationOrderClassDim
drop table if exists MedicationOrderDim
drop table if exists MedicationOrderDoseUnitDim
drop table if exists MedicationOrderFact
drop table if exists MedicationOrderFrequencyDim
drop table if exists MedicationOrderModeDim
drop table if exists MedicationOrderPriorityDim
drop table if exists MedicationOrderQuantityUnitDim
drop table if exists MedicationOrderRouteDim
drop table if exists MedicationOrderSetSourceDim
drop table if exists MedicationOrderSourceDim
drop table if exists MedicationPharmacologicalClassDim
drop table if exists MedicationPharmacologicalSubclassDim
drop table if exists MedicationTherapeuticClassDim
drop table if exists OutpatientAdmitConfirmationStatusDim
drop table if exists OutpatientAppointmentConfirmation
drop table if exists OutpatientAppointmentStatusDim
drop table if exists OutpatientCancellationReasonDim
drop table if exists OutpatientDim
drop table if exists OutpatientFact
drop table if exists OutpatientFinancialClassDim
drop table if exists PharmacyDim
drop table if exists PharmacyPhysicalTypeDim
drop table if exists ProcedureCategoryDim
drop table if exists ProcedureDim
drop table if exists ProcedureOrderClassDim
drop table if exists ProcedureOrderFact
drop table if exists ProcedureOrderModeDim
drop table if exists ProcedureOrderPriorityDim
drop table if exists ProcedureOrderSetDm
drop table if exists ProcedureOrderSourceDim
drop table if exists ProcedureOrderStandingStatusDim
drop table if exists ProcedureOrderStatusDim
drop table if exists ProcedureOrderTypeDim
drop table if exists ProcedureRevenueCodeDim
drop table if exists ProcedureTypeDim
drop table if exists ProviderAffiliationDim
drop table if exists ProviderClinicianTitleDim
drop table if exists ProviderDim
drop table if exists ProviderFieldOfPracticeDim
drop table if exists ProviderInternalExternalDim
drop table if exists ProviderPrimaryDepartmentDim
drop table if exists ProviderPrimarySpecialtyDim
drop table if exists ProviderReportingStructureDim
drop table if exists ProviderTypeDim
drop table if exists QualityMeasureSourceDim
drop table if exists SugicalProcedureEventWoundClassDim
drop table if exists SurgicalCaseClassDim
drop table if exists SurgicalCaseDim
drop table if exists SurgicalCaseFact
drop table if exists SurgicalCasePatientClassDim
drop table if exists SurgicalCasePrimaryAnesthesiaTypeDim
drop table if exists SurgicalCasePrimaryServiceDim
drop table if exists SurgicalCaseProcedureLevelDim
drop table if exists SurgicalCaseReasonNotPerformedDim
drop table if exists SurgicalProcedureEventAnesthesiaTypeDim
drop table if exists SurgicalProcedureEventFact
drop table if exists SurgicalProcedureEventLateralityDim
drop table if exists SurgicalProcedureEventProcedureSiteDim
drop table if exists SurgicalProcedureEventServiceDim
drop table if exists SurgicalSupplyDim
drop table if exists SurgicalSupplyManufacturerDim
drop table if exists SurgicalSupplyUseFact
drop table if exists SurgicalSupplyUseLogStatusDim
drop table if exists SurgicalSupplyUseORServiceDim
drop table if exists SurgicalSupplyVendorDim
drop table if exists UserDim
drop table if exists UserGenderDim
drop table if exists dbo_DIAG_BRIDGE
drop table if exists dbo_DIAG_HYR_DIM
drop table if exists qps_DM_Quality
drop table if exists qps_Dim_Measure
drop table if exists qps_Dim_Measure_Group
drop table if exists qps_Dim_Program




-- create table statements
create table BinaryDim(
	Binary_CD int identity(1,1) not null,
	Binary_Desc varchar(14)   null,
	CONSTRAINT PK_BinaryDim_Binary_CD PRIMARY KEY CLUSTERED (Binary_CD)
);


create table CensusGeographicalAreaDim(
	GEO_AREA_SK int identity(1,1) not null,
	GEO_AREA_TYPE varchar(50)   null,
	GEO_AREA_DSPL_NM varchar(255)   null,
	CONSTRAINT PK_CensusGeographicalAreaDim_GEO_AREA_SK PRIMARY KEY CLUSTERED (GEO_AREA_SK)
);


create table CensusMeasureFact(
	MSR_FACT_SK bigint  not null,
	MSR_TYPE_SK int   null,
	GEO_AREA_SK int   null,
	SRC_SK int   null,
	MSR_FLT_VAL float   null,
	MSR_VAL_SYM varchar(20)   null,
	MSR_FLT_VAL_LOG float   null,
);


create table CensusMeasureTypeDim(
	MSR_TYPE_SK int identity(1,1) not null,
	SRC_MSR_TYPE_NM varchar(1024)   null,
	CONSTRAINT PK_CensusMeasureTypeDim_MSR_TYPE_SK PRIMARY KEY CLUSTERED (MSR_TYPE_SK)
);


create table CensusSourceDim(
	SRC_SK int identity(1,1) not null,
	SRC_DESC varchar(255)   null,
	SRC_YR varchar(50)   null,
	SRC_ESTMTE_IN_YRS varchar(16)   null,
	CONSTRAINT PK_CensusSourceDim_SRC_SK PRIMARY KEY CLUSTERED (SRC_SK)
);


create table DRGDim(
	DRG_CD_SK int identity(1,1) not null,
	SRC_DRG_ID varchar(255)   null,
	DRG_NM varchar(255)   null,
	TRNL_DRG_CD varchar(20)   null,
	MDC_CD int   null,
	MDC_NM varchar(100)   null,
	DRG_CLASS varchar(20)   null,
	SVL_CD int   null,
	MSDRG_SVL varchar(21)   null,
	CONSTRAINT PK_DRGDim_DRG_CD_SK PRIMARY KEY CLUSTERED (DRG_CD_SK)
);


create table DRGFact(
	ENCNT_DRG_SK bigint  not null,
	PRTY_SQNC int   null,
	DRG_CD_SK int   null,
	DRG_TYPE_CD varchar(255)   null,
	ACCT_SK bigint   null,
	ENCNT_SK bigint   null,
	PTNT_SK bigint   null,
	ENCNT_DT datetime   null,
);


create table DRGSeqDim(
	PRTY_SQNC int identity(1,1) not null,
	CONSTRAINT PK_DRGSeqDim_PRTY_SQNC PRIMARY KEY CLUSTERED (PRTY_SQNC)
);


create table DRGTypeDim(
	DRG_TYPE_CD varchar(255)  not null,
	DRG_TYPE_DSPLY_NM varchar(2059)   null,
	CONSTRAINT PK_DRGTypeDim_DRG_TYPE_CD PRIMARY KEY CLUSTERED (DRG_TYPE_CD)
);


create table DW_CLNDR_DIM(
	CLNDR_DT_EPOCH varchar(30)   null,
	CLNDR_DT datetime  not null,
	CLNDR_DT_FL_NM varchar(30)   null,
	CLNDR_DT_ABBR varchar(150)   null,
	CLNDR_CACHE_DT int   null,
	YR_NUM int   null,
	MTH_OF_YR_NUM smallint   null,
	MTH_OF_YR_ABBR varchar(150)   null,
	MTH_OF_YR_NM varchar(30)   null,
	YR_AND_MTH_NUM int   null,
	YR_AND_MTH_ABBR varchar(150)   null,
	YR_AND_MTH_NM varchar(30)   null,
	QTR_OF_YR_NUM smallint   null,
	QTR_OF_YR_ABBR varchar(150)   null,
	YR_AND_QTR_NUM int   null,
	YR_AND_QTR_ABBR varchar(150)   null,
	DY_OF_YR_NUM smallint   null,
	DY_OF_MTH_NUM smallint   null,
	DY_OF_WK_NUM smallint   null,
	DY_OF_WK_ABBR varchar(150)   null,
	DY_OF_WK_NM varchar(30)   null,
	WK_OF_YR_NUM smallint   null,
	PR_YR_NUM int   null,
	PR_MTH_OF_YR_NUM smallint   null,
	PR_MTH_OF_YR_ABBR varchar(150)   null,
	PR_MTH_OF_YR_NM varchar(30)   null,
	PR_YR_AND_MTH_NUM int   null,
	PR_YR_AND_MTH_ABBR varchar(150)   null,
	PR_YR_AND_MTH_NM varchar(30)   null,
	PR_QTR_OF_YR_NUM smallint   null,
	PR_QTR_OF_YR_ABBR varchar(150)   null,
	PR_YR_AND_QTR_NUM int   null,
	PR_YR_AND_QTR_ABBR varchar(150)   null,
	FSCL_YR_NUM int   null,
	FSCL_YR_BGN_DT datetime   null,
	FSCL_YR_END_DT datetime   null,
	FSCL_QTR_NUM smallint   null,
	FSCL_QTR_ABBR varchar(150)   null,
	FSCL_QTR_BGN_DT datetime   null,
	FSCL_QTR_END_DT datetime   null,
	FSCL_MTH_NUM smallint   null,
	CONSTRAINT PK_DW_CLNDR_DIM_CLNDR_DT PRIMARY KEY CLUSTERED (CLNDR_DT)
);


create table DW_ENCNT_DIM(
	ENCNT_SK bigint identity(1,1) not null,
	SRC_ENCNT_ID varchar(255)   null,
	PTNT_STS_CDS int   null,
	ENCNT_TYPE_CDS int   null,
	LEVL_OF_CARE_CDS int   null,
	TRAUMA_IND varchar(3)   null,
	PTNT_BSE_CLSS_CDS int   null,
	AGE_YRS_AT_ENCNT int   null,
	AGE_MNTHS_AT_ENCNT int   null,
	AGE_DYS_AT_ENCNT int   null,
	PRD_LINE_CDS int   null,
	BILLING_CLASS_CDS int   null,
	DEPT_CDS int   null,
	CONSTRAINT PK_DW_ENCNT_DIM_ENCNT_SK PRIMARY KEY CLUSTERED (ENCNT_SK)
);


create table DW_ENCNT_FACT(
	ENCNT_FACT_SK bigint identity(1,1) not null,
	ENCNT_SK bigint   null,
	PTNT_SK bigint   null,
	DEPT_SK bigint   null,
	AGE_YRS_AT_ENCNT int   null,
	ENCNT_DT datetime   null,
	AGE_MNTHS_AT_ENCNT int   null,
	AGE_DYS_AT_ENCNT int   null,
	ENCNT_WAIT_IN_DAYS int   null,
	CONSTRAINT PK_DW_ENCNT_FACT_ENCNT_FACT_SK PRIMARY KEY CLUSTERED (ENCNT_FACT_SK)
);


create table DW_TM_OF_DY_DIM(
	TM_OF_DY_SK bigint identity(1,1) not null,
	TM_OF_DY time(0)   null,
	HR_OF_DY int   null,
	MN_OF_DY int   null,
	SCND_OF_DY int   null,
	CONSTRAINT PK_DW_TM_OF_DY_DIM_TM_OF_DY_SK PRIMARY KEY CLUSTERED (TM_OF_DY_SK)
);


create table DepartmentDim(
	DEPT_SK bigint identity(1,1) not null,
	SRC_DEPT_ID varchar(255)   null,
	DEPT_NM varchar(250)   null,
	DEPT_ABBR varchar(20)   null,
	ADDR varchar(100)   null,
	CITY varchar(30)   null,
	ST_PRV_CDS int   null,
	ST_PRV_NM varchar(255)   null,
	ST_PRV_ABBR varchar(50)   null,
	PSTL_CDS varchar(5)   null,
	PH_NUM varchar(80)   null,
	RSTCT_IND varchar(3)   null,
	SPCLY_CDS int   null,
	SPCLY_NM varchar(255)   null,
	PRFSNL_BILLNG_CL_CDS int   null,
	PRFSNL_BILLNG_CL_NM varchar(255)   null,
	LO_CDS int   null,
	LO_NM varchar(255)   null,
	SRVC_AREA_CDS int   null,
	SRVC_AREA_NM varchar(255)   null,
	ALT_SRVC_AREA_CDS int   null,
	ALT_SRVC_AREA_NM varchar(255)   null,
	ICU_DEPT_IND varchar(3)   null,
	PCU_DEPT_IND varchar(3)   null,
	FCM_Region_ID int   null,
	FCM_Region_Name varchar(100)   null,
	LOC_TYPE_CDS int   null,
	LOC_TYPE_DESC varchar(255)   null,
	CONSTRAINT PK_DepartmentDim_DEPT_SK PRIMARY KEY CLUSTERED (DEPT_SK)
);


create table DiagnosisPresentOnAdmit(
	PRSNT_ON_ADMT_DESC varchar(255)   null,
	PRSNT_ON_ADMT_CD int identity(1,1) not null,
	CONSTRAINT PK_DiagnosisPresentOnAdmit_PRSNT_ON_ADMT_CD PRIMARY KEY CLUSTERED (PRSNT_ON_ADMT_CD)
);


create table DiagnosisSourceDim(
	SRC_TYPE varchar(50)  not null,
	SRC_TYPE_DSPLY_NM varchar(32)   null,
	CONSTRAINT PK_DiagnosisSourceDim_SRC_TYPE PRIMARY KEY CLUSTERED (SRC_TYPE)
);


create table EDVisitActivityLevelDim(
	ACTY_LVL_CDS int identity(1,1) not null,
	ACTY_LVL_DESC varchar(15)   null,
	CONSTRAINT PK_EDVisitActivityLevelDim_ACTY_LVL_CDS PRIMARY KEY CLUSTERED (ACTY_LVL_CDS)
);


create table EDVisitDim(
	EDPTNT_VST_SK bigint identity(1,1) not null,
	ENCNT_SK bigint   null,
	PTNT_SK bigint   null,
	SRC_ENCNT_ID varchar(255)   null,
	ED_DSPSTN_CDS int   null,
	VST_FNNCL_CLSS_CDS int   null,
	ACTY_LVL_CDS int   null,
	MEANS_ARRVL_CDS int   null,
	PG_ER_SURVEYED varchar(3)   null,
	ER_ANALYSIS_A2_CDS int   null,
	ER_ANALYSIS_A2 varchar(9)   null,
	ER_ANALYSIS_A28_CDS int   null,
	ER_ANALYSIS_A28 varchar(9)   null,
	ER_ANALYSIS_A3_CDS int   null,
	ER_ANALYSIS_A3 varchar(9)   null,
	ER_ANALYSIS_A4_CDS int   null,
	ER_ANALYSIS_A4 varchar(9)   null,
	ER_ANALYSIS_A5_CDS int   null,
	ER_ANALYSIS_A5 varchar(9)   null,
	ER_ANALYSIS_A86_CDS int   null,
	ER_ANALYSIS_A86 varchar(9)   null,
	ER_ANALYSIS_A87_CDS int   null,
	ER_ANALYSIS_A87 varchar(9)   null,
	ER_ANALYSIS_B1_CDS int   null,
	ER_ANALYSIS_B1 varchar(9)   null,
	ER_ANALYSIS_B3_CDS int   null,
	ER_ANALYSIS_B3 varchar(9)   null,
	ER_ANALYSIS_B4_CDS int   null,
	ER_ANALYSIS_B4 varchar(9)   null,
	ER_ANALYSIS_B5_CDS int   null,
	ER_ANALYSIS_B5 varchar(9)   null,
	ER_ANALYSIS_B76_CDS int   null,
	ER_ANALYSIS_B76 varchar(9)   null,
	ER_ANALYSIS_C1_CDS int   null,
	ER_ANALYSIS_C1 varchar(9)   null,
	ER_ANALYSIS_C2_CDS int   null,
	ER_ANALYSIS_C2 varchar(9)   null,
	ER_ANALYSIS_C4_CDS int   null,
	ER_ANALYSIS_C4 varchar(9)   null,
	ER_ANALYSIS_C5_CDS int   null,
	ER_ANALYSIS_C5 varchar(9)   null,
	ER_ANALYSIS_C7_CDS int   null,
	ER_ANALYSIS_C7 varchar(9)   null,
	ER_ANALYSIS_C75_CDS int   null,
	ER_ANALYSIS_C75 varchar(9)   null,
	ER_ANALYSIS_D2_CDS int   null,
	ER_ANALYSIS_D2 varchar(9)   null,
	ER_ANALYSIS_D3_CDS int   null,
	ER_ANALYSIS_D3 varchar(9)   null,
	ER_ANALYSIS_D4_CDS int   null,
	ER_ANALYSIS_D4 varchar(9)   null,
	ER_ANALYSIS_D52_CDS int   null,
	ER_ANALYSIS_D52 varchar(9)   null,
	ER_ANALYSIS_D65_CDS int   null,
	ER_ANALYSIS_D65 varchar(9)   null,
	ER_ANALYSIS_E1_CDS int   null,
	ER_ANALYSIS_E1 varchar(9)   null,
	ER_ANALYSIS_E2_CDS int   null,
	ER_ANALYSIS_E2 varchar(9)   null,
	ER_ANALYSIS_E3_CDS int   null,
	ER_ANALYSIS_E3 varchar(9)   null,
	ER_DEMOGRAPHICS_EDCP1 varchar(50)   null,
	ER_DEMOGRAPHICS_EDCP1_CDS int   null,
	ER_DEMOGRAPHICS_EDCP10 varchar(50)   null,
	ER_DEMOGRAPHICS_EDCP10_CDS int   null,
	ER_DEMOGRAPHICS_EDCP11 varchar(50)   null,
	ER_DEMOGRAPHICS_EDCP11_CDS int   null,
	ER_DEMOGRAPHICS_EDCP12 varchar(50)   null,
	ER_DEMOGRAPHICS_EDCP12_CDS int   null,
	ER_DEMOGRAPHICS_EDCP13 varchar(50)   null,
	ER_DEMOGRAPHICS_EDCP13_CDS int   null,
	ER_DEMOGRAPHICS_EDCP16 varchar(50)   null,
	ER_DEMOGRAPHICS_EDCP16_CDS int   null,
	ER_DEMOGRAPHICS_EDCP17 varchar(50)   null,
	ER_DEMOGRAPHICS_EDCP17_CDS int   null,
	ER_DEMOGRAPHICS_EDCP2 varchar(50)   null,
	ER_DEMOGRAPHICS_EDCP2_CDS int   null,
	ER_DEMOGRAPHICS_EDCP22 varchar(50)   null,
	ER_DEMOGRAPHICS_EDCP22_CDS int   null,
	ER_DEMOGRAPHICS_EDCP23 varchar(50)   null,
	ER_DEMOGRAPHICS_EDCP23_CDS int   null,
	ER_DEMOGRAPHICS_EDCP24 varchar(50)   null,
	ER_DEMOGRAPHICS_EDCP24_CDS int   null,
	ER_DEMOGRAPHICS_EDCP25 varchar(50)   null,
	ER_DEMOGRAPHICS_EDCP25_CDS int   null,
	ER_DEMOGRAPHICS_EDCP26 varchar(50)   null,
	ER_DEMOGRAPHICS_EDCP26_CDS int   null,
	ER_DEMOGRAPHICS_EDCP27 varchar(50)   null,
	ER_DEMOGRAPHICS_EDCP27_CDS int   null,
	ER_DEMOGRAPHICS_EDCP28 varchar(50)   null,
	ER_DEMOGRAPHICS_EDCP28_CDS int   null,
	ER_DEMOGRAPHICS_EDCP29 varchar(50)   null,
	ER_DEMOGRAPHICS_EDCP29_CDS int   null,
	ER_DEMOGRAPHICS_EDCP3 varchar(50)   null,
	ER_DEMOGRAPHICS_EDCP3_CDS int   null,
	ER_DEMOGRAPHICS_EDCP30 varchar(50)   null,
	ER_DEMOGRAPHICS_EDCP30_CDS int   null,
	ER_DEMOGRAPHICS_EDCP31 varchar(50)   null,
	ER_DEMOGRAPHICS_EDCP31_CDS int   null,
	ER_DEMOGRAPHICS_EDCP32 varchar(50)   null,
	ER_DEMOGRAPHICS_EDCP32_CDS int   null,
	ER_DEMOGRAPHICS_EDCP33 varchar(50)   null,
	ER_DEMOGRAPHICS_EDCP33_CDS int   null,
	ER_DEMOGRAPHICS_EDCP35 varchar(50)   null,
	ER_DEMOGRAPHICS_EDCP35_CDS int   null,
	ER_DEMOGRAPHICS_EDCP36 varchar(50)   null,
	ER_DEMOGRAPHICS_EDCP36_CDS int   null,
	ER_DEMOGRAPHICS_EDCP37 varchar(50)   null,
	ER_DEMOGRAPHICS_EDCP37_CDS int   null,
	ER_DEMOGRAPHICS_EDCP39 varchar(50)   null,
	ER_DEMOGRAPHICS_EDCP39_CDS int   null,
	ER_DEMOGRAPHICS_EDCP4 varchar(50)   null,
	ER_DEMOGRAPHICS_EDCP4_CDS int   null,
	ER_DEMOGRAPHICS_EDCP40 varchar(50)   null,
	ER_DEMOGRAPHICS_EDCP40_CDS int   null,
	ER_DEMOGRAPHICS_EDCP41 varchar(50)   null,
	ER_DEMOGRAPHICS_EDCP41_CDS int   null,
	ER_DEMOGRAPHICS_EDCP42 varchar(50)   null,
	ER_DEMOGRAPHICS_EDCP42_CDS int   null,
	ER_DEMOGRAPHICS_EDCP43 varchar(50)   null,
	ER_DEMOGRAPHICS_EDCP43_CDS int   null,
	ER_DEMOGRAPHICS_EDCP48 varchar(50)   null,
	ER_DEMOGRAPHICS_EDCP48_CDS int   null,
	ER_DEMOGRAPHICS_EDCP59 varchar(50)   null,
	ER_DEMOGRAPHICS_EDCP59_CDS int   null,
	ER_DEMOGRAPHICS_EDCP6 varchar(50)   null,
	ER_DEMOGRAPHICS_EDCP6_CDS int   null,
	ER_DEMOGRAPHICS_EDCP61 varchar(50)   null,
	ER_DEMOGRAPHICS_EDCP61_CDS int   null,
	ER_DEMOGRAPHICS_EDCP62_CDS varchar(50)   null,
	ER_DEMOGRAPHICS_EDCP62 int   null,
	ER_DEMOGRAPHICS_EDCP63_CDS varchar(50)   null,
	ER_DEMOGRAPHICS_EDCP63 int   null,
	ER_DEMOGRAPHICS_EDCP64_CDS varchar(50)   null,
	ER_DEMOGRAPHICS_EDCP64 int   null,
	ER_DEMOGRAPHICS_EDCP65_CDS varchar(50)   null,
	ER_DEMOGRAPHICS_EDCP65 int   null,
	ER_DEMOGRAPHICS_EDCP9_CDS varchar(50)   null,
	ER_DEMOGRAPHICS_EDCP9 int   null,
	ER_ANALYSIS_F1_CDS int   null,
	ER_ANALYSIS_F1 varchar(9)   null,
	ER_ANALYSIS_F2_CDS int   null,
	ER_ANALYSIS_F2 varchar(9)   null,
	ER_ANALYSIS_F4_CDS int   null,
	ER_ANALYSIS_F4 varchar(9)   null,
	ER_ANALYSIS_F41_CDS int   null,
	ER_ANALYSIS_F41 varchar(9)   null,
	ER_ANALYSIS_F68_CDS int   null,
	ER_ANALYSIS_F68 varchar(9)   null,
	ER_ANALYSIS_Q11822_1_CDS int   null,
	ER_ANALYSIS_Q11822_1 varchar(9)   null,
	PG_PE_SURVEYED varchar(3)   null,
	PE_ANALYSIS_A2_CDS int   null,
	PE_ANALYSIS_A2 varchar(9)   null,
	PE_ANALYSIS_A20_CDS int   null,
	PE_ANALYSIS_A20 varchar(9)   null,
	PE_ANALYSIS_A24_CDS int   null,
	PE_ANALYSIS_A24 varchar(9)   null,
	PE_ANALYSIS_A25_CDS int   null,
	PE_ANALYSIS_A25 varchar(9)   null,
	PE_ANALYSIS_A3_CDS int   null,
	PE_ANALYSIS_A3 varchar(9)   null,
	PE_ANALYSIS_A4_CDS int   null,
	PE_ANALYSIS_A4 varchar(9)   null,
	PE_ANALYSIS_A5_CDS int   null,
	PE_ANALYSIS_A5 varchar(9)   null,
	PE_ANALYSIS_A7_CDS int   null,
	PE_ANALYSIS_A7 varchar(9)   null,
	PE_ANALYSIS_B1_CDS int   null,
	PE_ANALYSIS_B1 varchar(9)   null,
	PE_ANALYSIS_B11_CDS int   null,
	PE_ANALYSIS_B11 varchar(9)   null,
	PE_ANALYSIS_B3_CDS int   null,
	PE_ANALYSIS_B3 varchar(9)   null,
	PE_ANALYSIS_B4_CDS int   null,
	PE_ANALYSIS_B4 varchar(9)   null,
	PE_ANALYSIS_B5_CDS int   null,
	PE_ANALYSIS_B5 varchar(9)   null,
	PE_ANALYSIS_C1_CDS int   null,
	PE_ANALYSIS_C1 varchar(9)   null,
	PE_ANALYSIS_C2_CDS int   null,
	PE_ANALYSIS_C2 varchar(9)   null,
	PE_ANALYSIS_C4_CDS int   null,
	PE_ANALYSIS_C4 varchar(9)   null,
	PE_ANALYSIS_C5_CDS int   null,
	PE_ANALYSIS_C5 varchar(9)   null,
	PE_ANALYSIS_C6_CDS int   null,
	PE_ANALYSIS_C6 varchar(9)   null,
	PE_ANALYSIS_C9_CDS int   null,
	PE_ANALYSIS_C9 varchar(9)   null,
	PE_ANALYSIS_D14_CDS int   null,
	PE_ANALYSIS_D14 varchar(9)   null,
	PE_ANALYSIS_D15_CDS int   null,
	PE_ANALYSIS_D15 varchar(9)   null,
	PE_ANALYSIS_D2_CDS int   null,
	PE_ANALYSIS_D2 varchar(9)   null,
	PE_ANALYSIS_D3_CDS int   null,
	PE_ANALYSIS_D3 varchar(9)   null,
	PE_ANALYSIS_D4_CDS int   null,
	PE_ANALYSIS_D4 varchar(9)   null,
	PE_ANALYSIS_F1_CDS int   null,
	PE_ANALYSIS_F1 varchar(9)   null,
	PE_ANALYSIS_F15_CDS int   null,
	PE_ANALYSIS_F15 varchar(9)   null,
	PE_ANALYSIS_F2_CDS int   null,
	PE_ANALYSIS_F2 varchar(9)   null,
	PE_ANALYSIS_F20_CDS int   null,
	PE_ANALYSIS_F20 varchar(9)   null,
	PE_ANALYSIS_F4_CDS int   null,
	PE_ANALYSIS_F4 varchar(9)   null,
	CONSTRAINT PK_EDVisitDim_EDPTNT_VST_SK PRIMARY KEY CLUSTERED (EDPTNT_VST_SK)
);


create table EDVisitDispositionDim(
	ED_DSPSTN_CDS int identity(1,1) not null,
	ED_DSPSTN_DESC varchar(254)   null,
	CONSTRAINT PK_EDVisitDispositionDim_ED_DSPSTN_CDS PRIMARY KEY CLUSTERED (ED_DSPSTN_CDS)
);


create table EDVisitFact(
	EDPTNT_VST_SK bigint  not null,
	ENCNT_SK bigint   null,
	PTNT_SK bigint   null,
	ARRVL_DT datetime   null,
	HSP_DSCRG_DT datetime   null,
	HSP_DSCRG_TS_SK bigint   null,
	ARRVL_TS_SK bigint   null,
	ED_DSCRG_DT datetime   null,
	DSPSTN_INSTNT_DT datetime   null,
	DSPSTN_INSTNT_TS_SK bigint   null,
	FRST_NONED_DEPT_ARRVL_DT datetime   null,
	FRST_NONED_DEPT_ARRVL_TS_SK bigint   null,
	AVS_PRNT_INSTNT_DT datetime   null,
	AVS_PRNT_INSTNT_TS_SK bigint   null,
	AGE_YRS_AT_ENCNT int   null,
	AGE_MNTHS_AT_ENCNT int   null,
	AGE_DYS_AT_ENCNT int   null,
	ADMT_DEPT_SK bigint   null,
	FRST_NON_ED_DEPT_SK bigint   null,
	PAT_RMD_DT datetime   null,
	REG_CMPLTD_DT datetime   null,
	TRGE_START_DT datetime   null,
	TRGE_CMPLTD_DT datetime   null,
	FRST_ATTND_DT datetime   null,
	LAB_ORDRD_DT datetime   null,
	LAB_CMPLTD_DT datetime   null,
	LAB_PRVDR_RVW_DT datetime   null,
	IMG_ORDRD_DT datetime   null,
	IMG_TST_CMPLTD_DT datetime   null,
	IMG_PRVDR_RVW_DT datetime   null,
	BED_RQST_DT datetime   null,
	ARRV_TO_REG_CMPLTD int   null,
	ARRV_TO_TRG_STRT int   null,
	TRG_STRT_TO_TRG_CMPLTD int   null,
	TRG_STRT_TO_PTNT_RMD int   null,
	BED_RQST_TO_PTNT_RMD int   null,
	TRG_CMPLTD_TO_PTNT_RMD int   null,
	TRG_CMPLTD_TO_ASSGN_ATTND int   null,
	PTNT_RMD_TO_ASSGN_ATTND int   null,
	ASSGN_ATTND_TO_DSPSTN int   null,
	DSPTN_TO_ED_DSCRG int   null,
	AVS_PRNTD_TO_ED_DSCRG int   null,
	ARRV_TO_LAB_ORDRD int   null,
	LAB_ORDRD_TO_CMPLTD int   null,
	LAB_CMPLTD_TO_PRVDR_RVW int   null,
	ARRV_TO_IMG_ORDRD int   null,
	ARRV_TO_ED_DSCRG int   null,
	IMG_TST_ORDRD_TO_CMPLTD int   null,
	IMG_TST_CMPLTD_TO_PRVDR_RVW int   null,
	GLSGW_VAL int   null,
	ARRV_TO_REG_CMPLTD_LOG float   null,
	ARRV_TO_TRG_STRT_LOG float   null,
	TRG_STRT_TO_TRG_CMPLTD_LOG float   null,
	TRG_STRT_TO_PTNT_RMD_LOG float   null,
	BED_RQST_TO_PTNT_RMD_LOG float   null,
	TRG_CMPLTD_TO_PTNT_RMD_LOG float   null,
	TRG_CMPLTD_TO_ASSGN_ATTND_LOG float   null,
	PTNT_RMD_TO_ASSGN_ATTND_LOG float   null,
	ASSGN_ATTND_TO_DSPSTN_LOG float   null,
	DSPTN_TO_ED_DSCRG_LOG float   null,
	AVS_PRNTD_TO_ED_DSCRG_LOG float   null,
	ARRV_TO_LAB_ORDRD_LOG float   null,
	LAB_ORDRD_TO_CMPLTD_LOG float   null,
	LAB_CMPLTD_TO_PRVDR_RVW_LOG float   null,
	ARRV_TO_IMG_ORDRD_LOG float   null,
	IMG_TST_ORDRD_TO_CMPLTD_LOG float   null,
	IMG_TST_CMPLTD_TO_PRVDR_RVW_LOG float   null,
	ARRV_TO_ED_DSCRG_LOG float   null,
	GLSGW_VAL_LOG float   null,
	ED_DSCRG_TS_SK bigint   null,
	PAT_RMD_TS_SK bigint   null,
	REG_CMPLTD_TS_SK bigint   null,
	TRGE_START_TS_SK bigint   null,
	TRGE_CMPLTD_TS_SK bigint   null,
	FRST_ATTND_TS_SK bigint   null,
	LAB_ORDRD_TS_SK bigint   null,
	LAB_CMPLTD_TS_SK bigint   null,
	LAB_PRVDR_RVW_TS_SK bigint   null,
	IMG_ORDRD_TS_SK bigint   null,
	IMG_PRVDR_RVW_TS_SK bigint   null,
	BED_RQST_TS_SK bigint   null,
	IMG_TST_CMPLTD_TS_SK bigint   null,
);


create table EDVisitFinancialClass(
	VST_FNNCL_CLSS_CDS int identity(1,1) not null,
	VST_FNNCL_CLSS_DESC varchar(255)   null,
	CONSTRAINT PK_EDVisitFinancialClass_VST_FNNCL_CLSS_CDS PRIMARY KEY CLUSTERED (VST_FNNCL_CLSS_CDS)
);


create table EDVisitMeansOfArrivalDim(
	MEANS_ARRVL_CDS int identity(1,1) not null,
	MEANS_ARRVL_DESC varchar(255)   null,
	CONSTRAINT PK_EDVisitMeansOfArrivalDim_MEANS_ARRVL_CDS PRIMARY KEY CLUSTERED (MEANS_ARRVL_CDS)
);


create table EncounterBillingClassDim(
	BILLING_CLASS_CDS int identity(1,1) not null,
	BILLING_CLASS_DESC varchar(11)   null,
	CONSTRAINT PK_EncounterBillingClassDim_BILLING_CLASS_CDS PRIMARY KEY CLUSTERED (BILLING_CLASS_CDS)
);


create table EncounterDepartmentDim(
	DEPT_CDS int identity(1,1) not null,
	DEPT_DESC varchar(18)   null,
	CONSTRAINT PK_EncounterDepartmentDim_DEPT_CDS PRIMARY KEY CLUSTERED (DEPT_CDS)
);


create table EncounterEncouterypeDim(
	ENCNT_TYPE_CDS int identity(1,1) not null,
	ENCNT_TYPE_DESC varchar(254)   null,
	CONSTRAINT PK_EncounterEncouterypeDim_ENCNT_TYPE_CDS PRIMARY KEY CLUSTERED (ENCNT_TYPE_CDS)
);


create table EncounterLevelofCareDim(
	LEVL_OF_CARE_CDS int identity(1,1) not null,
	LEVL_OF_CARE_DESC varchar(254)   null,
	CONSTRAINT PK_EncounterLevelofCareDim_LEVL_OF_CARE_CDS PRIMARY KEY CLUSTERED (LEVL_OF_CARE_CDS)
);


create table EncounterPatientStatusDim(
	PTNT_STS_CDS int identity(1,1) not null,
	PTNT_STS_DESC varchar(254)   null,
	CONSTRAINT PK_EncounterPatientStatusDim_PTNT_STS_CDS PRIMARY KEY CLUSTERED (PTNT_STS_CDS)
);


create table EncounterProductLineDim(
	PRD_LINE_CDS int identity(1,1) not null,
	PROD_LINE_DESC varchar(57)   null,
	CONSTRAINT PK_EncounterProductLineDim_PRD_LINE_CDS PRIMARY KEY CLUSTERED (PRD_LINE_CDS)
);


create table EncouterBaseClassDim(
	PTNT_BSE_CLSS_CDS int identity(1,1) not null,
	PTNT_BSE_CLSS_NM varchar(255)   null,
	CONSTRAINT PK_EncouterBaseClassDim_PTNT_BSE_CLSS_CDS PRIMARY KEY CLUSTERED (PTNT_BSE_CLSS_CDS)
);


create table InpatientAdmitSourceDim(
	ADMT_SRC_CDS int identity(1,1) not null,
	ADMT_SRC_DESC varchar(255)   null,
	CONSTRAINT PK_InpatientAdmitSourceDim_ADMT_SRC_CDS PRIMARY KEY CLUSTERED (ADMT_SRC_CDS)
);


create table InpatientAdmitTypeDim(
	ADMT_TYPE_CDS int identity(1,1) not null,
	ADMT_TYPE_DESC varchar(255)   null,
	CONSTRAINT PK_InpatientAdmitTypeDim_ADMT_TYPE_CDS PRIMARY KEY CLUSTERED (ADMT_TYPE_CDS)
);


create table InpatientDim(
	SRC_ENCNT_ID varchar(255)   null,
	PTNT_CL_CDS int   null,
	ADMT_SRC_CDS int   null,
	ADMT_TYPE_CDS int   null,
	DSCRG_DSPSTN_CDS int   null,
	DSCRG_DSTN_CDS int   null,
	AGE_YRS_AT_CLNC_INPTNT_ADMT int   null,
	AGE_MNTHS_AT_CLNC_INPTNT_ADMT int   null,
	AGE_DYS_AT_CLNC_INPTNT_ADMT bigint   null,
	LOS_DYS_CLNC_INPTNT bigint   null,
	LOS_HRS_CLNC_INPTNT int   null,
	INPTNT_VST_SK bigint identity(1,1) not null,
	ENCNT_SK bigint   null,
	AGE_YRS_AT_CLNC_ADMT int   null,
	AGE_MNTHS_AT_CLNC_ADMT int   null,
	AGE_DYS_AT_CLNC_ADMT bigint   null,
	LOS_DYS_CLNC int   null,
	LOS_HRS_CLNC int   null,
	AMI_1 varchar(12)   null,
	AMI_2 varchar(12)   null,
	AMI_3 varchar(12)   null,
	AMI_5 varchar(12)   null,
	AMI_7 varchar(12)   null,
	AMI_7A varchar(12)   null,
	AMI_8 varchar(12)   null,
	AMI_8A varchar(12)   null,
	AMI_10 varchar(12)   null,
	ED_1A varchar(12)   null,
	ED_1B varchar(12)   null,
	ED_1C varchar(12)   null,
	ED_2A varchar(12)   null,
	ED_2B varchar(12)   null,
	ED_2C varchar(12)   null,
	HF_1 varchar(12)   null,
	HF_2 varchar(12)   null,
	HF_3 varchar(12)   null,
	IMM_1A varchar(12)   null,
	IMM_1B varchar(12)   null,
	IMM_1C varchar(12)   null,
	IMM_2 varchar(12)   null,
	PN_3A varchar(12)   null,
	PN_3B varchar(12)   null,
	PN_6 varchar(12)   null,
	PN_6A varchar(12)   null,
	PN_6B varchar(12)   null,
	SCIP_CARD_2 varchar(12)   null,
	SCIP_INF_1A varchar(12)   null,
	SCIP_INF_1B varchar(12)   null,
	SCIP_INF_1C varchar(12)   null,
	SCIP_INF_1D varchar(12)   null,
	SCIP_INF_1E varchar(12)   null,
	SCIP_INF_1F varchar(12)   null,
	SCIP_INF_1G varchar(12)   null,
	SCIP_INF_1H varchar(12)   null,
	SCIP_INF_2A varchar(12)   null,
	SCIP_INF_2B varchar(12)   null,
	SCIP_INF_2C varchar(12)   null,
	SCIP_INF_2D varchar(12)   null,
	SCIP_INF_2E varchar(12)   null,
	SCIP_INF_2F varchar(12)   null,
	SCIP_INF_2G varchar(12)   null,
	SCIP_INF_2H varchar(12)   null,
	SCIP_INF_3A varchar(12)   null,
	SCIP_INF_3B varchar(12)   null,
	SCIP_INF_3C varchar(12)   null,
	SCIP_INF_3D varchar(12)   null,
	SCIP_INF_3E varchar(12)   null,
	SCIP_INF_3F varchar(12)   null,
	SCIP_INF_3G varchar(12)   null,
	SCIP_INF_3H varchar(12)   null,
	SCIP_INF_4 varchar(12)   null,
	SCIP_INF_6 varchar(12)   null,
	SCIP_INF_9 varchar(12)   null,
	SCIP_INF_10 varchar(12)   null,
	SCIP_VTE_2 varchar(12)   null,
	STK_1 varchar(12)   null,
	STK_2 varchar(12)   null,
	STK_3 varchar(12)   null,
	STK_4 varchar(12)   null,
	STK_5 varchar(12)   null,
	STK_6 varchar(12)   null,
	STK_8 varchar(12)   null,
	STK_10 varchar(12)   null,
	VTE_1 varchar(12)   null,
	VTE_2 varchar(12)   null,
	VTE_3 varchar(12)   null,
	VTE_4 varchar(12)   null,
	VTE_5 varchar(12)   null,
	VTE_6 varchar(12)   null,
	CMS_1 varchar(12)   null,
	CMS_2 varchar(12)   null,
	CMS_3 varchar(12)   null,
	CMS_4 varchar(12)   null,
	CMS_5 varchar(12)   null,
	CMS_6 varchar(12)   null,
	CMS_7 varchar(12)   null,
	CMS_8 varchar(12)   null,
	CMS_9 varchar(12)   null,
	CMS_10 varchar(12)   null,
	CMS_11 varchar(12)   null,
	CMS_12 varchar(12)   null,
	CMS_13 varchar(12)   null,
	CMS_14 varchar(12)   null,
	CMS_15 varchar(12)   null,
	CMS_16 varchar(12)   null,
	CMS_17 varchar(12)   null,
	CMS_18 varchar(12)   null,
	CMS_159 varchar(12)   null,
	PREMIER_1 varchar(12)   null,
	PREMIER_2 varchar(12)   null,
	PREMIER_3 varchar(12)   null,
	PREMIER_4 varchar(12)   null,
	PREMIER_5 varchar(12)   null,
	PREMIER_7 varchar(12)   null,
	PREMIER_8 varchar(12)   null,
	PREMIER_10 varchar(12)   null,
	PREMIER_11 varchar(12)   null,
	PREMIER_12 varchar(12)   null,
	PREMIER_13 varchar(12)   null,
	PREMIER_14 varchar(12)   null,
	PREMIER_15 varchar(12)   null,
	PREMIER_16 varchar(12)   null,
	PREMIER_17 varchar(12)   null,
	PREMIER_18 varchar(12)   null,
	PREMIER_19 varchar(12)   null,
	PREMIER_20 varchar(12)   null,
	PREMIER_22 varchar(12)   null,
	PREMIER_23 varchar(12)   null,
	PREMIER_24 varchar(12)   null,
	PREMIER_25 varchar(12)   null,
	PREMIER_26 varchar(12)   null,
	PREMIER_27 varchar(12)   null,
	PREMIER_29 varchar(12)   null,
	PREMIER_30 varchar(12)   null,
	PREMIER_32 varchar(12)   null,
	PREMIER_35 varchar(12)   null,
	PREMIER_36 varchar(12)   null,
	PREMIER_37 varchar(12)   null,
	PREMIER_38 varchar(12)   null,
	PREMIER_40 varchar(12)   null,
	PREMIER_45 varchar(12)   null,
	PREMIER_46 varchar(12)   null,
	PREMIER_51 varchar(12)   null,
	PREMIER_52 varchar(12)   null,
	PREMIER_54 varchar(12)   null,
	PREMIER_55 varchar(12)   null,
	PREMIER_57 varchar(12)   null,
	PREMIER_58 varchar(12)   null,
	PREMIER_60 varchar(12)   null,
	PREMIER_61 varchar(12)   null,
	PREMIER_62 varchar(12)   null,
	PREMIER_65 varchar(12)   null,
	PREMIER_71 varchar(12)   null,
	PREMIER_73 varchar(12)   null,
	PREMIER_75 varchar(12)   null,
	PREMIER_76 varchar(12)   null,
	PREMIER_77 varchar(12)   null,
	PREMIER_78 varchar(12)   null,
	PREMIER_79 varchar(12)   null,
	PREMIER_80 varchar(12)   null,
	PREMIER_81 varchar(12)   null,
	PREMIER_82 varchar(12)   null,
	PREMIER_84 varchar(12)   null,
	PREMIER_86 varchar(12)   null,
	PREMIER_88 varchar(12)   null,
	PREMIER_92 varchar(12)   null,
	PREMIER_94 varchar(12)   null,
	PREMIER_96 varchar(12)   null,
	PREMIER_97 varchar(12)   null,
	PREMIER_98 varchar(12)   null,
	PREMIER_99 varchar(12)   null,
	PREMIER_100 varchar(12)   null,
	PREMIER_104 varchar(12)   null,
	PREMIER_107 varchar(12)   null,
	PREMIER_108 varchar(12)   null,
	PREMIER_109 varchar(12)   null,
	PREMIER_110 varchar(12)   null,
	PREMIER_111 varchar(12)   null,
	PREMIER_112 varchar(12)   null,
	PREMIER_117 varchar(12)   null,
	PREMIER_118 varchar(12)   null,
	PREMIER_120 varchar(12)   null,
	PREMIER_125 varchar(12)   null,
	PREMIER_126 varchar(12)   null,
	PREMIER_127 varchar(12)   null,
	PREMIER_128 varchar(12)   null,
	PREMIER_130 varchar(12)   null,
	PREMIER_131 varchar(12)   null,
	PREMIER_134 varchar(12)   null,
	PREMIER_136 varchar(12)   null,
	PREMIER_138 varchar(12)   null,
	PREMIER_139 varchar(12)   null,
	PREMIER_141 varchar(12)   null,
	PREMIER_142 varchar(12)   null,
	PREMIER_143 varchar(12)   null,
	PREMIER_144 varchar(12)   null,
	PREMIER_150 varchar(12)   null,
	PREMIER_153 varchar(12)   null,
	PREMIER_154 varchar(12)   null,
	PREMIER_155 varchar(12)   null,
	PREMIER_156 varchar(12)   null,
	PREMIER_157 varchar(12)   null,
	PREMIER_158 varchar(12)   null,
	PREMIER_159 varchar(12)   null,
	IQI1_ESOPHAGEAL_RESECTION_VOL varchar(12)   null,
	IQI2_PANCREATIC_RESECTION_VOL varchar(12)   null,
	IQI4_AAA_REPAIR_VOL varchar(12)   null,
	IQI5_CABG_VOL varchar(12)   null,
	IQI6_PTCA_VOL varchar(12)   null,
	IQI7_CAROTID_ENDARTERECTOMY_VOL varchar(12)   null,
	IQI2A_PANCREATIC_RESECTION_VOL varchar(12)   null,
	IQI2B_PANCREATIC_RESECTION_VOL varchar(12)   null,
	IQI4A_AAA_REPAIR_VOL varchar(12)   null,
	IQI4B_AAA_REPAIR_VOL varchar(12)   null,
	IQI4C_AAA_REPAIR_VOL varchar(12)   null,
	IQI4D_AAA_REPAIR_VOL varchar(12)   null,
	IQI8_ESOPHAGEAL_RESECTION_MORT varchar(12)   null,
	IQI9_PANCREATIC_RESECTION_MORT varchar(12)   null,
	IQI11_AAA_REPAIR_MORT varchar(12)   null,
	IQI12_CABG_MORT varchar(12)   null,
	IQI13_CRANIOTOMY_MORT varchar(12)   null,
	IQI14_HIP_REPLACEMENT_MORT varchar(12)   null,
	IQI15_AMI_MORT varchar(12)   null,
	IQI16_CHF_MORT varchar(12)   null,
	IQI17_ACUTE_STROKE_MORT varchar(12)   null,
	IQI18_GASTROINTESTINAL_HEM_MORT varchar(12)   null,
	IQI19_HIP_FRACTURE_MORT varchar(12)   null,
	IQI20_PNEUMONIA_MORT varchar(12)   null,
	IQI21_CESAREAN_DELIVERY varchar(12)   null,
	IQI22_VBAC_UNCOMP varchar(12)   null,
	IQI23_LAPAROSCOPIC_CHOLECYSTECTOMY varchar(12)   null,
	IQI24_INCIDENTAL_APPENDECTOMY_ELDERLY varchar(12)   null,
	IQI25_BILATERAL_CARDIAC_CATH varchar(12)   null,
	IQI30_PTCA_MORT varchar(12)   null,
	IQI31_CAROTID_ENDARTERECTOMY_MORT varchar(12)   null,
	IQI32_AMI_MORT_RATE_WO_TRANSFER varchar(12)   null,
	IQI33_PRI_CESAREAN_DELIVERY varchar(12)   null,
	IQI34_VBAC_ALL varchar(12)   null,
	IQI9A_PANCREATIC_RESECTION_MORT varchar(12)   null,
	IQI9B_PANCREATIC_RESECTION_MORT varchar(12)   null,
	IQI11A_AAA_REPAIR_MORT varchar(12)   null,
	IQI11B_AAA_REPAIR_MORT varchar(12)   null,
	IQI11C_AAA_REPAIR_MORT varchar(12)   null,
	IQI11D_AAA_REPAIR_MORT varchar(12)   null,
	IQI17A_ACUTE_STROKE_MORT varchar(12)   null,
	IQI17B_ACUTE_STROKE_MORT varchar(12)   null,
	IQI17C_ACUTE_STROKE_MORT varchar(12)   null,
	ANES_COMP varchar(12)   null,
	ASPIR_PNEUMONIA varchar(12)   null,
	BIRTH_TRAUMA varchar(12)   null,
	CABG_AFTER_PTCA varchar(12)   null,
	DEATH_LOW_MORT_DRG varchar(12)   null,
	DECUB_ULCER_RISK_PAT varchar(12)   null,
	DECUBITUS_ULCER varchar(12)   null,
	FAIL_RESCUE varchar(12)   null,
	FAIL_RESCUE_A varchar(12)   null,
	FAIL_RESCUE_B varchar(12)   null,
	FAIL_RESCUE_C varchar(12)   null,
	FAIL_RESCUE_D varchar(12)   null,
	FAIL_RESCUE_E varchar(12)   null,
	FOREIGN_BODY_LEFT varchar(12)   null,
	IN_HOSP_FRAC varchar(12)   null,
	INFECTION_MED_CARE varchar(12)   null,
	INTRAOP_NERVE_COMP varchar(12)   null,
	LATRO_PNEUMOTHORAX varchar(12)   null,
	MALIG_HYPERTHERMIA varchar(12)   null,
	OB_LACERATIONS varchar(12)   null,
	OB_TRA_CSECT varchar(12)   null,
	OB_TRA_VAG_W_INSTR varchar(12)   null,
	OB_TRA_VAG_WO_INSTR varchar(12)   null,
	OB_WOUND_CSECT varchar(12)   null,
	OB_WOUND_VAG varchar(12)   null,
	OTHER_OB_COMP_DEL varchar(12)   null,
	POST_PART_URIN_INFECT varchar(12)   null,
	POSTOP_AMI varchar(12)   null,
	POSTOP_DERANGEMNTS varchar(12)   null,
	POSTOP_HEM varchar(12)   null,
	POSTOP_HIP_FRAC varchar(12)   null,
	POSTOP_IATRO_CARD varchar(12)   null,
	POSTOP_IATRO_NERV varchar(12)   null,
	POSTOP_PUL_EMB varchar(12)   null,
	POSTOP_RESP_FAILURE varchar(12)   null,
	POSTOP_SEPSIS varchar(12)   null,
	POSTOP_WOUND_DEHIS varchar(12)   null,
	REOPEN_SURG_SITE varchar(12)   null,
	SUTURE_LACERATION varchar(12)   null,
	TECH_DIFF_PROC varchar(12)   null,
	TRANSF_REACTION varchar(12)   null,
	UTERINE_RUPTURE varchar(12)   null,
	MMBR_OF_ASTHM_RGSTRY_CDS int   null,
	MMBR_OF_CKD_RGSTRY_CDS int   null,
	MMBR_OF_COPD_RGSTRY_CDS int   null,
	MMBR_OF_CHF_RGSTRY_CDS int   null,
	MMBR_OF_CAD_RGSTRY_CDS int   null,
	MMBR_OF_CF_RGSTRY_CDS int   null,
	MMBR_OF_DIABTS_RGSTRY_CDS int   null,
	MMBR_OF_HIV_RGSTRY_CDS int   null,
	MMBR_OF_HTN_RGSTRY_CDS int   null,
	MMBR_OF_OBSTY_RGSTRY_CDS int   null,
	MMBR_OF_OPD_RGSTRY_CDS int   null,
	MMBR_OF_PREDIABTS_RGSTRY_CDS int   null,
	MMBR_OF_TBCCO_RGSTRY_CDS int   null,
	IS_ENC_MDCR_CDS int   null,
	IS_ENC_MDCD_CDS int   null,
	PCP_PRMRY_DEPT_SK bigint   null,
	PCP_PROVDR_SK bigint   null,
	PAT_HAS_FLLWP_DCMNTD_CDS int   null,
	REV_LOC_CDS int   null,
	SRC_CD varchar(6)   null,
	IN_ANALYSIS_A1 varchar(9)   null,
	IN_ANALYSIS_A2 varchar(9)   null,
	IN_ANALYSIS_D1 varchar(9)   null,
	IN_ANALYSIS_D2 varchar(9)   null,
	IN_ANALYSIS_D3 varchar(9)   null,
	IN_ANALYSIS_E1 varchar(9)   null,
	IN_ANALYSIS_E2 varchar(9)   null,
	IN_ANALYSIS_E4 varchar(9)   null,
	IN_ANALYSIS_E7 varchar(9)   null,
	IN_ANALYSIS_I1 varchar(9)   null,
	IN_ANALYSIS_I3 varchar(9)   null,
	IN_ANALYSIS_I4 varchar(9)   null,
	IN_ANALYSIS_I5 varchar(9)   null,
	IN_ANALYSIS_I6 varchar(9)   null,
	IN_ANALYSIS_L2 varchar(9)   null,
	IN_ANALYSIS_L3 varchar(9)   null,
	IN_ANALYSIS_L5 varchar(9)   null,
	IN_ANALYSIS_L6 varchar(9)   null,
	IN_ANALYSIS_L8 varchar(9)   null,
	IN_ANALYSIS_M2 varchar(9)   null,
	IN_ANALYSIS_M3 varchar(9)   null,
	IN_ANALYSIS_M4 varchar(9)   null,
	IN_ANALYSIS_N1 varchar(9)   null,
	IN_ANALYSIS_N2 varchar(9)   null,
	IN_ANALYSIS_N3 varchar(9)   null,
	IN_ANALYSIS_N4 varchar(9)   null,
	IN_ANALYSIS_N5 varchar(9)   null,
	IN_ANALYSIS_N6 varchar(9)   null,
	IN_ANALYSIS_O2 varchar(9)   null,
	IN_ANALYSIS_O3 varchar(9)   null,
	IN_ANALYSIS_O4 varchar(9)   null,
	IN_ANALYSIS_P1 varchar(9)   null,
	IN_ANALYSIS_P2 varchar(9)   null,
	IN_ANALYSIS_P3 varchar(9)   null,
	IN_ANALYSIS_P4 varchar(9)   null,
	IN_ANALYSIS_P5 varchar(9)   null,
	IN_ANALYSIS_Q11822_1 varchar(9)   null,
	IN_ANALYSIS_R1 varchar(9)   null,
	IN_ANALYSIS_R2 varchar(9)   null,
	IN_ANALYSIS_R3 varchar(9)   null,
	IN_ANALYSIS_R4 varchar(9)   null,
	IN_ANALYSIS_R5 varchar(9)   null,
	IN_ANALYSIS_T1 varchar(9)   null,
	IN_ANALYSIS_T3 varchar(9)   null,
	IN_ANALYSIS_T5 varchar(9)   null,
	IN_ANALYSIS_T7 varchar(9)   null,
	IN_ANALYSIS_V2 varchar(9)   null,
	IN_ANALYSIS_V3 varchar(9)   null,
	IN_CAHPS_CMS_1 varchar(256)   null,
	IN_CAHPS_CMS_10 varchar(256)   null,
	IN_CAHPS_CMS_11 varchar(256)   null,
	IN_CAHPS_CMS_12 varchar(256)   null,
	IN_CAHPS_CMS_13CL varchar(256)   null,
	IN_CAHPS_CMS_14 varchar(256)   null,
	IN_CAHPS_CMS_15CL varchar(256)   null,
	IN_CAHPS_CMS_16CL varchar(256)   null,
	IN_CAHPS_CMS_18 varchar(256)   null,
	IN_CAHPS_CMS_19CL varchar(256)   null,
	IN_CAHPS_CMS_2 varchar(256)   null,
	IN_CAHPS_CMS_20 varchar(256)   null,
	IN_CAHPS_CMS_21CL varchar(256)   null,
	IN_CAHPS_CMS_22CL varchar(256)   null,
	IN_CAHPS_CMS_23 varchar(256)   null,
	IN_CAHPS_CMS_24 varchar(256)   null,
	IN_CAHPS_CMS_25 varchar(256)   null,
	IN_CAHPS_CMS_26 varchar(256)   null,
	IN_CAHPS_CMS_27 varchar(256)   null,
	IN_CAHPS_CMS_28 varchar(256)   null,
	IN_CAHPS_CMS_29A varchar(256)   null,
	IN_CAHPS_CMS_29B varchar(256)   null,
	IN_CAHPS_CMS_29C varchar(256)   null,
	IN_CAHPS_CMS_29D varchar(256)   null,
	IN_CAHPS_CMS_29E varchar(256)   null,
	IN_CAHPS_CMS_3 varchar(256)   null,
	IN_CAHPS_CMS_30 varchar(256)   null,
	IN_CAHPS_CMS_33CL varchar(256)   null,
	IN_CAHPS_CMS_34 varchar(256)   null,
	IN_CAHPS_CMS_37CL varchar(256)   null,
	IN_CAHPS_CMS_38 varchar(256)   null,
	IN_CAHPS_CMS_39 varchar(256)   null,
	IN_CAHPS_CMS_40 varchar(256)   null,
	IN_CAHPS_CMS_41 varchar(256)   null,
	IN_CAHPS_CMS_6 varchar(256)   null,
	IN_CAHPS_CMS_7 varchar(256)   null,
	IN_CAHPS_CMS_8 varchar(256)   null,
	READMISSION_INDX_ADMSN_IND varchar(3)   null,
	READMISSION_READMSN_IND varchar(3)   null,
	PX_IND varchar(3)   null,
	IN_DEMOGRAPHICS_DISTRIB varchar(256)   null,
	IN_ANALYSIS_A1_CDS int   null,
	IN_ANALYSIS_A2_CDS int   null,
	IN_ANALYSIS_D1_CDS int   null,
	IN_ANALYSIS_D2_CDS int   null,
	IN_ANALYSIS_D3_CDS int   null,
	IN_ANALYSIS_E1_CDS int   null,
	IN_ANALYSIS_E2_CDS int   null,
	IN_ANALYSIS_E4_CDS int   null,
	IN_ANALYSIS_E7_CDS int   null,
	IN_ANALYSIS_I1_CDS int   null,
	IN_ANALYSIS_I3_CDS int   null,
	IN_ANALYSIS_I4_CDS int   null,
	IN_ANALYSIS_I5_CDS int   null,
	IN_ANALYSIS_I6_CDS int   null,
	IN_ANALYSIS_L2_CDS int   null,
	IN_ANALYSIS_L3_CDS int   null,
	IN_ANALYSIS_L5_CDS int   null,
	IN_ANALYSIS_L6_CDS int   null,
	IN_ANALYSIS_L8_CDS int   null,
	IN_ANALYSIS_M2_CDS int   null,
	IN_ANALYSIS_M3_CDS int   null,
	IN_ANALYSIS_M4_CDS int   null,
	IN_ANALYSIS_N1_CDS int   null,
	IN_ANALYSIS_N2_CDS int   null,
	IN_ANALYSIS_N3_CDS int   null,
	IN_ANALYSIS_N4_CDS int   null,
	IN_ANALYSIS_N5_CDS int   null,
	IN_ANALYSIS_N6_CDS int   null,
	IN_ANALYSIS_O2_CDS int   null,
	IN_ANALYSIS_O3_CDS int   null,
	IN_ANALYSIS_O4_CDS int   null,
	IN_ANALYSIS_P1_CDS int   null,
	IN_ANALYSIS_P2_CDS int   null,
	IN_ANALYSIS_P3_CDS int   null,
	IN_ANALYSIS_P4_CDS int   null,
	IN_ANALYSIS_P5_CDS int   null,
	IN_ANALYSIS_Q11822_1_CDS int   null,
	IN_ANALYSIS_R1_CDS int   null,
	IN_ANALYSIS_R2_CDS int   null,
	IN_ANALYSIS_R3_CDS int   null,
	IN_ANALYSIS_R4_CDS int   null,
	IN_ANALYSIS_R5_CDS int   null,
	IN_ANALYSIS_T1_CDS int   null,
	IN_ANALYSIS_T3_CDS int   null,
	IN_ANALYSIS_T5_CDS int   null,
	IN_ANALYSIS_T7_CDS int   null,
	IN_ANALYSIS_V2_CDS int   null,
	IN_ANALYSIS_V3_CDS int   null,
	IN_CAHPS_CMS_1_CDS int   null,
	IN_CAHPS_CMS_10_CDS int   null,
	IN_CAHPS_CMS_11_CDS int   null,
	IN_CAHPS_CMS_12_CDS int   null,
	IN_CAHPS_CMS_13CL_CDS int   null,
	IN_CAHPS_CMS_14_CDS int   null,
	IN_CAHPS_CMS_15CL_CDS int   null,
	IN_CAHPS_CMS_16CL_CDS int   null,
	IN_CAHPS_CMS_18_CDS int   null,
	IN_CAHPS_CMS_19CL_CDS int   null,
	IN_CAHPS_CMS_2_CDS int   null,
	IN_CAHPS_CMS_20_CDS int   null,
	IN_CAHPS_CMS_21CL_CDS int   null,
	IN_CAHPS_CMS_22CL_CDS int   null,
	IN_CAHPS_CMS_23_CDS int   null,
	IN_CAHPS_CMS_24_CDS int   null,
	IN_CAHPS_CMS_25_CDS int   null,
	IN_CAHPS_CMS_26_CDS int   null,
	IN_CAHPS_CMS_27_CDS int   null,
	IN_CAHPS_CMS_28_CDS int   null,
	IN_CAHPS_CMS_29A_CDS int   null,
	IN_CAHPS_CMS_29B_CDS int   null,
	IN_CAHPS_CMS_29C_CDS int   null,
	IN_CAHPS_CMS_29D_CDS int   null,
	IN_CAHPS_CMS_29E_CDS int   null,
	IN_CAHPS_CMS_3_CDS int   null,
	IN_CAHPS_CMS_30_CDS int   null,
	IN_CAHPS_CMS_33CL_CDS int   null,
	IN_CAHPS_CMS_34_CDS int   null,
	IN_CAHPS_CMS_37CL_CDS int   null,
	IN_CAHPS_CMS_38_CDS int   null,
	IN_CAHPS_CMS_39_CDS int   null,
	IN_CAHPS_CMS_40_CDS int   null,
	IN_CAHPS_CMS_41_CDS int   null,
	IN_CAHPS_CMS_6_CDS int   null,
	IN_CAHPS_CMS_7_CDS int   null,
	IN_CAHPS_CMS_8_CDS int   null,
	READMISSION_PLN_UNPLN varchar(14)   null,
	READMISSION_AMI_IND varchar(14)   null,
	READMISSION_HF_IND varchar(14)   null,
	READMISSION_COPD_IND varchar(14)   null,
	READMISSION_PNEU_IND varchar(14)   null,
	READMISSION_CABG_IND varchar(14)   null,
	READMISSION_THATKA_IND varchar(14)   null,
	READMISSION_SEPSIS_IND varchar(14)   null,
	READMSN_CASE_IND int   null,
	CONSTRAINT PK_InpatientDim_INPTNT_VST_SK PRIMARY KEY CLUSTERED (INPTNT_VST_SK)
);


create table InpatientDischargeDestinationDim(
	DSCRG_DSTN_CDS int identity(1,1) not null,
	DSCRG_DSTN_DESC varchar(255)   null,
	CONSTRAINT PK_InpatientDischargeDestinationDim_DSCRG_DSTN_CDS PRIMARY KEY CLUSTERED (DSCRG_DSTN_CDS)
);


create table InpatientDischargeDispositionDim(
	DSCRG_DSPSTN_CDS int identity(1,1) not null,
	DSCRG_DSPSTN_DESC varchar(255)   null,
	CONSTRAINT PK_InpatientDischargeDispositionDim_DSCRG_DSPSTN_CDS PRIMARY KEY CLUSTERED (DSCRG_DSPSTN_CDS)
);


create table InpatientFact(
	SRC_ENCNT_ID varchar(255)   null,
	ENCNT_SK bigint   null,
	AGE_YRS_AT_CLNC_INPTNT_ADMT int   null,
	AGE_MNTHS_AT_CLNC_INPTNT_ADMT int   null,
	AGE_DYS_AT_CLNC_INPTNT_ADMT int   null,
	LOS_DYS_CLNC_INPTNT int   null,
	LOS_HRS_CLNC_INPTNT int   null,
	INPTNT_APPT_MADE_DT datetime   null,
	PRMY_CDD_PRCDR_SK varchar(1)   null,
	PRMY_CDD_DIAG_SK int   null,
	LOS_DYS_EXPCT_INPTNT varchar(1)   null,
	CLNC_INPTNT_ADMT_DT datetime   null,
	PTNT_SK bigint   null,
	INPTNT_VST_SK bigint  not null,
	HSPTL_ADMT_DT datetime   null,
	HSPTL_ADMT_TS_SK bigint   null,
	HSPTL_DSCRG_DT datetime   null,
	HSPTL_DSCRG_TS_SK bigint   null,
	AGE_YRS_AT_CLNC_INPTNT_ADMT_LOG float   null,
	LOS_DYS_CLNC_INPTNT_LOG float   null,
	LOS_HRS_CLNC_INPTNT_LOG float   null,
	CLNC_INPTNT_ADMT_TS_SK bigint   null,
	HSPTL_ADMT_PROVDR_SK bigint   null,
	HSPTL_DSCRG_PROVDR_SK bigint   null,
);


create table InpatientPatientClassDim(
	PTNT_CL_CDS int identity(1,1) not null,
	PTNT_CL_DESC varchar(255)   null,
	CONSTRAINT PK_InpatientPatientClassDim_PTNT_CL_CDS PRIMARY KEY CLUSTERED (PTNT_CL_CDS)
);


create table LDW_DIAG_FACT(
	DIAG_SK bigint  not null,
	SRC_DIAG_SQNC int   null,
	DIAG_CD_SK int   null,
	PTNT_SK bigint   null,
	ENCNT_SK bigint   null,
	DEPT_SK bigint   null,
	CHRNC_IND int   null,
	PRMY_DIAG_IND int   null,
	SCND_DIAG_IND int   null,
	ED_DIAG_IND int   null,
	DIAG_STRT_DT datetime   null,
	DIAG_END_DT datetime   null,
	SRC_TYPE varchar(50)   null,
	PRSNT_ON_ADMT_CD int   null,
	DIAG_STRT_TS_SK bigint   null,
	DIAG_END_TS_SK bigint   null,
);


create table LDW_PTNT_DIM(
	MPI_NUM varchar(80)   null,
	BRTH_TS datetime   null,
	MRTL_STS_CDS int   null,
	MRTL_STS_DESC varchar(255)   null,
	CITY varchar(30)   null,
	CNTY_CDS int   null,
	CNTY_DESC varchar(255)   null,
	ST_PRV_CDS varchar(50)   null,
	ST_PRV_NM varchar(255)   null,
	PSTL_CDS varchar(5)   null,
	CNTRY_CDS int   null,
	CNTRY_NM varchar(50)   null,
	HME_PH_AREA_CDS varchar(8)   null,
	HME_PH_EXCHNG_CDS varchar(3)   null,
	WRK_PH_AREA_CDS varchar(8)   null,
	WRK_PH_EXCHNG_CDS varchar(3)   null,
	LIV_STS_DESC varchar(254)   null,
	DTH_TS datetime   null,
	SEX_CDS int   null,
	SEX_DESC varchar(254)   null,
	PRMY_LANG_CDS int   null,
	PRMY_LANG_DESC varchar(254)   null,
	PRMY_RACE_CDS int   null,
	PRMY_RACE_DESC varchar(254)   null,
	SCND_RACE_CDS int   null,
	SCND_RACE_DESC varchar(255)   null,
	THRD_RACE_CDS int   null,
	THRD_RACE_DESC varchar(255)   null,
	FOURTH_RACE_CDS int   null,
	FOURTH_RACE_DESC varchar(255)   null,
	FIFTH_RACE_CDS int   null,
	FIFTH_RACE_DESC varchar(255)   null,
	ETHNCTY_CDS int   null,
	ETHNCTY_DESC varchar(255)   null,
	RELG_CDS int   null,
	RELG_DESC varchar(255)   null,
	SMKE_STS_CDS int   null,
	SMKE_STS_DESC varchar(255)   null,
	HI_LEVL_OF_EDU_CDS int   null,
	HI_LEVL_OF_EDU_DESC varchar(255)   null,
	PRMY_PAYOR_NM varchar(254)   null,
	PRMY_FNCL_CLASS_CDS int   null,
	PRMY_FNCL_CLASS_DESC varchar(255)   null,
	MTHR_PTNT_BABY_NUM varchar(80)   null,
	AGE int   null,
	REG_TS datetime   null,
	AGE_LOG float   null,
	AVAIL_IND varchar(3)   null,
	AGE_FACT int   null,
	PRMY_PAYOR_CDS int   null,
	PTNT_SK bigint identity(1,1) not null,
	SRC_PTNT_ID varchar(255)   null,
	AGE_AT_REG bigint   null,
	MULTI_RACIAL varchar(3)   null,
	CRNT_PCP_PROVDR_SK bigint   null,
	CARLN_EMP_HLTH_PLN_IND varchar(3)   null,
	LIV_STS_CDS int   null,
	ACTIVE varchar(3)   null,
	CONSTRAINT PK_LDW_PTNT_DIM_PTNT_SK PRIMARY KEY CLUSTERED (PTNT_SK)
);


create table LabComponentDim(
	CMPNT_SK bigint identity(1,1) not null,
	COMP_NAME varchar(513)   null,
	CMPNT_ABBR varchar(50)   null,
	BAS_NM varchar(255)   null,
	CMN_NM varchar(255)   null,
	CMPNT_TYPE_CDS int   null,
	CMPNT_SUBT_CDS int   null,
	DFLT_UNT varchar(50)   null,
	EXPCT_MIN_VAL numeric(18,2)   null,
	EXPCT_MAX_VAL numeric(18,2)   null,
	CONSTRAINT PK_LabComponentDim_CMPNT_SK PRIMARY KEY CLUSTERED (CMPNT_SK)
);


create table LabComponentResultFact(
	CMPNT_RSLT_FACT_SK bigint   null,
	SRC_CMPNT_RSLT_ID varchar(255)   null,
	LAB_TST_SK bigint   null,
	PTNT_SK bigint   null,
	AUTH_PROVDR_SK bigint   null,
	PRCDR_CD_SK bigint   null,
	ENCNT_SK bigint   null,
	RSULT_LAB_SK bigint   null,
	LAB_CMPNT_SK bigint   null,
	RSLT_FLG_CD_SK bigint   null,
	LAB_STS_CD_SK bigint   null,
	ORDRD_DT datetime   null,
	ORDRD_TS_SK bigint   null,
	CLCT_TS_SK bigint   null,
	CLCT_DT datetime   null,
	RSLT_DT datetime   null,
	RSLT_TS_SK bigint   null,
	RSLT_VAL_INTG int   null,
	RSLT_VAL_FLT numeric(18,2)   null,
	RSLT_VAL_TXT varchar(1024)   null,
	REF_UNT varchar(255)   null,
	REF_NRML_VAL varchar(255)   null,
	REFN_LOW_VAL varchar(255)   null,
	REFN_HI_VAL varchar(255)   null,
	ABNRML_IND int   null,
);


create table LabComponentResultFactLabStatusDim(
	LAB_STS_CD_SK bigint identity(1,1) not null,
	CD_DESC varchar(255)   null,
	CONSTRAINT PK_LabComponentResultFactLabStatusDim_LAB_STS_CD_SK PRIMARY KEY CLUSTERED (LAB_STS_CD_SK)
);


create table LabComponentResultFactResultFlagDim(
	RSLT_FLG_CD_SK bigint identity(1,1) not null,
	CD_DESC varchar(255)   null,
	CONSTRAINT PK_LabComponentResultFactResultFlagDim_RSLT_FLG_CD_SK PRIMARY KEY CLUSTERED (RSLT_FLG_CD_SK)
);


create table LabComponentSubstrateDim(
	CMPNT_SUBT_CDS int identity(1,1) not null,
	CMPNT_SUBT_NM varchar(255)   null,
	CONSTRAINT PK_LabComponentSubstrateDim_CMPNT_SUBT_CDS PRIMARY KEY CLUSTERED (CMPNT_SUBT_CDS)
);


create table LabComponentTypeDim(
	CMPNT_TYPE_CDS int identity(1,1) not null,
	CMPNT_TYPE_NM varchar(255)   null,
	CONSTRAINT PK_LabComponentTypeDim_CMPNT_TYPE_CDS PRIMARY KEY CLUSTERED (CMPNT_TYPE_CDS)
);


create table LabDim(
	LAB_SK bigint identity(1,1) not null,
	LAB_NAME varchar(513)   null,
	LAB_ADDR varchar(1024)   null,
	LAB_CITY varchar(255)   null,
	LAB_ST_CDS int   null,
	LAB_ST_ABBR varchar(80)   null,
	LAB_PSTL_CDS varchar(15)   null,
	CONSTRAINT PK_LabDim_LAB_SK PRIMARY KEY CLUSTERED (LAB_SK)
);


create table LabTestCancellationReasonDim(
	CNCL_RSN_CDS int identity(1,1) not null,
	CNCL_RSN_DESC varchar(255)   null,
	CONSTRAINT PK_LabTestCancellationReasonDim_CNCL_RSN_CDS PRIMARY KEY CLUSTERED (CNCL_RSN_CDS)
);


create table LabTestDim(
	LAB_TST_SK bigint identity(1,1) not null,
	SRC_TST_ID varchar(255)   null,
	RSULT_LAB_CDS int   null,
	TST_CDS bigint   null,
	ABNRML_LEVL_DESC varchar(50)   null,
	VRFCTN_STS_CDS int   null,
	ORDR_PRTY_CDS int   null,
	ORDR_SRC_TYPE_CDS int   null,
	SPCMN_NM varchar(255)   null,
	SPCMN_TYPE_CDS int   null,
	SPCMN_SRC_CDS int   null,
	CNCL_RSN_CDS int   null,
	HI_PRTY_IND varchar(3)   null,
	CORR_IND varchar(3)   null,
	CRTCL_IND varchar(3)   null,
	ABNRML_IND varchar(3)   null,
	ORDR_TYPE_CDS int   null,
	CONSTRAINT PK_LabTestDim_LAB_TST_SK PRIMARY KEY CLUSTERED (LAB_TST_SK)
);


create table LabTestFact(
	LAB_TST_FACT_SK bigint   null,
	SRC_TST_ID varchar(255)   null,
	LAB_TST_SK bigint   null,
	PTNT_SK bigint   null,
	AUTH_PROVDR_SK bigint   null,
	PRCDR_CD_SK bigint   null,
	ENCNT_SK bigint   null,
	RSULT_LAB_SK bigint   null,
	ORDRD_DT datetime   null,
	ORDRD_TS_SK bigint   null,
	CLCT_USR_SK bigint   null,
	CLCT_DEPT_SK bigint   null,
	CLCT_DT datetime   null,
	CLCT_TS_SK bigint   null,
	SCHED_CLCT_DT datetime   null,
	SCHED_CLCT_TS_SK bigint   null,
	FRST_FNL_VRFY_DT datetime   null,
	FRST_FNL_VRFY_USR_SK bigint   null,
	FRST_VRFY_DT datetime   null,
	FRST_VRFY_USR_SK bigint   null,
	LST_FNL_VRFY_DT datetime   null,
	LST_FNL_VRFY_USR_SK bigint   null,
	LST_VRFY_DT datetime   null,
	FRST_CORR_DT datetime   null,
	FRST_CORR_USR_SK bigint   null,
	LST_CORR_DT datetime   null,
	LST_CORR_USR_SK bigint   null,
	COLL_TM_MNT numeric(18,2)   null,
);


create table LabTestNameDim(
	TST_CDS bigint identity(1,1) not null,
	TEST_NAME varchar(280)   null,
	CONSTRAINT PK_LabTestNameDim_TST_CDS PRIMARY KEY CLUSTERED (TST_CDS)
);


create table LabTestOrderPriorityDim(
	ORDR_PRTY_CDS int identity(1,1) not null,
	ORDR_PRTY_DESC varchar(255)   null,
	CONSTRAINT PK_LabTestOrderPriorityDim_ORDR_PRTY_CDS PRIMARY KEY CLUSTERED (ORDR_PRTY_CDS)
);


create table LabTestOrderSourceTypeDim(
	ORDR_SRC_TYPE_CDS int identity(1,1) not null,
	ORDR_SRC_TYPE_DESC varchar(255)   null,
	CONSTRAINT PK_LabTestOrderSourceTypeDim_ORDR_SRC_TYPE_CDS PRIMARY KEY CLUSTERED (ORDR_SRC_TYPE_CDS)
);


create table LabTestOrderType(
	ORDR_TYPE_CDS int identity(1,1) not null,
	ORDR_TYPE_DESC varchar(50)   null,
	CONSTRAINT PK_LabTestOrderType_ORDR_TYPE_CDS PRIMARY KEY CLUSTERED (ORDR_TYPE_CDS)
);


create table LabTestSpecimenSourceDim(
	SPCMN_SRC_CDS int identity(1,1) not null,
	SPCMN_SRC_DESC varchar(255)   null,
	CONSTRAINT PK_LabTestSpecimenSourceDim_SPCMN_SRC_CDS PRIMARY KEY CLUSTERED (SPCMN_SRC_CDS)
);


create table LabTestSpecimenTypeDim(
	SPCMN_TYPE_CDS int identity(1,1) not null,
	SPCMN_TYPE_DESC varchar(255)   null,
	CONSTRAINT PK_LabTestSpecimenTypeDim_SPCMN_TYPE_CDS PRIMARY KEY CLUSTERED (SPCMN_TYPE_CDS)
);


create table LabTestVerificationStatusDim(
	VRFCTN_STS_CDS int identity(1,1) not null,
	VRFCTN_STS_DESC varchar(255)   null,
	CONSTRAINT PK_LabTestVerificationStatusDim_VRFCTN_STS_CDS PRIMARY KEY CLUSTERED (VRFCTN_STS_CDS)
);


create table MeasureMDFact(
	Data_ID int  not null,
	Measure_Dim_ID int   null,
	Meaure_Month int   null,
	Result numeric(18,2)   null,
	SRC_DEPT_ID varchar(4000)   null,
);


create table MeasureMLFact(
	Data_ID int  not null,
	Measure_Dim_ID int   null,
	Meaure_Month int   null,
	Result numeric(18,2)   null,
	LO_CDS int   null,
);


create table MeasureQDFact(
	Data_ID int  not null,
	Measure_Dim_ID int   null,
	Meaure_Quarter int   null,
	Result numeric(18,2)   null,
	SRC_DEPT_ID varchar(4000)   null,
);


create table MeasureQLFact(
	Data_ID int  not null,
	Measure_Dim_ID int   null,
	Meaure_Quarter int   null,
	Result numeric(18,2)   null,
	LO_CDS int   null,
);


create table MedicationAdministrationActionDim(
	ADMN_ACTN_CDS_SK int identity(1,1) not null,
	ADMN_ACTN_DESC varchar(255)   null,
	CONSTRAINT PK_MedicationAdministrationActionDim_ADMN_ACTN_CDS_SK PRIMARY KEY CLUSTERED (ADMN_ACTN_CDS_SK)
);


create table MedicationAdministrationFact(
	MDCTN_ADMN_FACT_SK bigint  not null,
	MDCTN_ORDR_SK bigint   null,
	PTNT_SK bigint   null,
	ENCNT_SK bigint   null,
	ADMN_DEPT_SK bigint   null,
	ADMN_USR_SK bigint   null,
	PRMY_CMPNT_SK bigint   null,
	SCND_CMPNT_SK bigint   null,
	THRD_CMPNT_SK bigint   null,
	FOURTH_CMPNT_SK bigint   null,
	FIFTH_CMPNT_SK bigint   null,
	ADMN_ACTN_CDS_SK int   null,
	SCHED_ADMN_DT datetime   null,
	SCHED_ADMN_TS_SK bigint   null,
	ADMN_DT datetime   null,
	ADMN_TS_SK bigint   null,
	CRG_AMT numeric(18,2)   null,
	RPRST_COST numeric(18,2)   null,
	ACQSTN_COST numeric(18,2)   null,
	MDCTN_REQ_SCAN_AT_ADMN_IND int   null,
	MDCTN_SCANNED_AT_ADMN_IND int   null,
	PTNT_REQ_SCAN_AT_ADMN_IND int   null,
	PTNT_SCANNED_AT_ADMN_IND int   null,
);


create table MedicationAdministrationRouteDim(
	ADMN_RT_CDS int identity(1,1) not null,
	ADMN_RT_DESC varchar(255)   null,
	CONSTRAINT PK_MedicationAdministrationRouteDim_ADMN_RT_CDS PRIMARY KEY CLUSTERED (ADMN_RT_CDS)
);


create table MedicationDEAClassDim(
	DEA_CLASS_CDS int identity(1,1) not null,
	DEA_CLASS_DESC varchar(255)   null,
	CONSTRAINT PK_MedicationDEAClassDim_DEA_CLASS_CDS PRIMARY KEY CLUSTERED (DEA_CLASS_CDS)
);


create table MedicationDim(
	MDCTN_SK bigint identity(1,1) not null,
	SRC_MDCTN_ID varchar(255)   null,
	MDCTN_NM varchar(255)   null,
	GNRC_NM varchar(255)   null,
	THRPC_CLASS_CDS int   null,
	PHARM_CLASS_CDS int   null,
	PHARM_SUBCLS_CDS int   null,
	MDCTN_FORM_CDS int   null,
	ADMN_RT_CDS int   null,
	MDCTN_STRG varchar(255)   null,
	GPI_NUM varchar(255)   null,
	DEA_CLASS_CDS int   null,
	CNTLD_SUBSTN_IND varchar(3)   null,
	CONSTRAINT PK_MedicationDim_MDCTN_SK PRIMARY KEY CLUSTERED (MDCTN_SK)
);


create table MedicationFormDim(
	MDCTN_FORM_CDS int identity(1,1) not null,
	MDCTN_FORM_DESC varchar(255)   null,
	CONSTRAINT PK_MedicationFormDim_MDCTN_FORM_CDS PRIMARY KEY CLUSTERED (MDCTN_FORM_CDS)
);


create table MedicationOrderCalculatedDoseUnitDim(
	CLCLTD_DOSE_UNT_CDS int identity(1,1) not null,
	CLCLTD_DOSE_UNT_DESC varchar(255)   null,
	CONSTRAINT PK_MedicationOrderCalculatedDoseUnitDim_CLCLTD_DOSE_UNT_CDS PRIMARY KEY CLUSTERED (CLCLTD_DOSE_UNT_CDS)
);


create table MedicationOrderClassDim(
	ORDR_CLASS_CDS int identity(1,1) not null,
	ORDR_CLASS_DESC varchar(255)   null,
	CONSTRAINT PK_MedicationOrderClassDim_ORDR_CLASS_CDS PRIMARY KEY CLUSTERED (ORDR_CLASS_CDS)
);


create table MedicationOrderDim(
	MDCTN_ORDR_SK bigint identity(1,1) not null,
	PTNT_INSTR varchar(255)   null,
	RT_CDS int   null,
	QTY_UNT_CDS int   null,
	DOSE_UNT_CDS int   null,
	CLCLTD_DOSE_UNT_CDS int   null,
	ORDR_SRC_CDS int   null,
	ORDR_CLASS_CDS int   null,
	ORDR_MODE_CDS int   null,
	ORDR_PRTY_CDS int   null,
	ORDR_SET_SRC_CDS bigint   null,
	PRN_RSN_1 varchar(255)   null,
	INDC_FOR_USE_1 varchar(255)   null,
	CPOE_IND varchar(3)   null,
	DSPNS_AS_WRTN_IND varchar(3)   null,
	ORDRD_AS_NONFORM_IND varchar(3)   null,
	VRFD_AS_NONFORM_IND varchar(3)   null,
	AUTOMAT_VRFD_IND varchar(3)   null,
	VRBL_IND varchar(3)   null,
	REQR_COSIG_IND varchar(3)   null,
	COSIG_IND varchar(3)   null,
	VRBL_SGN_IND varchar(3)   null,
	SRC_ORDR_ID varchar(255)   null,
	FREQ_DESC varchar(255)   null,
	CONSTRAINT PK_MedicationOrderDim_MDCTN_ORDR_SK PRIMARY KEY CLUSTERED (MDCTN_ORDR_SK)
);


create table MedicationOrderDoseUnitDim(
	DOSE_UNT_CDS int identity(1,1) not null,
	DOSE_UNT_DESC varchar(255)   null,
	CONSTRAINT PK_MedicationOrderDoseUnitDim_DOSE_UNT_CDS PRIMARY KEY CLUSTERED (DOSE_UNT_CDS)
);


create table MedicationOrderFact(
	MDCTN_ORDR_FACT_SK bigint  not null,
	MDCTN_ORDR_SK bigint   null,
	PTNT_SK bigint   null,
	ENCNT_SK bigint   null,
	DEPT_SK bigint   null,
	PHRM_SK bigint   null,
	MDCTN_SK bigint   null,
	ORDRD_BY_USR_SK bigint   null,
	ORDRD_BY_PROVDR_SK bigint   null,
	AUTH_BY_PROVDR_SK bigint   null,
	ORDRD_DT datetime   null,
	ORDR_STRT_DT datetime   null,
	ORDR_END_DT datetime   null,
	ORDR_DSCNTND_DT datetime   null,
	QTY numeric(18,2)   null,
	MIN_DOSE numeric(18,2)   null,
	MAXM_DOSE numeric(18,2)   null,
	CLCLTD_MIN_DOSE numeric(18,2)   null,
	CLCLTD_MAXM_DOSE numeric(18,2)   null,
	NBR_OF_DOSES int   null,
	NBR_WRTN_REFILLS int   null,
	ORDRD_TS_SK bigint   null,
	ORDR_STRT_TS_SK bigint   null,
	ORDR_END_TS_SK bigint   null,
	DSCNTND_TS_SK bigint   null,
);


create table MedicationOrderFrequencyDim(
	FREQ_CDS int  not null,
	FREQ_DESC varchar(255)   null,
);


create table MedicationOrderModeDim(
	ORDR_MODE_CDS int identity(1,1) not null,
	ORDR_MODE_DESC varchar(255)   null,
	CONSTRAINT PK_MedicationOrderModeDim_ORDR_MODE_CDS PRIMARY KEY CLUSTERED (ORDR_MODE_CDS)
);


create table MedicationOrderPriorityDim(
	ORDR_PRTY_CDS int identity(1,1) not null,
	ORDR_PRTY_DESC varchar(255)   null,
	CONSTRAINT PK_MedicationOrderPriorityDim_ORDR_PRTY_CDS PRIMARY KEY CLUSTERED (ORDR_PRTY_CDS)
);


create table MedicationOrderQuantityUnitDim(
	QTY_UNT_CDS int identity(1,1) not null,
	QTY_UNT_DESC varchar(255)   null,
	CONSTRAINT PK_MedicationOrderQuantityUnitDim_QTY_UNT_CDS PRIMARY KEY CLUSTERED (QTY_UNT_CDS)
);


create table MedicationOrderRouteDim(
	RT_CDS int identity(1,1) not null,
	RT_DESC varchar(255)   null,
	CONSTRAINT PK_MedicationOrderRouteDim_RT_CDS PRIMARY KEY CLUSTERED (RT_CDS)
);


create table MedicationOrderSetSourceDim(
	ORDR_SET_SRC_CDS bigint identity(1,1) not null,
	ORDR_SET_SRC_NM varchar(255)   null,
	CONSTRAINT PK_MedicationOrderSetSourceDim_ORDR_SET_SRC_CDS PRIMARY KEY CLUSTERED (ORDR_SET_SRC_CDS)
);


create table MedicationOrderSourceDim(
	ORDR_SRC_CDS int identity(1,1) not null,
	ORDR_SRC_DESC varchar(255)   null,
	CONSTRAINT PK_MedicationOrderSourceDim_ORDR_SRC_CDS PRIMARY KEY CLUSTERED (ORDR_SRC_CDS)
);


create table MedicationPharmacologicalClassDim(
	PHARM_CLASS_CDS int identity(1,1) not null,
	PHARM_CLASS_DESC varchar(255)   null,
	CONSTRAINT PK_MedicationPharmacologicalClassDim_PHARM_CLASS_CDS PRIMARY KEY CLUSTERED (PHARM_CLASS_CDS)
);


create table MedicationPharmacologicalSubclassDim(
	PHARM_SUBCLS_CDS int identity(1,1) not null,
	PHARM_SUBCLS_DESC varchar(255)   null,
	CONSTRAINT PK_MedicationPharmacologicalSubclassDim_PHARM_SUBCLS_CDS PRIMARY KEY CLUSTERED (PHARM_SUBCLS_CDS)
);


create table MedicationTherapeuticClassDim(
	THRPC_CLASS_CDS int identity(1,1) not null,
	THRPC_CLASS_DESC varchar(255)   null,
	CONSTRAINT PK_MedicationTherapeuticClassDim_THRPC_CLASS_CDS PRIMARY KEY CLUSTERED (THRPC_CLASS_CDS)
);


create table OutpatientAdmitConfirmationStatusDim(
	ADMT_CNF_STT_CDS int identity(1,1) not null,
	ADMT_CNF_STT_NM varchar(255)   null,
	CONSTRAINT PK_OutpatientAdmitConfirmationStatusDim_ADMT_CNF_STT_CDS PRIMARY KEY CLUSTERED (ADMT_CNF_STT_CDS)
);


create table OutpatientAppointmentConfirmation(
	APPT_CNF_STT_CDS int identity(1,1) not null,
	APPT_CNF_STT_NM varchar(255)   null,
	CONSTRAINT PK_OutpatientAppointmentConfirmation_APPT_CNF_STT_CDS PRIMARY KEY CLUSTERED (APPT_CNF_STT_CDS)
);


create table OutpatientAppointmentStatusDim(
	APPT_STTS_CDS int identity(1,1) not null,
	APPT_STTS_NM varchar(255)   null,
	CONSTRAINT PK_OutpatientAppointmentStatusDim_APPT_STTS_CDS PRIMARY KEY CLUSTERED (APPT_STTS_CDS)
);


create table OutpatientCancellationReasonDim(
	CNCL_RSN_CDS int identity(1,1) not null,
	CNCL_RSN_NM varchar(255)   null,
	CONSTRAINT PK_OutpatientCancellationReasonDim_CNCL_RSN_CDS PRIMARY KEY CLUSTERED (CNCL_RSN_CDS)
);


create table OutpatientDim(
	ENCNT_SK bigint identity(1,1) not null,
	APPT_STTS_CDS int   null,
	VST_FNNCL_CLSS_CDS int   null,
	ADMT_CNF_STT_CDS int   null,
	APPT_CNF_STT_CDS int   null,
	CNCL_RSN_CDS int   null,
	AGE_YRS_AT_ENCNT int   null,
	AGE_MNTHS_AT_ENCNT int   null,
	AGE_DYS_AT_ENCNT int   null,
	OUTPTNT_VST_SK bigint  not null,
	SRC_TYPE varchar(50)   null,
	APPT_STTS_NM varchar(255)   null,
	MDCTN_RVWD_IND varchar(3)   null,
	PRBLM_LST_RVWD varchar(3)   null,
	AVS_PRNTD_IND varchar(3)   null,
	ALLRG_RVWD_IND varchar(3)   null,
	CLSD_IND varchar(3)   null,
	APPT_CMPLT_IND varchar(3)   null,
	WLKN_IND varchar(3)   null,
	RFRRL_RQRD_IND varchar(3)   null,
	AS_ANALYSIS_C185 varchar(9)   null,
	AS_ANALYSIS_C186 varchar(9)   null,
	AS_ANALYSIS_C3 varchar(9)   null,
	AS_ANALYSIS_D2 varchar(9)   null,
	AS_ANALYSIS_D3 varchar(9)   null,
	AS_ANALYSIS_D98 varchar(9)   null,
	AS_ANALYSIS_D99 varchar(9)   null,
	AS_ANALYSIS_Q11822_1 varchar(9)   null,
	AS_CAHPS_OSC_1 varchar(256)   null,
	AS_CAHPS_OSC_10 varchar(256)   null,
	AS_CAHPS_OSC_11CL varchar(256)   null,
	AS_CAHPS_OSC_12CL varchar(256)   null,
	AS_CAHPS_OSC_13 varchar(256)   null,
	AS_CAHPS_OSC_14 varchar(256)   null,
	AS_CAHPS_OSC_15 varchar(256)   null,
	AS_CAHPS_OSC_16 varchar(256)   null,
	AS_CAHPS_OSC_17 varchar(256)   null,
	AS_CAHPS_OSC_18 varchar(256)   null,
	AS_CAHPS_OSC_19 varchar(256)   null,
	AS_CAHPS_OSC_2 varchar(256)   null,
	AS_CAHPS_OSC_20 varchar(256)   null,
	AS_CAHPS_OSC_21 varchar(256)   null,
	AS_CAHPS_OSC_22 varchar(256)   null,
	AS_CAHPS_OSC_23 varchar(256)   null,
	AS_CAHPS_OSC_24 varchar(256)   null,
	AS_CAHPS_OSC_3 varchar(256)   null,
	AS_CAHPS_OSC_4 varchar(256)   null,
	AS_CAHPS_OSC_5 varchar(256)   null,
	AS_CAHPS_OSC_6 varchar(256)   null,
	AS_CAHPS_OSC_7 varchar(256)   null,
	AS_CAHPS_OSC_8 varchar(256)   null,
	AS_CAHPS_OSC_9 varchar(256)   null,
	PG_OU_SURVEY_ID varchar(256)   null,
	OU_ANALYSIS_A4_CDS int   null,
	OU_ANALYSIS_A4 varchar(9)   null,
	OU_ANALYSIS_A48_CDS int   null,
	OU_ANALYSIS_A48 varchar(9)   null,
	OU_ANALYSIS_A6_CDS int   null,
	OU_ANALYSIS_A6 varchar(9)   null,
	OU_ANALYSIS_A7_CDS int   null,
	OU_ANALYSIS_A7 varchar(9)   null,
	OU_ANALYSIS_C121_CDS int   null,
	OU_ANALYSIS_C121 varchar(9)   null,
	OU_ANALYSIS_C2_CDS int   null,
	OU_ANALYSIS_C2 varchar(9)   null,
	OU_ANALYSIS_C6_CDS int   null,
	OU_ANALYSIS_C6 varchar(9)   null,
	OU_ANALYSIS_C7_CDS int   null,
	OU_ANALYSIS_C7 varchar(9)   null,
	OU_ANALYSIS_C8_CDS int   null,
	OU_ANALYSIS_C8 varchar(9)   null,
	OU_ANALYSIS_D2_CDS int   null,
	OU_ANALYSIS_D2 varchar(9)   null,
	OU_ANALYSIS_D3_CDS int   null,
	OU_ANALYSIS_D3 varchar(9)   null,
	OU_ANALYSIS_E1_CDS int   null,
	OU_ANALYSIS_E1 varchar(9)   null,
	OU_ANALYSIS_E101_CDS int   null,
	OU_ANALYSIS_E101 varchar(9)   null,
	OU_ANALYSIS_E102_CDS int   null,
	OU_ANALYSIS_E102 varchar(9)   null,
	OU_ANALYSIS_E14_CDS int   null,
	OU_ANALYSIS_E14 varchar(9)   null,
	OU_ANALYSIS_E38_CDS int   null,
	OU_ANALYSIS_E38 varchar(9)   null,
	OU_ANALYSIS_E4_CDS int   null,
	OU_ANALYSIS_E4 varchar(9)   null,
	OU_ANALYSIS_Q11822_1_CDS int   null,
	OU_ANALYSIS_Q11822_1 varchar(9)   null,
	OU_DEMOGRAPHICS_DAYWEEK_CDS int   null,
	OU_DEMOGRAPHICS_DAYWEEK varchar(50)   null,
	PG_UC_SURVEY_ID varchar(256)   null,
	UC_ANALYSIS_A2_CDS int   null,
	UC_ANALYSIS_A2 varchar(9)   null,
	UC_ANALYSIS_A28_CDS int   null,
	UC_ANALYSIS_A28 varchar(9)   null,
	UC_ANALYSIS_A3_CDS int   null,
	UC_ANALYSIS_A3 varchar(9)   null,
	UC_ANALYSIS_A4_CDS int   null,
	UC_ANALYSIS_A4 varchar(9)   null,
	UC_ANALYSIS_A5_CDS int   null,
	UC_ANALYSIS_A5 varchar(9)   null,
	UC_ANALYSIS_B1_CDS int   null,
	UC_ANALYSIS_B1 varchar(9)   null,
	UC_ANALYSIS_B3_CDS int   null,
	UC_ANALYSIS_B3 varchar(9)   null,
	UC_ANALYSIS_B4_CDS int   null,
	UC_ANALYSIS_B4 varchar(9)   null,
	UC_ANALYSIS_B5_CDS int   null,
	UC_ANALYSIS_B5 varchar(9)   null,
	UC_ANALYSIS_B61_CDS int   null,
	UC_ANALYSIS_B61 varchar(9)   null,
	UC_ANALYSIS_C1_CDS int   null,
	UC_ANALYSIS_C1 varchar(9)   null,
	UC_ANALYSIS_C2_CDS int   null,
	UC_ANALYSIS_C2 varchar(9)   null,
	UC_ANALYSIS_C34_CDS int   null,
	UC_ANALYSIS_C34 varchar(9)   null,
	UC_ANALYSIS_C4_CDS int   null,
	UC_ANALYSIS_C4 varchar(9)   null,
	UC_ANALYSIS_C5_CDS int   null,
	UC_ANALYSIS_C5 varchar(9)   null,
	UC_ANALYSIS_C60_CDS int   null,
	UC_ANALYSIS_C60 varchar(9)   null,
	UC_ANALYSIS_C7_CDS int   null,
	UC_ANALYSIS_C7 varchar(9)   null,
	UC_ANALYSIS_D2_CDS int   null,
	UC_ANALYSIS_D2 varchar(9)   null,
	UC_ANALYSIS_D3_CDS int   null,
	UC_ANALYSIS_D3 varchar(9)   null,
	UC_ANALYSIS_D4_CDS int   null,
	UC_ANALYSIS_D4 varchar(9)   null,
	UC_ANALYSIS_D58_CDS int   null,
	UC_ANALYSIS_D58 varchar(9)   null,
	UC_ANALYSIS_D59_CDS int   null,
	UC_ANALYSIS_D59 varchar(9)   null,
	UC_ANALYSIS_E1_CDS int   null,
	UC_ANALYSIS_E1 varchar(9)   null,
	UC_ANALYSIS_E2_CDS int   null,
	UC_ANALYSIS_E2 varchar(9)   null,
	UC_ANALYSIS_E3_CDS int   null,
	UC_ANALYSIS_E3 varchar(9)   null,
	UC_ANALYSIS_F1_CDS int   null,
	UC_ANALYSIS_F1 varchar(9)   null,
	UC_ANALYSIS_F120_CDS int   null,
	UC_ANALYSIS_F120 varchar(9)   null,
	UC_ANALYSIS_F2_CDS int   null,
	UC_ANALYSIS_F2 varchar(9)   null,
	UC_ANALYSIS_F4_CDS int   null,
	UC_ANALYSIS_F4 varchar(9)   null,
	UC_ANALYSIS_F41_CDS int   null,
	UC_ANALYSIS_F41 varchar(9)   null,
	UC_ANALYSIS_Q11822_1_CDS int   null,
	UC_ANALYSIS_Q11822_1 varchar(9)   null,
	UC_DEMOGRAPHICS_DAYWEEK_CDS int   null,
	UC_DEMOGRAPHICS_DAYWEEK varchar(50)   null,
	PG_MD_SURVEY_ID varchar(256)   null,
	MD_ANALYSIS_A1_CDS int   null,
	MD_ANALYSIS_A1 varchar(9)   null,
	MD_ANALYSIS_A14_CDS int   null,
	MD_ANALYSIS_A14 varchar(9)   null,
	MD_ANALYSIS_CP1_CDS int   null,
	MD_ANALYSIS_CP1 varchar(9)   null,
	MD_ANALYSIS_CP10_CDS int   null,
	MD_ANALYSIS_CP10 varchar(9)   null,
	MD_ANALYSIS_CP2_CDS int   null,
	MD_ANALYSIS_CP2 varchar(9)   null,
	MD_ANALYSIS_CP3_CDS int   null,
	MD_ANALYSIS_CP3 varchar(9)   null,
	MD_ANALYSIS_CP4_CDS int   null,
	MD_ANALYSIS_CP4 varchar(9)   null,
	MD_ANALYSIS_CP5_CDS int   null,
	MD_ANALYSIS_CP5 varchar(9)   null,
	MD_ANALYSIS_CP6_CDS int   null,
	MD_ANALYSIS_CP6 varchar(9)   null,
	MD_ANALYSIS_CP7_CDS int   null,
	MD_ANALYSIS_CP7 varchar(9)   null,
	MD_ANALYSIS_CP8_CDS int   null,
	MD_ANALYSIS_CP8 varchar(9)   null,
	MD_ANALYSIS_CP9_CDS int   null,
	MD_ANALYSIS_CP9 varchar(9)   null,
	MD_ANALYSIS_I1_CDS int   null,
	MD_ANALYSIS_I1 varchar(9)   null,
	MD_ANALYSIS_I2_CDS int   null,
	MD_ANALYSIS_I2 varchar(9)   null,
	MD_ANALYSIS_I3_CDS int   null,
	MD_ANALYSIS_I3 varchar(9)   null,
	MD_ANALYSIS_I60_CDS int   null,
	MD_ANALYSIS_I60 varchar(9)   null,
	MD_ANALYSIS_N1_CDS int   null,
	MD_ANALYSIS_N1 varchar(9)   null,
	MD_ANALYSIS_N2_CDS int   null,
	MD_ANALYSIS_N2 varchar(9)   null,
	MD_ANALYSIS_O15_CDS int   null,
	MD_ANALYSIS_O15 varchar(9)   null,
	MD_ANALYSIS_O2_CDS int   null,
	MD_ANALYSIS_O2 varchar(9)   null,
	MD_ANALYSIS_O4_CDS int   null,
	MD_ANALYSIS_O4 varchar(9)   null,
	MD_ANALYSIS_Q11822_1_CDS int   null,
	MD_ANALYSIS_Q11822_1 varchar(9)   null,
	MD_ANALYSIS_V2_CDS int   null,
	MD_ANALYSIS_V2 varchar(9)   null,
	MD_ANALYSIS_V60_CDS int   null,
	MD_ANALYSIS_V60 varchar(9)   null,
	MD_ANALYSIS_V7_CDS int   null,
	MD_ANALYSIS_V7 varchar(9)   null,
	MD_CAHPS_ACO_01C varchar(256)   null,
	MD_CAHPS_ACO_01C_CDS int   null,
	MD_CAHPS_ACO_02C varchar(256)   null,
	MD_CAHPS_ACO_02C_CDS int   null,
	MD_CAHPS_ACO_03C varchar(256)   null,
	MD_CAHPS_ACO_03C_CDS int   null,
	MD_CAHPS_ACO_04C varchar(256)   null,
	MD_CAHPS_ACO_04C_CDS int   null,
	MD_CAHPS_ACO_05C varchar(256)   null,
	MD_CAHPS_ACO_05C_CDS int   null,
	MD_CAHPS_ACO_06C varchar(256)   null,
	MD_CAHPS_ACO_06C_CDS int   null,
	MD_CAHPS_ACO_07C varchar(256)   null,
	MD_CAHPS_ACO_07C_CDS int   null,
	MD_CAHPS_ACO_08C varchar(256)   null,
	MD_CAHPS_ACO_08C_CDS int   null,
	MD_CAHPS_ACO_09C varchar(256)   null,
	MD_CAHPS_ACO_09C_CDS int   null,
	MD_CAHPS_ACO_12C varchar(256)   null,
	MD_CAHPS_ACO_12C_CDS int   null,
	MD_CAHPS_ACO_13C varchar(256)   null,
	MD_CAHPS_ACO_13C_CDS int   null,
	MD_CAHPS_ACO_14C varchar(256)   null,
	MD_CAHPS_ACO_14C_CDS int   null,
	MD_CAHPS_ACO_38C varchar(256)   null,
	MD_CAHPS_ACO_38C_CDS int   null,
	MD_CAHPS_ACO_39C varchar(256)   null,
	MD_CAHPS_ACO_39C_CDS int   null,
	MD_CAHPS_CG_1 varchar(256)   null,
	MD_CAHPS_CG_1_CDS int   null,
	MD_CAHPS_CG_2CL varchar(256)   null,
	MD_CAHPS_CG_2CL_CDS int   null,
	MD_CAHPS_CG_18CL varchar(256)   null,
	MD_CAHPS_CG_18CL_CDS int   null,
	MD_CAHPS_CG_19CL varchar(256)   null,
	MD_CAHPS_CG_19CL_CDS int   null,
	MD_CAHPS_CG_20CL varchar(256)   null,
	MD_CAHPS_CG_20CL_CDS int   null,
	MD_CAHPS_CG_21CL varchar(256)   null,
	MD_CAHPS_CG_21CL_CDS int   null,
	MD_CAHPS_CG_22CL varchar(256)   null,
	MD_CAHPS_CG_22CL_CDS int   null,
	MD_CAHPS_CG_23CL varchar(256)   null,
	MD_CAHPS_CG_23CL_CDS int   null,
	MD_CAHPS_CG_24CL varchar(256)   null,
	MD_CAHPS_CG_24CL_CDS int   null,
	MD_CAHPS_CG_25CL varchar(256)   null,
	MD_CAHPS_CG_25CL_CDS int   null,
	MD_CAHPS_CG_26CL varchar(256)   null,
	MD_CAHPS_CG_26CL_CDS int   null,
	MD_CAHPS_CG_27CL varchar(256)   null,
	MD_CAHPS_CG_27CL_CDS int   null,
	MD_CAHPS_CG_28CL varchar(256)   null,
	MD_CAHPS_CG_28CL_CDS int   null,
	MD_CAHPS_CG_29CL varchar(256)   null,
	MD_CAHPS_CG_29CL_CDS int   null,
	MD_CAHPS_CG_34CL varchar(256)   null,
	MD_CAHPS_CG_34CL_CDS int   null,
	MD_CAHPS_CG_35CL varchar(256)   null,
	MD_CAHPS_CG_35CL_CDS int   null,
	MD_CAHPS_CG_36ACL varchar(256)   null,
	MD_CAHPS_CG_36ACL_CDS int   null,
	MD_CAHPS_CG_36BCL varchar(256)   null,
	MD_CAHPS_CG_36BCL_CDS int   null,
	MD_CAHPS_CG_36CCL varchar(256)   null,
	MD_CAHPS_CG_36CCL_CDS int   null,
	MD_CAHPS_CG_36DCL varchar(256)   null,
	MD_CAHPS_CG_36DCL_CDS int   null,
	MD_CAHPS_CG_36ECL varchar(256)   null,
	MD_CAHPS_CG_36ECL_CDS int   null,
	MD_CAHPS_CG_36FCL varchar(256)   null,
	MD_CAHPS_CG_36FCL_CDS int   null,
	MD_CAHPS_CG_37CL varchar(256)   null,
	MD_CAHPS_CG_37CL_CDS int   null,
	MD_CAHPS_CG_38A varchar(256)   null,
	MD_CAHPS_CG_38A_CDS int   null,
	MD_CAHPS_CG_38B varchar(256)   null,
	MD_CAHPS_CG_38B_CDS int   null,
	MD_CAHPS_CG_38C varchar(256)   null,
	MD_CAHPS_CG_38C_CDS int   null,
	MD_CAHPS_CG_38D varchar(256)   null,
	MD_CAHPS_CG_38D_CDS int   null,
	MD_CAHPS_CG_38E varchar(256)   null,
	MD_CAHPS_CG_38E_CDS int   null,
	MD_CAHPS_CG_57CL varchar(256)   null,
	MD_CAHPS_CG_57CL_CDS int   null,
	SURVEY_TYPE varchar(2)   null,
	COMBINED_COMFORT_CDS int   null,
	COMBINED_COMFORT varchar(9)   null,
	COMBINED_RATING_CDS int   null,
	COMBINED_RATING varchar(9)   null,
	COMBINED_TEAMWORK_CDS int   null,
	COMBINED_TEAMWORK varchar(9)   null,
	COMBINED_PRIVACY_CDS int   null,
	COMBINED_PRIVACY varchar(9)   null,
	COMBINED_SENSITVITY_CDS int   null,
	COMBINED_SENSITVITY varchar(9)   null,
	AS_ANALYSIS_C185_CDS int   null,
	AS_ANALYSIS_C186_CDS int   null,
	AS_ANALYSIS_C3_CDS int   null,
	AS_ANALYSIS_D2_CDS int   null,
	AS_ANALYSIS_D3_CDS int   null,
	AS_ANALYSIS_D98_CDS int   null,
	AS_ANALYSIS_D99_CDS int   null,
	AS_ANALYSIS_Q11822_1_CDS int   null,
	AS_CAHPS_OSC_1_CDS int   null,
	AS_CAHPS_OSC_10_CDS int   null,
	AS_CAHPS_OSC_11CL_CDS int   null,
	AS_CAHPS_OSC_12CL_CDS int   null,
	AS_CAHPS_OSC_13_CDS int   null,
	AS_CAHPS_OSC_14_CDS int   null,
	AS_CAHPS_OSC_15_CDS int   null,
	AS_CAHPS_OSC_16_CDS int   null,
	AS_CAHPS_OSC_17_CDS int   null,
	AS_CAHPS_OSC_18_CDS int   null,
	AS_CAHPS_OSC_19_CDS int   null,
	AS_CAHPS_OSC_2_CDS int   null,
	AS_CAHPS_OSC_20_CDS int   null,
	AS_CAHPS_OSC_21_CDS int   null,
	AS_CAHPS_OSC_22_CDS int   null,
	AS_CAHPS_OSC_23_CDS int   null,
	AS_CAHPS_OSC_24_CDS int   null,
	AS_CAHPS_OSC_3_CDS int   null,
	AS_CAHPS_OSC_4_CDS int   null,
	AS_CAHPS_OSC_5_CDS int   null,
	AS_CAHPS_OSC_6_CDS int   null,
	AS_CAHPS_OSC_7_CDS int   null,
	AS_CAHPS_OSC_8_CDS int   null,
	AS_CAHPS_OSC_9_CDS int   null,
	CONSTRAINT PK_OutpatientDim_ENCNT_SK PRIMARY KEY CLUSTERED (ENCNT_SK)
);


create table OutpatientFact(
	ENCNT_SK bigint  not null,
	PTNT_SK bigint   null,
	APPT_DT datetime   null,
	APPT_LNGTH int   null,
	APPT_LNGTH_LOG float   null,
	APPT_CRTN_INSTNT_DT datetime   null,
	CHCK_IN_INSTNT_DT datetime   null,
	CHCK_OUT_INSTNT_DT datetime   null,
	ARRVL_INSTNT_DT datetime   null,
	SCNDS_WTNG int   null,
	SCNDS_WTNG_LOG float   null,
	DEPT_SK bigint   null,
	RM_INSTNT_DT datetime   null,
	SCDS_IN_RM int   null,
	SCDS_IN_RM_LOG float   null,
	BDY_MSS_IDX numeric(18,2)   null,
	BDY_SRFC_AREA numeric(18,2)   null,
	SYSTLC int   null,
	DISTLC int   null,
	TMP_IN_FHRNHT float   null,
	PULSE int   null,
	RSPRTNS int   null,
	PRMY_DIAG_SK bigint   null,
	PRMY_VST_PRVDR_KEY bigint   null,
	SCND_VST_PRVDR_KEY bigint   null,
	THRD_VST_PRVDR_KEY bigint   null,
	FRTH_VST_PRVDR_KEY bigint   null,
	AGE_YRS_AT_ENCNT int   null,
	AGE_YRS_AT_ENCNT_LOG float   null,
	AGE_MNTHS_AT_ENCNT int   null,
	AGE_DYS_AT_ENCNT int   null,
	APPT_CRTN_INSTNT_TS_SK bigint   null,
	CHCK_IN_INSTNT_TS_SK bigint   null,
	CHCK_OUT_INSTNT_TS_SK bigint   null,
	ARRVL_INSTNT_TS_SK bigint   null,
	RM_INSTNT_TS_SK bigint   null,
	APPT_TS_SK bigint   null,
);


create table OutpatientFinancialClassDim(
	VST_FNNCL_CLSS_CDS int identity(1,1) not null,
	VST_FNNCL_CLSS_NM varchar(255)   null,
	CONSTRAINT PK_OutpatientFinancialClassDim_VST_FNNCL_CLSS_CDS PRIMARY KEY CLUSTERED (VST_FNNCL_CLSS_CDS)
);


create table PharmacyDim(
	PHRM_SK bigint identity(1,1) not null,
	SRC_PHRM_ID varchar(255)   null,
	PHRM_NM varchar(255)   null,
	SYS_TYPE_DESC varchar(255)   null,
	PHY_TYPE_CDS int   null,
	NPI_NUM varchar(50)   null,
	DEA_NUM varchar(50)   null,
	NCPDP_NUM varchar(50)   null,
	FCLT_SPRT_IND varchar(3)   null,
	RX_SUP_IND varchar(3)   null,
	CONSTRAINT PK_PharmacyDim_PHRM_SK PRIMARY KEY CLUSTERED (PHRM_SK)
);


create table PharmacyPhysicalTypeDim(
	PHY_TYPE_CDS int identity(1,1) not null,
	PHY_TYPE_DESC varchar(255)   null,
	CONSTRAINT PK_PharmacyPhysicalTypeDim_PHY_TYPE_CDS PRIMARY KEY CLUSTERED (PHY_TYPE_CDS)
);


create table ProcedureCategoryDim(
	PRCDR_CGY_ID int identity(1,1) not null,
	PRCDR_CGY_NM varchar(255)   null,
	CONSTRAINT PK_ProcedureCategoryDim_PRCDR_CGY_ID PRIMARY KEY CLUSTERED (PRCDR_CGY_ID)
);


create table ProcedureDim(
	PRCDR_CD_SK bigint identity(1,1) not null,
	PRCDR_CD varchar(50)   null,
	CD_TYPE int   null,
	PRCDR_CGY_ID int   null,
	REV_CD int   null,
	PRCDR_NM varchar(308)   null,
	SRC_PRCDR_CD_ID varchar(255)   null,
	CD_TYPE_NM varchar(255)   null,
	CONSTRAINT PK_ProcedureDim_PRCDR_CD_SK PRIMARY KEY CLUSTERED (PRCDR_CD_SK)
);


create table ProcedureOrderClassDim(
	ORDR_CLSS_CD int identity(1,1) not null,
	ORDR_CLSS_NM varchar(255)   null,
	CONSTRAINT PK_ProcedureOrderClassDim_ORDR_CLSS_CD PRIMARY KEY CLUSTERED (ORDR_CLSS_CD)
);


create table ProcedureOrderFact(
	PRCDR_ORDR_FACT_SK bigint  not null,
	ENCNT_SK bigint   null,
	PTNT_SK bigint   null,
	PRCDR_CD_SK bigint   null,
	ORDRD_BY_USR_SK bigint   null,
	ORDRD_BY_PROVDR_SK bigint   null,
	AUTH_BY_PROVDR_SK bigint   null,
	ORDRD_DT datetime   null,
	ORDR_TYP_CD int   null,
	ORDR_CLSS_CD int   null,
	ORDR_MODE_CD int   null,
	ORDR_SRC_CD int   null,
	ORDR_STS_CD int   null,
	ORDR_PRTY_CD int   null,
	STNDNG_STS_CD varchar(1)   null,
	ORDR_SET_CD bigint   null,
	CPOE_IND int   null,
	REQR_COSIG_IND int   null,
	COSIG_IND int   null,
	VRBL_SGN_IND int   null,
	ORDRD_TS_SK bigint   null,
);


create table ProcedureOrderModeDim(
	ORDR_MODE_CD int identity(1,1) not null,
	ORDR_MODE_NM varchar(255)   null,
	CONSTRAINT PK_ProcedureOrderModeDim_ORDR_MODE_CD PRIMARY KEY CLUSTERED (ORDR_MODE_CD)
);


create table ProcedureOrderPriorityDim(
	ORDR_PRTY_CD int identity(1,1) not null,
	ORDR_PRTY_NM varchar(255)   null,
	CONSTRAINT PK_ProcedureOrderPriorityDim_ORDR_PRTY_CD PRIMARY KEY CLUSTERED (ORDR_PRTY_CD)
);


create table ProcedureOrderSetDm(
	ORDR_SET_CD bigint identity(1,1) not null,
	ORDR_SET_NM varchar(255)   null,
	CONSTRAINT PK_ProcedureOrderSetDm_ORDR_SET_CD PRIMARY KEY CLUSTERED (ORDR_SET_CD)
);


create table ProcedureOrderSourceDim(
	ORDR_SRC_CD int identity(1,1) not null,
	ORDR_SRC_NM varchar(255)   null,
	CONSTRAINT PK_ProcedureOrderSourceDim_ORDR_SRC_CD PRIMARY KEY CLUSTERED (ORDR_SRC_CD)
);


create table ProcedureOrderStandingStatusDim(
	STNDNG_STS_CD varchar(1)  not null,
	STNDNG_STS_NM varchar(255)   null,
	CONSTRAINT PK_ProcedureOrderStandingStatusDim_STNDNG_STS_CD PRIMARY KEY CLUSTERED (STNDNG_STS_CD)
);


create table ProcedureOrderStatusDim(
	ORDR_STS_CD int identity(1,1) not null,
	ORDR_STS_NM varchar(255)   null,
	CONSTRAINT PK_ProcedureOrderStatusDim_ORDR_STS_CD PRIMARY KEY CLUSTERED (ORDR_STS_CD)
);


create table ProcedureOrderTypeDim(
	ORDR_TYP_CD int identity(1,1) not null,
	ORDR_TYP_NM varchar(255)   null,
	CONSTRAINT PK_ProcedureOrderTypeDim_ORDR_TYP_CD PRIMARY KEY CLUSTERED (ORDR_TYP_CD)
);


create table ProcedureRevenueCodeDim(
	REV_CD int identity(1,1) not null,
	REV_CD_NM varchar(255)   null,
	CONSTRAINT PK_ProcedureRevenueCodeDim_REV_CD PRIMARY KEY CLUSTERED (REV_CD)
);


create table ProcedureTypeDim(
	CD_TYPE int identity(1,1) not null,
	CD_TYPE_NM varchar(255)   null,
	CONSTRAINT PK_ProcedureTypeDim_CD_TYPE PRIMARY KEY CLUSTERED (CD_TYPE)
);


create table ProviderAffiliationDim(
	INTN_EXT_CDS int identity(1,1) not null,
	INTN_EXT_DESC varchar(254)   null,
	CONSTRAINT PK_ProviderAffiliationDim_INTN_EXT_CDS PRIMARY KEY CLUSTERED (INTN_EXT_CDS)
);


create table ProviderClinicianTitleDim(
	CLNC_TITL_CDS varchar(80)  not null,
	CLNC_TITL_DESC varchar(254)   null,
	CONSTRAINT PK_ProviderClinicianTitleDim_CLNC_TITL_CDS PRIMARY KEY CLUSTERED (CLNC_TITL_CDS)
);


create table ProviderDim(
	PROVDR_SK bigint identity(1,1) not null,
	PROVDR_NM_ID varchar(278)   null,
	PROVDR_TYPE_CDS int   null,
	PRMY_SPCLY_CDS int   null,
	PRMY_DEPT_CDS int   null,
	NPI bigint   null,
	DEA_NUM varchar(50)   null,
	UPIN varchar(20)   null,
	CLNC_TITL_CDS varchar(80)   null,
	MU_FLD_OF_PRACT_CDS int   null,
	RPTNG_STRC_CDS int   null,
	INTN_EXT_CDS int   null,
	RSDNT_IND varchar(3)   null,
	HSPTLST_IND varchar(3)   null,
	LDAP_USR varchar(50)   null,
	PROVDR_ACTV_IND varchar(3)   null,
	PRMRY_DEPT_SK bigint   null,
	Section_CDS int   null,
	Section_Desc varchar(100)   null,
	PROVDR_TYPE_DESC varchar(254)   null,
	PRMY_SPCLY_DESC varchar(254)   null,
	PRMY_DEPT_NM varchar(254)   null,
	CLNC_TITL_DESC varchar(254)   null,
	MU_FLD_OF_PRACT_DESC varchar(254)   null,
	RPTNG_STRC_DESC varchar(254)   null,
	INTN_EXT_DESC varchar(254)   null,
	CONSTRAINT PK_ProviderDim_PROVDR_SK PRIMARY KEY CLUSTERED (PROVDR_SK)
);


create table ProviderFieldOfPracticeDim(
	MU_FLD_OF_PRACT_CDS int identity(1,1) not null,
	MU_FLD_OF_PRACT_DESC varchar(254)   null,
	CONSTRAINT PK_ProviderFieldOfPracticeDim_MU_FLD_OF_PRACT_CDS PRIMARY KEY CLUSTERED (MU_FLD_OF_PRACT_CDS)
);


create table ProviderInternalExternalDim(
	INTN_EXT_CDS int identity(1,1) not null,
	INTN_EXT_DESC varchar(254)   null,
	CONSTRAINT PK_ProviderInternalExternalDim_INTN_EXT_CDS PRIMARY KEY CLUSTERED (INTN_EXT_CDS)
);


create table ProviderPrimaryDepartmentDim(
	PRMY_DEPT_CDS int identity(1,1) not null,
	PRMY_DEPT_NM varchar(254)   null,
	CONSTRAINT PK_ProviderPrimaryDepartmentDim_PRMY_DEPT_CDS PRIMARY KEY CLUSTERED (PRMY_DEPT_CDS)
);


create table ProviderPrimarySpecialtyDim(
	PRMY_SPCLY_CDS int identity(1,1) not null,
	PRMY_SPCLY_DESC varchar(254)   null,
	CONSTRAINT PK_ProviderPrimarySpecialtyDim_PRMY_SPCLY_CDS PRIMARY KEY CLUSTERED (PRMY_SPCLY_CDS)
);


create table ProviderReportingStructureDim(
	RPTNG_STRC_CDS int identity(1,1) not null,
	RPTNG_STRC_DESC varchar(254)   null,
	CONSTRAINT PK_ProviderReportingStructureDim_RPTNG_STRC_CDS PRIMARY KEY CLUSTERED (RPTNG_STRC_CDS)
);


create table ProviderTypeDim(
	PROVDR_TYPE_CDS int identity(1,1) not null,
	PROVDR_TYPE_DESC varchar(254)   null,
	CONSTRAINT PK_ProviderTypeDim_PROVDR_TYPE_CDS PRIMARY KEY CLUSTERED (PROVDR_TYPE_CDS)
);


create table QualityMeasureSourceDim(
	Source_ID int identity(1,1) not null,
	Source_Name varchar(4000)   null,
	CONSTRAINT PK_QualityMeasureSourceDim_Source_ID PRIMARY KEY CLUSTERED (Source_ID)
);


create table SugicalProcedureEventWoundClassDim(
	WND_CLASS_CDS int identity(1,1) not null,
	WND_CLASS_DESC varchar(255)   null,
	CONSTRAINT PK_SugicalProcedureEventWoundClassDim_WND_CLASS_CDS PRIMARY KEY CLUSTERED (WND_CLASS_CDS)
);


create table SurgicalCaseClassDim(
	CL_CDS int identity(1,1) not null,
	CL_DESC varchar(254)   null,
	CONSTRAINT PK_SurgicalCaseClassDim_CL_CDS PRIMARY KEY CLUSTERED (CL_CDS)
);


create table SurgicalCaseDim(
	CASE_SK bigint identity(1,1) not null,
	PRMY_SRVC_CDS int   null,
	PRCDR_LEVL_CDS int   null,
	CL_CDS int   null,
	SRG_PTNT_CLASS_CDS int   null,
	PRMY_ANSTH_TYPE_CDS int   null,
	RSN_NOT_PRFRM_CDS int   null,
	CONSTRAINT PK_SurgicalCaseDim_CASE_SK PRIMARY KEY CLUSTERED (CASE_SK)
);


create table SurgicalCaseFact(
	SRGCL_CASE_FACT_SK bigint  not null,
	CASE_SK bigint   null,
	PTNT_SK bigint   null,
	PRMY_PROVDR_SK bigint   null,
	ANSTHGIST_PROVDR_SK bigint   null,
	PRMY_PRCDR_CD_SK bigint   null,
	DEPT_SK bigint   null,
	DIAG_CD_SK int   null,
	HSPTL_ENCNT_SK bigint   null,
	SRG_ENCNT_SK bigint   null,
	SRG_DT datetime   null,
	CASE_RQST_DT datetime   null,
	CASE_RQST_TM_SK bigint   null,
	SCHED_SETUP_STRT_DT datetime   null,
	SCHED_SETUP_STRT_TM_SK bigint   null,
	SCHED_IN_RM_DT datetime   null,
	SCHED_IN_RM_TM_SK bigint   null,
	SCHED_OUT_OF_RM_DT datetime   null,
	SCHED_OUT_OF_RM_TM_SK bigint   null,
	SCHED_CLNUP_CMPLT_DT datetime   null,
	SCHED_CLNUP_CMPLT_TM_SK bigint   null,
	PTNT_IN_FCLT_DT datetime   null,
	PTNT_IN_FCLT_TM_SK bigint   null,
	PTNT_IN_PRE_PRCDR_DT datetime   null,
	PTNT_IN_PRE_PRCDR_TM_SK bigint   null,
	RM_SETUP_STRT_DT datetime   null,
	RM_SETUP_STRT_TM_SK bigint   null,
	RM_RDY_DT datetime   null,
	RM_RDY_TM_SK bigint   null,
	ANSTH_STRT_DT datetime   null,
	ANSTH_STRT_TM_SK bigint   null,
	PRE_PRCDR_CMPLT_DT datetime   null,
	PRE_PRCDR_CMPLT_TM_SK bigint   null,
	PTNT_IN_RM_DT datetime   null,
	PTNT_IN_RM_TM_SK bigint   null,
	ANSTH_RDY_DT datetime   null,
	ANSTH_RDY_TM_SK bigint   null,
	PRCDR_STRT_DT datetime   null,
	PRCDR_STRT_TM_SK bigint   null,
	PRCDR_CMPLT_DT datetime   null,
	PRCDR_CMPLT_TM_SK bigint   null,
	PTNT_OUT_OF_RM_DT datetime   null,
	PTNT_OUT_OF_RM_TM_SK bigint   null,
	RM_CLNUP_STRT_DT datetime   null,
	RM_CLNUP_STRT_TM_SK bigint   null,
	RM_CLNUP_CMPLT_DT datetime   null,
	RM_CLNUP_CMPLT_TM_SK bigint   null,
	PTNT_IN_PACU_DT datetime   null,
	PTNT_IN_PACU_TM_SK bigint   null,
	ANSTH_STOP_DT datetime   null,
	ANSTH_STOP_TM_SK bigint   null,
	PACU_CARE_CMPLT_DT datetime   null,
	PACU_CARE_CMPLT_TM_SK bigint   null,
	PTNT_OUT_OF_PACU_DT datetime   null,
	PTNT_OUT_OF_PACU_TM_SK bigint   null,
	PTNT_POST_OP_DT datetime   null,
	PTNT_POST_OP_TM_SK bigint   null,
	POST_OP_CARE_CMPLT_DT datetime   null,
	POST_OP_CARE_CMPLT_TM_SK bigint   null,
	PTNT_OUT_OF_POST_OP_DT datetime   null,
	PTNT_OUT_OF_POST_OP_TM_SK bigint   null,
	CNCL_IND int   null,
	ADD_ON_IND int   null,
	CNFD_IND int   null,
);


create table SurgicalCasePatientClassDim(
	SRG_PTNT_CLASS_CDS int identity(1,1) not null,
	SRG_PTNT_CLASS_DESC varchar(254)   null,
	CONSTRAINT PK_SurgicalCasePatientClassDim_SRG_PTNT_CLASS_CDS PRIMARY KEY CLUSTERED (SRG_PTNT_CLASS_CDS)
);


create table SurgicalCasePrimaryAnesthesiaTypeDim(
	PRMY_ANSTH_TYPE_CDS int identity(1,1) not null,
	PRMY_ANSTH_TYPE_DESC varchar(254)   null,
	CONSTRAINT PK_SurgicalCasePrimaryAnesthesiaTypeDim_PRMY_ANSTH_TYPE_CDS PRIMARY KEY CLUSTERED (PRMY_ANSTH_TYPE_CDS)
);


create table SurgicalCasePrimaryServiceDim(
	PRMY_SRVC_CDS int identity(1,1) not null,
	PRMY_SRVC_DESC varchar(254)   null,
	CONSTRAINT PK_SurgicalCasePrimaryServiceDim_PRMY_SRVC_CDS PRIMARY KEY CLUSTERED (PRMY_SRVC_CDS)
);


create table SurgicalCaseProcedureLevelDim(
	PRCDR_LEVL_CDS int identity(1,1) not null,
	PRCDR_LEVL_DESC varchar(254)   null,
	CONSTRAINT PK_SurgicalCaseProcedureLevelDim_PRCDR_LEVL_CDS PRIMARY KEY CLUSTERED (PRCDR_LEVL_CDS)
);


create table SurgicalCaseReasonNotPerformedDim(
	RSN_NOT_PRFRM_CDS int identity(1,1) not null,
	RSN_NOT_PRFRM_DESC varchar(254)   null,
	CONSTRAINT PK_SurgicalCaseReasonNotPerformedDim_RSN_NOT_PRFRM_CDS PRIMARY KEY CLUSTERED (RSN_NOT_PRFRM_CDS)
);


create table SurgicalProcedureEventAnesthesiaTypeDim(
	ANSTH_TYPE_CDS int identity(1,1) not null,
	ANSTH_TYPE_DESC varchar(255)   null,
	CONSTRAINT PK_SurgicalProcedureEventAnesthesiaTypeDim_ANSTH_TYPE_CDS PRIMARY KEY CLUSTERED (ANSTH_TYPE_CDS)
);


create table SurgicalProcedureEventFact(
	SRG_PRCDR_EV_FACT_SK bigint  not null,
	PTNT_SK bigint   null,
	CASE_SK bigint   null,
	PRCDR_CD_SK bigint   null,
	PRMY_PROVDR_SURGEON_SK bigint   null,
	SCND_PROVDR_SURGEON_SK bigint   null,
	THRD_PROVDR_SURGEON_SK bigint   null,
	SRG_DT datetime   null,
	HSPTL_ENCNT_SK bigint   null,
	SRG_ENCNT_SK bigint   null,
	DEPT_SK int   null,
	SRVC_CDS int   null,
	PRCDR_SITE_CDS int   null,
	LTRLTY_CDS int   null,
	ANSTH_TYPE_CDS int   null,
	WND_CLASS_CDS int   null,
	SCHED_IND int   null,
	PRFRM_IND int   null,
	PSSBL_IND int   null,
);


create table SurgicalProcedureEventLateralityDim(
	LTRLTY_CDS int identity(1,1) not null,
	LTRLTY_DESC varchar(255)   null,
	CONSTRAINT PK_SurgicalProcedureEventLateralityDim_LTRLTY_CDS PRIMARY KEY CLUSTERED (LTRLTY_CDS)
);


create table SurgicalProcedureEventProcedureSiteDim(
	PRCDR_SITE_CDS int identity(1,1) not null,
	PRCDR_SITE_DESC varchar(255)   null,
	CONSTRAINT PK_SurgicalProcedureEventProcedureSiteDim_PRCDR_SITE_CDS PRIMARY KEY CLUSTERED (PRCDR_SITE_CDS)
);


create table SurgicalProcedureEventServiceDim(
	SRVC_CDS int identity(1,1) not null,
	SRVC_DESC varchar(255)   null,
	CONSTRAINT PK_SurgicalProcedureEventServiceDim_SRVC_CDS PRIMARY KEY CLUSTERED (SRVC_CDS)
);


create table SurgicalSupplyDim(
	SPPLY_SK bigint identity(1,1) not null,
	SPPLY_NM varchar(513)   null,
	SPPLY_TYPE_CDS varchar(81)   null,
	MNFCTR_CDS varchar(20)   null,
	MNFCTR_CTLG_NBR varchar(255)   null,
	VND_CDS int   null,
	VND_CTLG_NBR varchar(255)   null,
	IMPLNT_IND varchar(3)   null,
	CONSTRAINT PK_SurgicalSupplyDim_SPPLY_SK PRIMARY KEY CLUSTERED (SPPLY_SK)
);


create table SurgicalSupplyManufacturerDim(
	MNFCTR_CDS varchar(20)  not null,
	MNFCTR_DESC varchar(254)   null,
	CONSTRAINT PK_SurgicalSupplyManufacturerDim_MNFCTR_CDS PRIMARY KEY CLUSTERED (MNFCTR_CDS)
);


create table SurgicalSupplyUseFact(
	SRGCL_SPPLY_USE_FACT_SK bigint  not null,
	SRC_SRGCL_SPPLY_ID varchar(254)   null,
	PTNT_SK bigint   null,
	CASE_SK bigint   null,
	SPPLY_SK bigint   null,
	DEPT_SK bigint   null,
	SRG_DT datetime   null,
	HSPTL_ENCNT_SK bigint   null,
	SRG_ENCNT_SK bigint   null,
	PRMY_PROVDR_SK bigint   null,
	PRCDR_CD_SK bigint   null,
	LOG_STS_CDS int   null,
	OR_SRVC_CDS int   null,
	NBR_USE int   null,
	NBR_WSTD int   null,
	NBR_OPEN int   null,
	NBR_PRN int   null,
	UNT_COST numeric(18,2)   null,
	CRGBL_IND int   null,
);


create table SurgicalSupplyUseLogStatusDim(
	LOG_STS_CDS int identity(1,1) not null,
	LOG_STS_DESC varchar(255)   null,
	CONSTRAINT PK_SurgicalSupplyUseLogStatusDim_LOG_STS_CDS PRIMARY KEY CLUSTERED (LOG_STS_CDS)
);


create table SurgicalSupplyUseORServiceDim(
	OR_SRVC_CDS int identity(1,1) not null,
	OR_SRVC_DESC varchar(255)   null,
	CONSTRAINT PK_SurgicalSupplyUseORServiceDim_OR_SRVC_CDS PRIMARY KEY CLUSTERED (OR_SRVC_CDS)
);


create table SurgicalSupplyVendorDim(
	VND_CDS int identity(1,1) not null,
	VND_DESC varchar(254)   null,
	CONSTRAINT PK_SurgicalSupplyVendorDim_VND_CDS PRIMARY KEY CLUSTERED (VND_CDS)
);


create table UserDim(
	USR_SK bigint identity(1,1) not null,
	USER_NAME varchar(553)   null,
	SRC_TYPE varchar(50)   null,
	LDAP_USR varchar(50)   null,
	SEX_CDS int   null,
	CONSTRAINT PK_UserDim_USR_SK PRIMARY KEY CLUSTERED (USR_SK)
);


create table UserGenderDim(
	SEX_CDS int identity(1,1) not null,
	SEX_DESC varchar(254)   null,
	CONSTRAINT PK_UserGenderDim_SEX_CDS PRIMARY KEY CLUSTERED (SEX_CDS)
);


create table dbo_DIAG_BRIDGE(
	DIAG_CD_SK int identity(1,1) not null,
	DIAG_CD_DESC varchar(255)   null,
	MSTR_DIAG_CD varchar(50)   null,
	ICD9_CD varchar(50)   null,
	ICD9_CD_LST varchar(255)   null,
	ICD10_CD varchar(50)   null,
	ICD10_CD_LST varchar(255)   null,
	DIAG_HIR_SK int   null,
	CONSTRAINT PK_dbo_DIAG_BRIDGE_DIAG_CD_SK PRIMARY KEY CLUSTERED (DIAG_CD_SK)
);


create table dbo_DIAG_HYR_DIM(
	DIAG_CLS_DESC varchar(255)   null,
	DIAG_PRN_SK int   null,
	DIAG_HIR_SK int identity(1,1) not null,
	CONSTRAINT PK_dbo_DIAG_HYR_DIM_DIAG_HIR_SK PRIMARY KEY CLUSTERED (DIAG_HIR_SK)
);


create table qps_DM_Quality(
	Data_ID int  not null,
	LO_CDS int   null,
	SRC_DEPT_ID varchar(4000)   null,
	Truven_Indicator varchar(4000)   null,
	Source_Measure_Title varchar(4000)   null,
	Frequency varchar(4000)   null,
	Date datetime   null,
	Result numeric(18,2)   null,
	Source_Source_Measure_ID int   null,
);


create table qps_Dim_Measure(
	Measure_Dim_ID int identity(1,1) not null,
	Source_ID int   null,
	Source_Measure_ID int   null,
	Is_Active bit   null,
	Measure varchar(4000)   null,
	CONSTRAINT PK_qps_Dim_Measure_Measure_Dim_ID PRIMARY KEY CLUSTERED (Measure_Dim_ID)
);


create table qps_Dim_Measure_Group(
	Measure_Group_Dim_ID int  not null,
	Measure_Group_ID varchar(4000)   null,
	Glossary_Link varchar(4000)   null,
);


create table qps_Dim_Program(
	Start_Date datetime   null,
	End_Date datetime   null,
	Is_Active bit   null,
	Program_ID int  not null,
	Program_Name varchar(4000)   null,
);






-- add foreign keys
ALTER TABLE CensusMeasureFact ADD CONSTRAINT [CensusMeasureFact-CensusGeographicalAreaDim] FOREIGN KEY (GEO_AREA_SK) REFERENCES CensusGeographicalAreaDim (GEO_AREA_SK);
ALTER TABLE CensusMeasureFact ADD CONSTRAINT [CensusMeasureFact-CensusMeasureTypeDim] FOREIGN KEY (MSR_TYPE_SK) REFERENCES CensusMeasureTypeDim (MSR_TYPE_SK);
ALTER TABLE CensusMeasureFact ADD CONSTRAINT [CensusMeasureFact-CensusSourceDim] FOREIGN KEY (SRC_SK) REFERENCES CensusSourceDim (SRC_SK);
ALTER TABLE LDW_DIAG_FACT ADD CONSTRAINT [DIAG_FACT-DepartmentDim] FOREIGN KEY (DEPT_SK) REFERENCES DepartmentDim (DEPT_SK);
ALTER TABLE LDW_DIAG_FACT ADD CONSTRAINT [DIAG_FACT-DiagnosisBridge] FOREIGN KEY (DIAG_CD_SK) REFERENCES dbo_DIAG_BRIDGE (DIAG_CD_SK);
ALTER TABLE LDW_DIAG_FACT ADD CONSTRAINT [DIAG_FACT-EncounterDim] FOREIGN KEY (ENCNT_SK) REFERENCES DW_ENCNT_DIM (ENCNT_SK);
ALTER TABLE LDW_DIAG_FACT ADD CONSTRAINT [DIAG_FACT-PatientDim] FOREIGN KEY (PTNT_SK) REFERENCES LDW_PTNT_DIM (PTNT_SK);
ALTER TABLE DRGFact ADD CONSTRAINT [DRGFact-DRGDim] FOREIGN KEY (DRG_CD_SK) REFERENCES DRGDim (DRG_CD_SK);
ALTER TABLE DRGFact ADD CONSTRAINT [DRGFact-DRGSeqDim] FOREIGN KEY (PRTY_SQNC) REFERENCES DRGSeqDim (PRTY_SQNC);
ALTER TABLE DRGFact ADD CONSTRAINT [DRGFact-DRGTypeDim] FOREIGN KEY (DRG_TYPE_CD) REFERENCES DRGTypeDim (DRG_TYPE_CD);
ALTER TABLE DRGFact ADD CONSTRAINT [DRGFact-EncounterDim] FOREIGN KEY (ENCNT_SK) REFERENCES DW_ENCNT_DIM (ENCNT_SK);
ALTER TABLE DRGFact ADD CONSTRAINT [DRGFact-PatientDim] FOREIGN KEY (PTNT_SK) REFERENCES LDW_PTNT_DIM (PTNT_SK);
ALTER TABLE dbo_DIAG_BRIDGE ADD CONSTRAINT [DiagnosisBridge-DiagnosisHierarchy] FOREIGN KEY (DIAG_HIR_SK) REFERENCES dbo_DIAG_HYR_DIM (DIAG_HIR_SK);
ALTER TABLE LDW_DIAG_FACT ADD CONSTRAINT [DiagnosisFact-BinaryDim] FOREIGN KEY (CHRNC_IND) REFERENCES BinaryDim (Binary_CD);
ALTER TABLE LDW_DIAG_FACT ADD CONSTRAINT [DiagnosisFact-BinaryDim1] FOREIGN KEY (PRMY_DIAG_IND) REFERENCES BinaryDim (Binary_CD);
ALTER TABLE LDW_DIAG_FACT ADD CONSTRAINT [DiagnosisFact-BinaryDim2] FOREIGN KEY (SCND_DIAG_IND) REFERENCES BinaryDim (Binary_CD);
ALTER TABLE LDW_DIAG_FACT ADD CONSTRAINT [DiagnosisFact-BinaryDim3] FOREIGN KEY (ED_DIAG_IND) REFERENCES BinaryDim (Binary_CD);
ALTER TABLE LDW_DIAG_FACT ADD CONSTRAINT [DiagnosisFact-DateDim] FOREIGN KEY (DIAG_STRT_DT) REFERENCES DW_CLNDR_DIM (CLNDR_DT);
ALTER TABLE LDW_DIAG_FACT ADD CONSTRAINT [DiagnosisFact-DateDim1] FOREIGN KEY (DIAG_END_DT) REFERENCES DW_CLNDR_DIM (CLNDR_DT);
ALTER TABLE LDW_DIAG_FACT ADD CONSTRAINT [DiagnosisFact-DiagnosisPresentOnAdmitDim] FOREIGN KEY (PRSNT_ON_ADMT_CD) REFERENCES DiagnosisPresentOnAdmit (PRSNT_ON_ADMT_CD);
ALTER TABLE LDW_DIAG_FACT ADD CONSTRAINT [DiagnosisFact-DiagnosisSourceDim] FOREIGN KEY (SRC_TYPE) REFERENCES DiagnosisSourceDim (SRC_TYPE);
ALTER TABLE LDW_DIAG_FACT ADD CONSTRAINT [DiagnosisFact-TimeDim] FOREIGN KEY (DIAG_STRT_TS_SK) REFERENCES DW_TM_OF_DY_DIM (TM_OF_DY_SK);
ALTER TABLE LDW_DIAG_FACT ADD CONSTRAINT [DiagnosisFact-TimeDim1] FOREIGN KEY (DIAG_END_TS_SK) REFERENCES DW_TM_OF_DY_DIM (TM_OF_DY_SK);
ALTER TABLE dbo_DIAG_HYR_DIM ADD CONSTRAINT [DiagnosisHierarchy-DiagnosisHierarchy] FOREIGN KEY (DIAG_PRN_SK) REFERENCES dbo_DIAG_HYR_DIM (DIAG_HIR_SK);
ALTER TABLE EDVisitDim ADD CONSTRAINT [EDVisitDim-EDVisitAcuityLevelDim] FOREIGN KEY (ACTY_LVL_CDS) REFERENCES EDVisitActivityLevelDim (ACTY_LVL_CDS);
ALTER TABLE EDVisitDim ADD CONSTRAINT [EDVisitDim-EDVisitDispositionDim] FOREIGN KEY (ED_DSPSTN_CDS) REFERENCES EDVisitDispositionDim (ED_DSPSTN_CDS);
ALTER TABLE EDVisitDim ADD CONSTRAINT [EDVisitDim-EDVisitFinancialClass] FOREIGN KEY (VST_FNNCL_CLSS_CDS) REFERENCES EDVisitFinancialClass (VST_FNNCL_CLSS_CDS);
ALTER TABLE EDVisitDim ADD CONSTRAINT [EDVisitDim-EDVisitMeansOfArrivalDim] FOREIGN KEY (MEANS_ARRVL_CDS) REFERENCES EDVisitMeansOfArrivalDim (MEANS_ARRVL_CDS);
ALTER TABLE EDVisitDim ADD CONSTRAINT [EDVisitDim-EncounterDim] FOREIGN KEY (ENCNT_SK) REFERENCES DW_ENCNT_DIM (ENCNT_SK);
ALTER TABLE EDVisitDim ADD CONSTRAINT [EDVisitDim-PatientDim] FOREIGN KEY (PTNT_SK) REFERENCES LDW_PTNT_DIM (PTNT_SK);
ALTER TABLE EDVisitFact ADD CONSTRAINT [EDVisitFact-DateDim] FOREIGN KEY (ARRVL_DT) REFERENCES DW_CLNDR_DIM (CLNDR_DT);
ALTER TABLE EDVisitFact ADD CONSTRAINT [EDVisitFact-DateDim1] FOREIGN KEY (HSP_DSCRG_DT) REFERENCES DW_CLNDR_DIM (CLNDR_DT);
ALTER TABLE EDVisitFact ADD CONSTRAINT [EDVisitFact-DateDim10] FOREIGN KEY (FRST_ATTND_DT) REFERENCES DW_CLNDR_DIM (CLNDR_DT);
ALTER TABLE EDVisitFact ADD CONSTRAINT [EDVisitFact-DateDim11] FOREIGN KEY (LAB_ORDRD_DT) REFERENCES DW_CLNDR_DIM (CLNDR_DT);
ALTER TABLE EDVisitFact ADD CONSTRAINT [EDVisitFact-DateDim12] FOREIGN KEY (LAB_CMPLTD_DT) REFERENCES DW_CLNDR_DIM (CLNDR_DT);
ALTER TABLE EDVisitFact ADD CONSTRAINT [EDVisitFact-DateDim13] FOREIGN KEY (LAB_PRVDR_RVW_DT) REFERENCES DW_CLNDR_DIM (CLNDR_DT);
ALTER TABLE EDVisitFact ADD CONSTRAINT [EDVisitFact-DateDim14] FOREIGN KEY (IMG_ORDRD_DT) REFERENCES DW_CLNDR_DIM (CLNDR_DT);
ALTER TABLE EDVisitFact ADD CONSTRAINT [EDVisitFact-DateDim15] FOREIGN KEY (IMG_TST_CMPLTD_DT) REFERENCES DW_CLNDR_DIM (CLNDR_DT);
ALTER TABLE EDVisitFact ADD CONSTRAINT [EDVisitFact-DateDim16] FOREIGN KEY (IMG_PRVDR_RVW_DT) REFERENCES DW_CLNDR_DIM (CLNDR_DT);
ALTER TABLE EDVisitFact ADD CONSTRAINT [EDVisitFact-DateDim17] FOREIGN KEY (BED_RQST_DT) REFERENCES DW_CLNDR_DIM (CLNDR_DT);
ALTER TABLE EDVisitFact ADD CONSTRAINT [EDVisitFact-DateDim2] FOREIGN KEY (ED_DSCRG_DT) REFERENCES DW_CLNDR_DIM (CLNDR_DT);
ALTER TABLE EDVisitFact ADD CONSTRAINT [EDVisitFact-DateDim3] FOREIGN KEY (DSPSTN_INSTNT_DT) REFERENCES DW_CLNDR_DIM (CLNDR_DT);
ALTER TABLE EDVisitFact ADD CONSTRAINT [EDVisitFact-DateDim4] FOREIGN KEY (FRST_NONED_DEPT_ARRVL_DT) REFERENCES DW_CLNDR_DIM (CLNDR_DT);
ALTER TABLE EDVisitFact ADD CONSTRAINT [EDVisitFact-DateDim5] FOREIGN KEY (AVS_PRNT_INSTNT_DT) REFERENCES DW_CLNDR_DIM (CLNDR_DT);
ALTER TABLE EDVisitFact ADD CONSTRAINT [EDVisitFact-DateDim6] FOREIGN KEY (PAT_RMD_DT) REFERENCES DW_CLNDR_DIM (CLNDR_DT);
ALTER TABLE EDVisitFact ADD CONSTRAINT [EDVisitFact-DateDim7] FOREIGN KEY (REG_CMPLTD_DT) REFERENCES DW_CLNDR_DIM (CLNDR_DT);
ALTER TABLE EDVisitFact ADD CONSTRAINT [EDVisitFact-DateDim8] FOREIGN KEY (TRGE_START_DT) REFERENCES DW_CLNDR_DIM (CLNDR_DT);
ALTER TABLE EDVisitFact ADD CONSTRAINT [EDVisitFact-DateDim9] FOREIGN KEY (TRGE_CMPLTD_DT) REFERENCES DW_CLNDR_DIM (CLNDR_DT);
ALTER TABLE EDVisitFact ADD CONSTRAINT [EDVisitFact-DepartmentDim] FOREIGN KEY (FRST_NON_ED_DEPT_SK) REFERENCES DepartmentDim (DEPT_SK);
ALTER TABLE EDVisitFact ADD CONSTRAINT [EDVisitFact-DepartmentDim1] FOREIGN KEY (ADMT_DEPT_SK) REFERENCES DepartmentDim (DEPT_SK);
ALTER TABLE EDVisitFact ADD CONSTRAINT [EDVisitFact-EDVisitDim] FOREIGN KEY (EDPTNT_VST_SK) REFERENCES EDVisitDim (EDPTNT_VST_SK);
ALTER TABLE EDVisitFact ADD CONSTRAINT [EDVisitFact-EncounterDim] FOREIGN KEY (ENCNT_SK) REFERENCES DW_ENCNT_DIM (ENCNT_SK);
ALTER TABLE EDVisitFact ADD CONSTRAINT [EDVisitFact-PatientDim] FOREIGN KEY (PTNT_SK) REFERENCES LDW_PTNT_DIM (PTNT_SK);
ALTER TABLE EDVisitFact ADD CONSTRAINT [EDVisitFact-TimeDim] FOREIGN KEY (HSP_DSCRG_TS_SK) REFERENCES DW_TM_OF_DY_DIM (TM_OF_DY_SK);
ALTER TABLE EDVisitFact ADD CONSTRAINT [EDVisitFact-TimeDim1] FOREIGN KEY (ARRVL_TS_SK) REFERENCES DW_TM_OF_DY_DIM (TM_OF_DY_SK);
ALTER TABLE EDVisitFact ADD CONSTRAINT [EDVisitFact-TimeDim10] FOREIGN KEY (FRST_ATTND_TS_SK) REFERENCES DW_TM_OF_DY_DIM (TM_OF_DY_SK);
ALTER TABLE EDVisitFact ADD CONSTRAINT [EDVisitFact-TimeDim11] FOREIGN KEY (LAB_ORDRD_TS_SK) REFERENCES DW_TM_OF_DY_DIM (TM_OF_DY_SK);
ALTER TABLE EDVisitFact ADD CONSTRAINT [EDVisitFact-TimeDim12] FOREIGN KEY (LAB_CMPLTD_TS_SK) REFERENCES DW_TM_OF_DY_DIM (TM_OF_DY_SK);
ALTER TABLE EDVisitFact ADD CONSTRAINT [EDVisitFact-TimeDim123] FOREIGN KEY (IMG_TST_CMPLTD_TS_SK) REFERENCES DW_TM_OF_DY_DIM (TM_OF_DY_SK);
ALTER TABLE EDVisitFact ADD CONSTRAINT [EDVisitFact-TimeDim13] FOREIGN KEY (LAB_PRVDR_RVW_TS_SK) REFERENCES DW_TM_OF_DY_DIM (TM_OF_DY_SK);
ALTER TABLE EDVisitFact ADD CONSTRAINT [EDVisitFact-TimeDim14] FOREIGN KEY (IMG_ORDRD_TS_SK) REFERENCES DW_TM_OF_DY_DIM (TM_OF_DY_SK);
ALTER TABLE EDVisitFact ADD CONSTRAINT [EDVisitFact-TimeDim16] FOREIGN KEY (IMG_PRVDR_RVW_TS_SK) REFERENCES DW_TM_OF_DY_DIM (TM_OF_DY_SK);
ALTER TABLE EDVisitFact ADD CONSTRAINT [EDVisitFact-TimeDim17] FOREIGN KEY (BED_RQST_TS_SK) REFERENCES DW_TM_OF_DY_DIM (TM_OF_DY_SK);
ALTER TABLE EDVisitFact ADD CONSTRAINT [EDVisitFact-TimeDim2] FOREIGN KEY (ED_DSCRG_TS_SK) REFERENCES DW_TM_OF_DY_DIM (TM_OF_DY_SK);
ALTER TABLE EDVisitFact ADD CONSTRAINT [EDVisitFact-TimeDim3] FOREIGN KEY (DSPSTN_INSTNT_TS_SK) REFERENCES DW_TM_OF_DY_DIM (TM_OF_DY_SK);
ALTER TABLE EDVisitFact ADD CONSTRAINT [EDVisitFact-TimeDim4] FOREIGN KEY (FRST_NONED_DEPT_ARRVL_TS_SK) REFERENCES DW_TM_OF_DY_DIM (TM_OF_DY_SK);
ALTER TABLE EDVisitFact ADD CONSTRAINT [EDVisitFact-TimeDim5] FOREIGN KEY (AVS_PRNT_INSTNT_TS_SK) REFERENCES DW_TM_OF_DY_DIM (TM_OF_DY_SK);
ALTER TABLE EDVisitFact ADD CONSTRAINT [EDVisitFact-TimeDim6] FOREIGN KEY (PAT_RMD_TS_SK) REFERENCES DW_TM_OF_DY_DIM (TM_OF_DY_SK);
ALTER TABLE EDVisitFact ADD CONSTRAINT [EDVisitFact-TimeDim7] FOREIGN KEY (REG_CMPLTD_TS_SK) REFERENCES DW_TM_OF_DY_DIM (TM_OF_DY_SK);
ALTER TABLE EDVisitFact ADD CONSTRAINT [EDVisitFact-TimeDim8] FOREIGN KEY (TRGE_START_TS_SK) REFERENCES DW_TM_OF_DY_DIM (TM_OF_DY_SK);
ALTER TABLE EDVisitFact ADD CONSTRAINT [EDVisitFact-TimeDim9] FOREIGN KEY (TRGE_CMPLTD_TS_SK) REFERENCES DW_TM_OF_DY_DIM (TM_OF_DY_SK);
ALTER TABLE DW_ENCNT_FACT ADD CONSTRAINT [ENCNT_FACT-EncounterDim] FOREIGN KEY (ENCNT_SK) REFERENCES DW_ENCNT_DIM (ENCNT_SK);
ALTER TABLE DW_ENCNT_FACT ADD CONSTRAINT [ENCNT_FACT-PatientDim] FOREIGN KEY (PTNT_SK) REFERENCES LDW_PTNT_DIM (PTNT_SK);
ALTER TABLE DW_ENCNT_DIM ADD CONSTRAINT [EncounterDim-EncounterBillingClassDim] FOREIGN KEY (BILLING_CLASS_CDS) REFERENCES EncounterBillingClassDim (BILLING_CLASS_CDS);
ALTER TABLE DW_ENCNT_DIM ADD CONSTRAINT [EncounterDim-EncounterDepartmentDim] FOREIGN KEY (DEPT_CDS) REFERENCES EncounterDepartmentDim (DEPT_CDS);
ALTER TABLE DW_ENCNT_DIM ADD CONSTRAINT [EncounterDim-EncounterEncouterypeDim] FOREIGN KEY (ENCNT_TYPE_CDS) REFERENCES EncounterEncouterypeDim (ENCNT_TYPE_CDS);
ALTER TABLE DW_ENCNT_DIM ADD CONSTRAINT [EncounterDim-EncounterLevelofCareDim] FOREIGN KEY (LEVL_OF_CARE_CDS) REFERENCES EncounterLevelofCareDim (LEVL_OF_CARE_CDS);
ALTER TABLE DW_ENCNT_DIM ADD CONSTRAINT [EncounterDim-EncounterPatientStatusDim] FOREIGN KEY (PTNT_STS_CDS) REFERENCES EncounterPatientStatusDim (PTNT_STS_CDS);
ALTER TABLE DW_ENCNT_DIM ADD CONSTRAINT [EncounterDim-EncounterProductLineDim] FOREIGN KEY (PRD_LINE_CDS) REFERENCES EncounterProductLineDim (PRD_LINE_CDS);
ALTER TABLE DW_ENCNT_DIM ADD CONSTRAINT [EncounterDim-EncouterBaseClassDim] FOREIGN KEY (PTNT_BSE_CLSS_CDS) REFERENCES EncouterBaseClassDim (PTNT_BSE_CLSS_CDS);
ALTER TABLE DW_ENCNT_FACT ADD CONSTRAINT [EncounterFact-DateDim] FOREIGN KEY (ENCNT_DT) REFERENCES DW_CLNDR_DIM (CLNDR_DT);
ALTER TABLE DW_ENCNT_FACT ADD CONSTRAINT [EncounterFact-DepartmentDim] FOREIGN KEY (DEPT_SK) REFERENCES DepartmentDim (DEPT_SK);
ALTER TABLE InpatientDim ADD CONSTRAINT [InpatientDim-InpatientAdmitSourceDim] FOREIGN KEY (ADMT_SRC_CDS) REFERENCES InpatientAdmitSourceDim (ADMT_SRC_CDS);
ALTER TABLE InpatientDim ADD CONSTRAINT [InpatientDim-InpatientAdmitTypeDim] FOREIGN KEY (ADMT_TYPE_CDS) REFERENCES InpatientAdmitTypeDim (ADMT_TYPE_CDS);
ALTER TABLE InpatientDim ADD CONSTRAINT [InpatientDim-InpatientDischargeDestinationDim] FOREIGN KEY (DSCRG_DSTN_CDS) REFERENCES InpatientDischargeDestinationDim (DSCRG_DSTN_CDS);
ALTER TABLE InpatientDim ADD CONSTRAINT [InpatientDim-InpatientDischargeDispositionDim] FOREIGN KEY (DSCRG_DSPSTN_CDS) REFERENCES InpatientDischargeDispositionDim (DSCRG_DSPSTN_CDS);
ALTER TABLE InpatientDim ADD CONSTRAINT [InpatientDim-InpatientPatientClassDim] FOREIGN KEY (PTNT_CL_CDS) REFERENCES InpatientPatientClassDim (PTNT_CL_CDS);
ALTER TABLE InpatientFact ADD CONSTRAINT [InpatientFact-DateDim] FOREIGN KEY (INPTNT_APPT_MADE_DT) REFERENCES DW_CLNDR_DIM (CLNDR_DT);
ALTER TABLE InpatientFact ADD CONSTRAINT [InpatientFact-DateDim1] FOREIGN KEY (CLNC_INPTNT_ADMT_DT) REFERENCES DW_CLNDR_DIM (CLNDR_DT);
ALTER TABLE InpatientFact ADD CONSTRAINT [InpatientFact-DateDim2] FOREIGN KEY (HSPTL_ADMT_DT) REFERENCES DW_CLNDR_DIM (CLNDR_DT);
ALTER TABLE InpatientFact ADD CONSTRAINT [InpatientFact-DateDim3] FOREIGN KEY (HSPTL_DSCRG_DT) REFERENCES DW_CLNDR_DIM (CLNDR_DT);
ALTER TABLE InpatientFact ADD CONSTRAINT [InpatientFact-EncounterDim] FOREIGN KEY (ENCNT_SK) REFERENCES DW_ENCNT_DIM (ENCNT_SK);
ALTER TABLE InpatientFact ADD CONSTRAINT [InpatientFact-InpatientDim] FOREIGN KEY (INPTNT_VST_SK) REFERENCES InpatientDim (INPTNT_VST_SK);
ALTER TABLE InpatientFact ADD CONSTRAINT [InpatientFact-PatientDim] FOREIGN KEY (PTNT_SK) REFERENCES LDW_PTNT_DIM (PTNT_SK);
ALTER TABLE InpatientFact ADD CONSTRAINT [InpatientFact-ProviderDim] FOREIGN KEY (HSPTL_ADMT_PROVDR_SK) REFERENCES ProviderDim (PROVDR_SK);
ALTER TABLE InpatientFact ADD CONSTRAINT [InpatientFact-ProviderDim1] FOREIGN KEY (HSPTL_DSCRG_PROVDR_SK) REFERENCES ProviderDim (PROVDR_SK);
ALTER TABLE InpatientFact ADD CONSTRAINT [InpatientFact-TimeDim] FOREIGN KEY (HSPTL_ADMT_TS_SK) REFERENCES DW_TM_OF_DY_DIM (TM_OF_DY_SK);
ALTER TABLE InpatientFact ADD CONSTRAINT [InpatientFact-TimeDim1] FOREIGN KEY (HSPTL_DSCRG_TS_SK) REFERENCES DW_TM_OF_DY_DIM (TM_OF_DY_SK);
ALTER TABLE InpatientFact ADD CONSTRAINT [InpatientFact-TimeDim12] FOREIGN KEY (CLNC_INPTNT_ADMT_TS_SK) REFERENCES DW_TM_OF_DY_DIM (TM_OF_DY_SK);
ALTER TABLE LabComponentDim ADD CONSTRAINT [LabComponentDim-LabComponentSubstrateDim] FOREIGN KEY (CMPNT_SUBT_CDS) REFERENCES LabComponentSubstrateDim (CMPNT_SUBT_CDS);
ALTER TABLE LabComponentDim ADD CONSTRAINT [LabComponentDim-LabComponentTypeDim] FOREIGN KEY (CMPNT_TYPE_CDS) REFERENCES LabComponentTypeDim (CMPNT_TYPE_CDS);
ALTER TABLE LabComponentResultFact ADD CONSTRAINT [LabComponentResultFact-DateDim] FOREIGN KEY (ORDRD_DT) REFERENCES DW_CLNDR_DIM (CLNDR_DT);
ALTER TABLE LabComponentResultFact ADD CONSTRAINT [LabComponentResultFact-DateDim1] FOREIGN KEY (CLCT_DT) REFERENCES DW_CLNDR_DIM (CLNDR_DT);
ALTER TABLE LabComponentResultFact ADD CONSTRAINT [LabComponentResultFact-DateDim12] FOREIGN KEY (RSLT_DT) REFERENCES DW_CLNDR_DIM (CLNDR_DT);
ALTER TABLE LabComponentResultFact ADD CONSTRAINT [LabComponentResultFact-EncounterDim] FOREIGN KEY (ENCNT_SK) REFERENCES DW_ENCNT_DIM (ENCNT_SK);
ALTER TABLE LabComponentResultFact ADD CONSTRAINT [LabComponentResultFact-LabComponentDim] FOREIGN KEY (LAB_CMPNT_SK) REFERENCES LabComponentDim (CMPNT_SK);
ALTER TABLE LabComponentResultFact ADD CONSTRAINT [LabComponentResultFact-LabComponentResultFactLabStatusDim] FOREIGN KEY (LAB_STS_CD_SK) REFERENCES LabComponentResultFactLabStatusDim (LAB_STS_CD_SK);
ALTER TABLE LabComponentResultFact ADD CONSTRAINT [LabComponentResultFact-LabComponentResultFactResultFlagDim] FOREIGN KEY (RSLT_FLG_CD_SK) REFERENCES LabComponentResultFactResultFlagDim (RSLT_FLG_CD_SK);
ALTER TABLE LabComponentResultFact ADD CONSTRAINT [LabComponentResultFact-LabDim] FOREIGN KEY (RSULT_LAB_SK) REFERENCES LabDim (LAB_SK);
ALTER TABLE LabComponentResultFact ADD CONSTRAINT [LabComponentResultFact-LabTestDim] FOREIGN KEY (LAB_TST_SK) REFERENCES LabTestDim (LAB_TST_SK);
ALTER TABLE LabComponentResultFact ADD CONSTRAINT [LabComponentResultFact-PatientDim] FOREIGN KEY (PTNT_SK) REFERENCES LDW_PTNT_DIM (PTNT_SK);
ALTER TABLE LabComponentResultFact ADD CONSTRAINT [LabComponentResultFact-ProcedureDim] FOREIGN KEY (PRCDR_CD_SK) REFERENCES ProcedureDim (PRCDR_CD_SK);
ALTER TABLE LabComponentResultFact ADD CONSTRAINT [LabComponentResultFact-ProviderDim] FOREIGN KEY (AUTH_PROVDR_SK) REFERENCES ProviderDim (PROVDR_SK);
ALTER TABLE LabComponentResultFact ADD CONSTRAINT [LabComponentResultFact-TimeDim] FOREIGN KEY (ORDRD_TS_SK) REFERENCES DW_TM_OF_DY_DIM (TM_OF_DY_SK);
ALTER TABLE LabComponentResultFact ADD CONSTRAINT [LabComponentResultFact-TimeDim1] FOREIGN KEY (CLCT_TS_SK) REFERENCES DW_TM_OF_DY_DIM (TM_OF_DY_SK);
ALTER TABLE LabComponentResultFact ADD CONSTRAINT [LabComponentResultFact-TimeDim12] FOREIGN KEY (RSLT_TS_SK) REFERENCES DW_TM_OF_DY_DIM (TM_OF_DY_SK);
ALTER TABLE LabTestDim ADD CONSTRAINT [LabTestDim-LabTestCancellationReasonDim] FOREIGN KEY (CNCL_RSN_CDS) REFERENCES LabTestCancellationReasonDim (CNCL_RSN_CDS);
ALTER TABLE LabTestDim ADD CONSTRAINT [LabTestDim-LabTestNameDim] FOREIGN KEY (TST_CDS) REFERENCES LabTestNameDim (TST_CDS);
ALTER TABLE LabTestDim ADD CONSTRAINT [LabTestDim-LabTestOrderPriorityDim] FOREIGN KEY (ORDR_PRTY_CDS) REFERENCES LabTestOrderPriorityDim (ORDR_PRTY_CDS);
ALTER TABLE LabTestDim ADD CONSTRAINT [LabTestDim-LabTestOrderSourceTypeDim] FOREIGN KEY (ORDR_SRC_TYPE_CDS) REFERENCES LabTestOrderSourceTypeDim (ORDR_SRC_TYPE_CDS);
ALTER TABLE LabTestDim ADD CONSTRAINT [LabTestDim-LabTestOrderType] FOREIGN KEY (ORDR_TYPE_CDS) REFERENCES LabTestOrderType (ORDR_TYPE_CDS);
ALTER TABLE LabTestDim ADD CONSTRAINT [LabTestDim-LabTestSpecimenSourceDim] FOREIGN KEY (SPCMN_SRC_CDS) REFERENCES LabTestSpecimenSourceDim (SPCMN_SRC_CDS);
ALTER TABLE LabTestDim ADD CONSTRAINT [LabTestDim-LabTestSpecimenTypeDim] FOREIGN KEY (SPCMN_TYPE_CDS) REFERENCES LabTestSpecimenTypeDim (SPCMN_TYPE_CDS);
ALTER TABLE LabTestDim ADD CONSTRAINT [LabTestDim-LabTestVerificationStatusDim] FOREIGN KEY (VRFCTN_STS_CDS) REFERENCES LabTestVerificationStatusDim (VRFCTN_STS_CDS);
ALTER TABLE LabTestFact ADD CONSTRAINT [LabTestFact-DateDim] FOREIGN KEY (SCHED_CLCT_DT) REFERENCES DW_CLNDR_DIM (CLNDR_DT);
ALTER TABLE LabTestFact ADD CONSTRAINT [LabTestFact-DateDim1] FOREIGN KEY (ORDRD_DT) REFERENCES DW_CLNDR_DIM (CLNDR_DT);
ALTER TABLE LabTestFact ADD CONSTRAINT [LabTestFact-DateDim12] FOREIGN KEY (CLCT_DT) REFERENCES DW_CLNDR_DIM (CLNDR_DT);
ALTER TABLE LabTestFact ADD CONSTRAINT [LabTestFact-DateDim123] FOREIGN KEY (FRST_FNL_VRFY_DT) REFERENCES DW_CLNDR_DIM (CLNDR_DT);
ALTER TABLE LabTestFact ADD CONSTRAINT [LabTestFact-DateDim1234] FOREIGN KEY (FRST_VRFY_DT) REFERENCES DW_CLNDR_DIM (CLNDR_DT);
ALTER TABLE LabTestFact ADD CONSTRAINT [LabTestFact-DateDim12345] FOREIGN KEY (LST_VRFY_DT) REFERENCES DW_CLNDR_DIM (CLNDR_DT);
ALTER TABLE LabTestFact ADD CONSTRAINT [LabTestFact-DateDim123456] FOREIGN KEY (LST_FNL_VRFY_DT) REFERENCES DW_CLNDR_DIM (CLNDR_DT);
ALTER TABLE LabTestFact ADD CONSTRAINT [LabTestFact-DateDim1234567] FOREIGN KEY (LST_CORR_DT) REFERENCES DW_CLNDR_DIM (CLNDR_DT);
ALTER TABLE LabTestFact ADD CONSTRAINT [LabTestFact-DateDim12345678] FOREIGN KEY (FRST_CORR_DT) REFERENCES DW_CLNDR_DIM (CLNDR_DT);
ALTER TABLE LabTestFact ADD CONSTRAINT [LabTestFact-DepartmentDim] FOREIGN KEY (CLCT_DEPT_SK) REFERENCES DepartmentDim (DEPT_SK);
ALTER TABLE LabTestFact ADD CONSTRAINT [LabTestFact-EncounterDim] FOREIGN KEY (ENCNT_SK) REFERENCES DW_ENCNT_DIM (ENCNT_SK);
ALTER TABLE LabTestFact ADD CONSTRAINT [LabTestFact-LabDim] FOREIGN KEY (RSULT_LAB_SK) REFERENCES LabDim (LAB_SK);
ALTER TABLE LabTestFact ADD CONSTRAINT [LabTestFact-LabTestDim] FOREIGN KEY (LAB_TST_SK) REFERENCES LabTestDim (LAB_TST_SK);
ALTER TABLE LabTestFact ADD CONSTRAINT [LabTestFact-PatientDim] FOREIGN KEY (PTNT_SK) REFERENCES LDW_PTNT_DIM (PTNT_SK);
ALTER TABLE LabTestFact ADD CONSTRAINT [LabTestFact-ProcedureDim] FOREIGN KEY (PRCDR_CD_SK) REFERENCES ProcedureDim (PRCDR_CD_SK);
ALTER TABLE LabTestFact ADD CONSTRAINT [LabTestFact-ProviderDim] FOREIGN KEY (AUTH_PROVDR_SK) REFERENCES ProviderDim (PROVDR_SK);
ALTER TABLE LabTestFact ADD CONSTRAINT [LabTestFact-TimeDim] FOREIGN KEY (SCHED_CLCT_TS_SK) REFERENCES DW_TM_OF_DY_DIM (TM_OF_DY_SK);
ALTER TABLE LabTestFact ADD CONSTRAINT [LabTestFact-TimeDim1] FOREIGN KEY (ORDRD_TS_SK) REFERENCES DW_TM_OF_DY_DIM (TM_OF_DY_SK);
ALTER TABLE LabTestFact ADD CONSTRAINT [LabTestFact-TimeDim12] FOREIGN KEY (CLCT_TS_SK) REFERENCES DW_TM_OF_DY_DIM (TM_OF_DY_SK);
ALTER TABLE LabTestFact ADD CONSTRAINT [LabTestFact-UserDim] FOREIGN KEY (CLCT_USR_SK) REFERENCES UserDim (USR_SK);
ALTER TABLE LabTestFact ADD CONSTRAINT [LabTestFact-UserDim1] FOREIGN KEY (FRST_FNL_VRFY_USR_SK) REFERENCES UserDim (USR_SK);
ALTER TABLE LabTestFact ADD CONSTRAINT [LabTestFact-UserDim12] FOREIGN KEY (FRST_VRFY_USR_SK) REFERENCES UserDim (USR_SK);
ALTER TABLE LabTestFact ADD CONSTRAINT [LabTestFact-UserDim123] FOREIGN KEY (FRST_CORR_USR_SK) REFERENCES UserDim (USR_SK);
ALTER TABLE LabTestFact ADD CONSTRAINT [LabTestFact-UserDim1234] FOREIGN KEY (LST_CORR_USR_SK) REFERENCES UserDim (USR_SK);
ALTER TABLE LabTestFact ADD CONSTRAINT [LabTestFact-UserDim12345] FOREIGN KEY (LST_FNL_VRFY_USR_SK) REFERENCES UserDim (USR_SK);
ALTER TABLE MeasureMDFact ADD CONSTRAINT [MeasureMDFact-MeasureDim] FOREIGN KEY (Measure_Dim_ID) REFERENCES qps_Dim_Measure (Measure_Dim_ID);
ALTER TABLE MeasureMLFact ADD CONSTRAINT [MeasureMLFact-MeasureDim] FOREIGN KEY (Measure_Dim_ID) REFERENCES qps_Dim_Measure (Measure_Dim_ID);
ALTER TABLE MeasureQDFact ADD CONSTRAINT [MeasureQDFact-MeasureDim] FOREIGN KEY (Measure_Dim_ID) REFERENCES qps_Dim_Measure (Measure_Dim_ID);
ALTER TABLE MeasureQLFact ADD CONSTRAINT [MeasureQLFact-MeasureDim] FOREIGN KEY (Measure_Dim_ID) REFERENCES qps_Dim_Measure (Measure_Dim_ID);
ALTER TABLE MedicationAdministrationFact ADD CONSTRAINT [MedicationAdministrationFact-BinaryDim] FOREIGN KEY (MDCTN_REQ_SCAN_AT_ADMN_IND) REFERENCES BinaryDim (Binary_CD);
ALTER TABLE MedicationAdministrationFact ADD CONSTRAINT [MedicationAdministrationFact-BinaryDim1] FOREIGN KEY (MDCTN_SCANNED_AT_ADMN_IND) REFERENCES BinaryDim (Binary_CD);
ALTER TABLE MedicationAdministrationFact ADD CONSTRAINT [MedicationAdministrationFact-BinaryDim12] FOREIGN KEY (PTNT_REQ_SCAN_AT_ADMN_IND) REFERENCES BinaryDim (Binary_CD);
ALTER TABLE MedicationAdministrationFact ADD CONSTRAINT [MedicationAdministrationFact-BinaryDim123] FOREIGN KEY (PTNT_SCANNED_AT_ADMN_IND) REFERENCES BinaryDim (Binary_CD);
ALTER TABLE MedicationAdministrationFact ADD CONSTRAINT [MedicationAdministrationFact-DateDim] FOREIGN KEY (SCHED_ADMN_DT) REFERENCES DW_CLNDR_DIM (CLNDR_DT);
ALTER TABLE MedicationAdministrationFact ADD CONSTRAINT [MedicationAdministrationFact-DateDim1] FOREIGN KEY (ADMN_DT) REFERENCES DW_CLNDR_DIM (CLNDR_DT);
ALTER TABLE MedicationAdministrationFact ADD CONSTRAINT [MedicationAdministrationFact-DepartmentDim] FOREIGN KEY (ADMN_DEPT_SK) REFERENCES DepartmentDim (DEPT_SK);
ALTER TABLE MedicationAdministrationFact ADD CONSTRAINT [MedicationAdministrationFact-EncounterDim] FOREIGN KEY (ENCNT_SK) REFERENCES DW_ENCNT_DIM (ENCNT_SK);
ALTER TABLE MedicationAdministrationFact ADD CONSTRAINT [MedicationAdministrationFact-MedicationAdministrationActionDim] FOREIGN KEY (ADMN_ACTN_CDS_SK) REFERENCES MedicationAdministrationActionDim (ADMN_ACTN_CDS_SK);
ALTER TABLE MedicationAdministrationFact ADD CONSTRAINT [MedicationAdministrationFact-MedicationDim] FOREIGN KEY (PRMY_CMPNT_SK) REFERENCES MedicationDim (MDCTN_SK);
ALTER TABLE MedicationAdministrationFact ADD CONSTRAINT [MedicationAdministrationFact-MedicationDim1] FOREIGN KEY (SCND_CMPNT_SK) REFERENCES MedicationDim (MDCTN_SK);
ALTER TABLE MedicationAdministrationFact ADD CONSTRAINT [MedicationAdministrationFact-MedicationDim12] FOREIGN KEY (THRD_CMPNT_SK) REFERENCES MedicationDim (MDCTN_SK);
ALTER TABLE MedicationAdministrationFact ADD CONSTRAINT [MedicationAdministrationFact-MedicationDim123] FOREIGN KEY (FOURTH_CMPNT_SK) REFERENCES MedicationDim (MDCTN_SK);
ALTER TABLE MedicationAdministrationFact ADD CONSTRAINT [MedicationAdministrationFact-MedicationDim1234] FOREIGN KEY (FIFTH_CMPNT_SK) REFERENCES MedicationDim (MDCTN_SK);
ALTER TABLE MedicationAdministrationFact ADD CONSTRAINT [MedicationAdministrationFact-MedicationOrderDim] FOREIGN KEY (MDCTN_ORDR_SK) REFERENCES MedicationOrderDim (MDCTN_ORDR_SK);
ALTER TABLE MedicationAdministrationFact ADD CONSTRAINT [MedicationAdministrationFact-PatientDim] FOREIGN KEY (PTNT_SK) REFERENCES LDW_PTNT_DIM (PTNT_SK);
ALTER TABLE MedicationAdministrationFact ADD CONSTRAINT [MedicationAdministrationFact-TimeDim] FOREIGN KEY (SCHED_ADMN_TS_SK) REFERENCES DW_TM_OF_DY_DIM (TM_OF_DY_SK);
ALTER TABLE MedicationAdministrationFact ADD CONSTRAINT [MedicationAdministrationFact-TimeDim1] FOREIGN KEY (ADMN_TS_SK) REFERENCES DW_TM_OF_DY_DIM (TM_OF_DY_SK);
ALTER TABLE MedicationAdministrationFact ADD CONSTRAINT [MedicationAdministrationFact-UserDim] FOREIGN KEY (ADMN_USR_SK) REFERENCES UserDim (USR_SK);
ALTER TABLE MedicationDim ADD CONSTRAINT [MedicationDim-MedicationAdministrationRouteDim] FOREIGN KEY (ADMN_RT_CDS) REFERENCES MedicationAdministrationRouteDim (ADMN_RT_CDS);
ALTER TABLE MedicationDim ADD CONSTRAINT [MedicationDim-MedicationDEAClassDim] FOREIGN KEY (DEA_CLASS_CDS) REFERENCES MedicationDEAClassDim (DEA_CLASS_CDS);
ALTER TABLE MedicationDim ADD CONSTRAINT [MedicationDim-MedicationFormDim] FOREIGN KEY (MDCTN_FORM_CDS) REFERENCES MedicationFormDim (MDCTN_FORM_CDS);
ALTER TABLE MedicationDim ADD CONSTRAINT [MedicationDim-MedicationPharmacologicalClassDim] FOREIGN KEY (PHARM_CLASS_CDS) REFERENCES MedicationPharmacologicalClassDim (PHARM_CLASS_CDS);
ALTER TABLE MedicationDim ADD CONSTRAINT [MedicationDim-MedicationPharmacologicalSubclassDim] FOREIGN KEY (PHARM_SUBCLS_CDS) REFERENCES MedicationPharmacologicalSubclassDim (PHARM_SUBCLS_CDS);
ALTER TABLE MedicationDim ADD CONSTRAINT [MedicationDim-MedicationTherapeuticClassDim] FOREIGN KEY (THRPC_CLASS_CDS) REFERENCES MedicationTherapeuticClassDim (THRPC_CLASS_CDS);
ALTER TABLE MedicationOrderDim ADD CONSTRAINT [MedicationOrderDim-MedicationOrderCalculatedDoseUnitDim] FOREIGN KEY (CLCLTD_DOSE_UNT_CDS) REFERENCES MedicationOrderCalculatedDoseUnitDim (CLCLTD_DOSE_UNT_CDS);
ALTER TABLE MedicationOrderDim ADD CONSTRAINT [MedicationOrderDim-MedicationOrderClassDim] FOREIGN KEY (ORDR_CLASS_CDS) REFERENCES MedicationOrderClassDim (ORDR_CLASS_CDS);
ALTER TABLE MedicationOrderDim ADD CONSTRAINT [MedicationOrderDim-MedicationOrderDoseUnitDim] FOREIGN KEY (DOSE_UNT_CDS) REFERENCES MedicationOrderDoseUnitDim (DOSE_UNT_CDS);
ALTER TABLE MedicationOrderDim ADD CONSTRAINT [MedicationOrderDim-MedicationOrderModeDim] FOREIGN KEY (ORDR_MODE_CDS) REFERENCES MedicationOrderModeDim (ORDR_MODE_CDS);
ALTER TABLE MedicationOrderDim ADD CONSTRAINT [MedicationOrderDim-MedicationOrderPriorityDim] FOREIGN KEY (ORDR_PRTY_CDS) REFERENCES MedicationOrderPriorityDim (ORDR_PRTY_CDS);
ALTER TABLE MedicationOrderDim ADD CONSTRAINT [MedicationOrderDim-MedicationOrderQuantityUnitDim] FOREIGN KEY (QTY_UNT_CDS) REFERENCES MedicationOrderQuantityUnitDim (QTY_UNT_CDS);
ALTER TABLE MedicationOrderDim ADD CONSTRAINT [MedicationOrderDim-MedicationOrderRouteDim] FOREIGN KEY (RT_CDS) REFERENCES MedicationOrderRouteDim (RT_CDS);
ALTER TABLE MedicationOrderDim ADD CONSTRAINT [MedicationOrderDim-MedicationOrderSetSourceDim] FOREIGN KEY (ORDR_SET_SRC_CDS) REFERENCES MedicationOrderSetSourceDim (ORDR_SET_SRC_CDS);
ALTER TABLE MedicationOrderDim ADD CONSTRAINT [MedicationOrderDim-MedicationOrderSourceDim] FOREIGN KEY (ORDR_SRC_CDS) REFERENCES MedicationOrderSourceDim (ORDR_SRC_CDS);
ALTER TABLE MedicationOrderFact ADD CONSTRAINT [MedicationOrderFact-DateDim] FOREIGN KEY (ORDRD_DT) REFERENCES DW_CLNDR_DIM (CLNDR_DT);
ALTER TABLE MedicationOrderFact ADD CONSTRAINT [MedicationOrderFact-DateDim1] FOREIGN KEY (ORDR_STRT_DT) REFERENCES DW_CLNDR_DIM (CLNDR_DT);
ALTER TABLE MedicationOrderFact ADD CONSTRAINT [MedicationOrderFact-DateDim2] FOREIGN KEY (ORDR_END_DT) REFERENCES DW_CLNDR_DIM (CLNDR_DT);
ALTER TABLE MedicationOrderFact ADD CONSTRAINT [MedicationOrderFact-DateDim3] FOREIGN KEY (ORDR_DSCNTND_DT) REFERENCES DW_CLNDR_DIM (CLNDR_DT);
ALTER TABLE MedicationOrderFact ADD CONSTRAINT [MedicationOrderFact-DepartmentDim] FOREIGN KEY (DEPT_SK) REFERENCES DepartmentDim (DEPT_SK);
ALTER TABLE MedicationOrderFact ADD CONSTRAINT [MedicationOrderFact-EncounterDim] FOREIGN KEY (ENCNT_SK) REFERENCES DW_ENCNT_DIM (ENCNT_SK);
ALTER TABLE MedicationOrderFact ADD CONSTRAINT [MedicationOrderFact-MedicationDim] FOREIGN KEY (MDCTN_SK) REFERENCES MedicationDim (MDCTN_SK);
ALTER TABLE MedicationOrderFact ADD CONSTRAINT [MedicationOrderFact-MedicationOrderDim] FOREIGN KEY (MDCTN_ORDR_SK) REFERENCES MedicationOrderDim (MDCTN_ORDR_SK);
ALTER TABLE MedicationOrderFact ADD CONSTRAINT [MedicationOrderFact-PatientDim] FOREIGN KEY (PTNT_SK) REFERENCES LDW_PTNT_DIM (PTNT_SK);
ALTER TABLE MedicationOrderFact ADD CONSTRAINT [MedicationOrderFact-PharmacyDim] FOREIGN KEY (PHRM_SK) REFERENCES PharmacyDim (PHRM_SK);
ALTER TABLE MedicationOrderFact ADD CONSTRAINT [MedicationOrderFact-ProviderDim] FOREIGN KEY (ORDRD_BY_PROVDR_SK) REFERENCES ProviderDim (PROVDR_SK);
ALTER TABLE MedicationOrderFact ADD CONSTRAINT [MedicationOrderFact-ProviderDim1] FOREIGN KEY (AUTH_BY_PROVDR_SK) REFERENCES ProviderDim (PROVDR_SK);
ALTER TABLE MedicationOrderFact ADD CONSTRAINT [MedicationOrderFact-TimeDim] FOREIGN KEY (ORDRD_TS_SK) REFERENCES DW_TM_OF_DY_DIM (TM_OF_DY_SK);
ALTER TABLE MedicationOrderFact ADD CONSTRAINT [MedicationOrderFact-TimeDim1] FOREIGN KEY (ORDR_STRT_TS_SK) REFERENCES DW_TM_OF_DY_DIM (TM_OF_DY_SK);
ALTER TABLE MedicationOrderFact ADD CONSTRAINT [MedicationOrderFact-TimeDim2] FOREIGN KEY (ORDR_END_TS_SK) REFERENCES DW_TM_OF_DY_DIM (TM_OF_DY_SK);
ALTER TABLE MedicationOrderFact ADD CONSTRAINT [MedicationOrderFact-TimeDim3] FOREIGN KEY (DSCNTND_TS_SK) REFERENCES DW_TM_OF_DY_DIM (TM_OF_DY_SK);
ALTER TABLE MedicationOrderFact ADD CONSTRAINT [MedicationOrderFact-UserDim] FOREIGN KEY (ORDRD_BY_USR_SK) REFERENCES UserDim (USR_SK);
ALTER TABLE OutpatientDim ADD CONSTRAINT [OutpatientDim-EncounterDim] FOREIGN KEY (ENCNT_SK) REFERENCES DW_ENCNT_DIM (ENCNT_SK);
ALTER TABLE OutpatientDim ADD CONSTRAINT [OutpatientDim-OutpatientAdmitConfStatrusDim] FOREIGN KEY (ADMT_CNF_STT_CDS) REFERENCES OutpatientAdmitConfirmationStatusDim (ADMT_CNF_STT_CDS);
ALTER TABLE OutpatientDim ADD CONSTRAINT [OutpatientDim-OutpatientAppointmentConfirmationStatusDim] FOREIGN KEY (APPT_CNF_STT_CDS) REFERENCES OutpatientAppointmentConfirmation (APPT_CNF_STT_CDS);
ALTER TABLE OutpatientDim ADD CONSTRAINT [OutpatientDim-OutpatientAppointmentStatusDim] FOREIGN KEY (APPT_STTS_CDS) REFERENCES OutpatientAppointmentStatusDim (APPT_STTS_CDS);
ALTER TABLE OutpatientDim ADD CONSTRAINT [OutpatientDim-OutpatientCancellationReasonDim] FOREIGN KEY (CNCL_RSN_CDS) REFERENCES OutpatientCancellationReasonDim (CNCL_RSN_CDS);
ALTER TABLE OutpatientDim ADD CONSTRAINT [OutpatientDim-OutpatientFinancialClassDim] FOREIGN KEY (VST_FNNCL_CLSS_CDS) REFERENCES OutpatientFinancialClassDim (VST_FNNCL_CLSS_CDS);
ALTER TABLE OutpatientFact ADD CONSTRAINT [OutpatientFact-DateDim] FOREIGN KEY (APPT_DT) REFERENCES DW_CLNDR_DIM (CLNDR_DT);
ALTER TABLE OutpatientFact ADD CONSTRAINT [OutpatientFact-DateDim1] FOREIGN KEY (APPT_CRTN_INSTNT_DT) REFERENCES DW_CLNDR_DIM (CLNDR_DT);
ALTER TABLE OutpatientFact ADD CONSTRAINT [OutpatientFact-DateDim2] FOREIGN KEY (CHCK_IN_INSTNT_DT) REFERENCES DW_CLNDR_DIM (CLNDR_DT);
ALTER TABLE OutpatientFact ADD CONSTRAINT [OutpatientFact-DateDim3] FOREIGN KEY (CHCK_OUT_INSTNT_DT) REFERENCES DW_CLNDR_DIM (CLNDR_DT);
ALTER TABLE OutpatientFact ADD CONSTRAINT [OutpatientFact-DateDim4] FOREIGN KEY (ARRVL_INSTNT_DT) REFERENCES DW_CLNDR_DIM (CLNDR_DT);
ALTER TABLE OutpatientFact ADD CONSTRAINT [OutpatientFact-DateDim5] FOREIGN KEY (RM_INSTNT_DT) REFERENCES DW_CLNDR_DIM (CLNDR_DT);
ALTER TABLE OutpatientFact ADD CONSTRAINT [OutpatientFact-EncounterFact] FOREIGN KEY (ENCNT_SK) REFERENCES DW_ENCNT_FACT (ENCNT_FACT_SK);
ALTER TABLE OutpatientFact ADD CONSTRAINT [OutpatientFact-OutpatientDim] FOREIGN KEY (ENCNT_SK) REFERENCES OutpatientDim (ENCNT_SK);
ALTER TABLE OutpatientFact ADD CONSTRAINT [OutpatientFact-PatientDim] FOREIGN KEY (PTNT_SK) REFERENCES LDW_PTNT_DIM (PTNT_SK);
ALTER TABLE OutpatientFact ADD CONSTRAINT [OutpatientFact-ProviderDim] FOREIGN KEY (PRMY_VST_PRVDR_KEY) REFERENCES ProviderDim (PROVDR_SK);
ALTER TABLE OutpatientFact ADD CONSTRAINT [OutpatientFact-ProviderDim1] FOREIGN KEY (SCND_VST_PRVDR_KEY) REFERENCES ProviderDim (PROVDR_SK);
ALTER TABLE OutpatientFact ADD CONSTRAINT [OutpatientFact-ProviderDim12] FOREIGN KEY (THRD_VST_PRVDR_KEY) REFERENCES ProviderDim (PROVDR_SK);
ALTER TABLE OutpatientFact ADD CONSTRAINT [OutpatientFact-ProviderDim123] FOREIGN KEY (FRTH_VST_PRVDR_KEY) REFERENCES ProviderDim (PROVDR_SK);
ALTER TABLE OutpatientFact ADD CONSTRAINT [OutpatientFact-TimeDim] FOREIGN KEY (APPT_CRTN_INSTNT_TS_SK) REFERENCES DW_TM_OF_DY_DIM (TM_OF_DY_SK);
ALTER TABLE OutpatientFact ADD CONSTRAINT [OutpatientFact-TimeDim1] FOREIGN KEY (CHCK_IN_INSTNT_TS_SK) REFERENCES DW_TM_OF_DY_DIM (TM_OF_DY_SK);
ALTER TABLE OutpatientFact ADD CONSTRAINT [OutpatientFact-TimeDim12] FOREIGN KEY (APPT_TS_SK) REFERENCES DW_TM_OF_DY_DIM (TM_OF_DY_SK);
ALTER TABLE OutpatientFact ADD CONSTRAINT [OutpatientFact-TimeDim2] FOREIGN KEY (CHCK_OUT_INSTNT_TS_SK) REFERENCES DW_TM_OF_DY_DIM (TM_OF_DY_SK);
ALTER TABLE OutpatientFact ADD CONSTRAINT [OutpatientFact-TimeDim3] FOREIGN KEY (ARRVL_INSTNT_TS_SK) REFERENCES DW_TM_OF_DY_DIM (TM_OF_DY_SK);
ALTER TABLE OutpatientFact ADD CONSTRAINT [OutpatientFact-TimeDim4] FOREIGN KEY (RM_INSTNT_TS_SK) REFERENCES DW_TM_OF_DY_DIM (TM_OF_DY_SK);
ALTER TABLE LDW_PTNT_DIM ADD CONSTRAINT [PatientDim-ProviderDim] FOREIGN KEY (CRNT_PCP_PROVDR_SK) REFERENCES ProviderDim (PROVDR_SK);
ALTER TABLE LDW_PTNT_DIM ADD CONSTRAINT [PersonDim-DateDim] FOREIGN KEY (BRTH_TS) REFERENCES DW_CLNDR_DIM (CLNDR_DT);
ALTER TABLE LDW_PTNT_DIM ADD CONSTRAINT [PersonDim-DateDim2] FOREIGN KEY (REG_TS) REFERENCES DW_CLNDR_DIM (CLNDR_DT);
ALTER TABLE PharmacyDim ADD CONSTRAINT [PharmacyDim-PharmacyPhysicalTypeDim] FOREIGN KEY (PHY_TYPE_CDS) REFERENCES PharmacyPhysicalTypeDim (PHY_TYPE_CDS);
ALTER TABLE ProcedureDim ADD CONSTRAINT [ProcedureDim-ProcedureCategoryDim] FOREIGN KEY (PRCDR_CGY_ID) REFERENCES ProcedureCategoryDim (PRCDR_CGY_ID);
ALTER TABLE ProcedureDim ADD CONSTRAINT [ProcedureDim-ProcedureRevenueCodeDim] FOREIGN KEY (REV_CD) REFERENCES ProcedureRevenueCodeDim (REV_CD);
ALTER TABLE ProcedureDim ADD CONSTRAINT [ProcedureDim-ProcedureTypeDim] FOREIGN KEY (CD_TYPE) REFERENCES ProcedureTypeDim (CD_TYPE);
ALTER TABLE ProcedureOrderFact ADD CONSTRAINT [ProcedureOrderFact-BinaryDim] FOREIGN KEY (CPOE_IND) REFERENCES BinaryDim (Binary_CD);
ALTER TABLE ProcedureOrderFact ADD CONSTRAINT [ProcedureOrderFact-BinaryDim1] FOREIGN KEY (REQR_COSIG_IND) REFERENCES BinaryDim (Binary_CD);
ALTER TABLE ProcedureOrderFact ADD CONSTRAINT [ProcedureOrderFact-BinaryDim2] FOREIGN KEY (COSIG_IND) REFERENCES BinaryDim (Binary_CD);
ALTER TABLE ProcedureOrderFact ADD CONSTRAINT [ProcedureOrderFact-BinaryDim3] FOREIGN KEY (VRBL_SGN_IND) REFERENCES BinaryDim (Binary_CD);
ALTER TABLE ProcedureOrderFact ADD CONSTRAINT [ProcedureOrderFact-DateDim] FOREIGN KEY (ORDRD_DT) REFERENCES DW_CLNDR_DIM (CLNDR_DT);
ALTER TABLE ProcedureOrderFact ADD CONSTRAINT [ProcedureOrderFact-EncounterDim] FOREIGN KEY (ENCNT_SK) REFERENCES DW_ENCNT_DIM (ENCNT_SK);
ALTER TABLE ProcedureOrderFact ADD CONSTRAINT [ProcedureOrderFact-PatientDim] FOREIGN KEY (PTNT_SK) REFERENCES LDW_PTNT_DIM (PTNT_SK);
ALTER TABLE ProcedureOrderFact ADD CONSTRAINT [ProcedureOrderFact-ProcedureDim] FOREIGN KEY (PRCDR_CD_SK) REFERENCES ProcedureDim (PRCDR_CD_SK);
ALTER TABLE ProcedureOrderFact ADD CONSTRAINT [ProcedureOrderFact-ProcedureOrderClassDim] FOREIGN KEY (ORDR_CLSS_CD) REFERENCES ProcedureOrderClassDim (ORDR_CLSS_CD);
ALTER TABLE ProcedureOrderFact ADD CONSTRAINT [ProcedureOrderFact-ProcedureOrderModeDim] FOREIGN KEY (ORDR_MODE_CD) REFERENCES ProcedureOrderModeDim (ORDR_MODE_CD);
ALTER TABLE ProcedureOrderFact ADD CONSTRAINT [ProcedureOrderFact-ProcedureOrderPriorityDim] FOREIGN KEY (ORDR_PRTY_CD) REFERENCES ProcedureOrderPriorityDim (ORDR_PRTY_CD);
ALTER TABLE ProcedureOrderFact ADD CONSTRAINT [ProcedureOrderFact-ProcedureOrderSetDm] FOREIGN KEY (ORDR_SET_CD) REFERENCES ProcedureOrderSetDm (ORDR_SET_CD);
ALTER TABLE ProcedureOrderFact ADD CONSTRAINT [ProcedureOrderFact-ProcedureOrderSourceDim] FOREIGN KEY (ORDR_SRC_CD) REFERENCES ProcedureOrderSourceDim (ORDR_SRC_CD);
ALTER TABLE ProcedureOrderFact ADD CONSTRAINT [ProcedureOrderFact-ProcedureOrderStandingStatusDim] FOREIGN KEY (STNDNG_STS_CD) REFERENCES ProcedureOrderStandingStatusDim (STNDNG_STS_CD);
ALTER TABLE ProcedureOrderFact ADD CONSTRAINT [ProcedureOrderFact-ProcedureOrderStatusDim] FOREIGN KEY (ORDR_STS_CD) REFERENCES ProcedureOrderStatusDim (ORDR_STS_CD);
ALTER TABLE ProcedureOrderFact ADD CONSTRAINT [ProcedureOrderFact-ProcedureOrderTypeDim] FOREIGN KEY (ORDR_TYP_CD) REFERENCES ProcedureOrderTypeDim (ORDR_TYP_CD);
ALTER TABLE ProcedureOrderFact ADD CONSTRAINT [ProcedureOrderFact-ProviderDim] FOREIGN KEY (ORDRD_BY_PROVDR_SK) REFERENCES ProviderDim (PROVDR_SK);
ALTER TABLE ProcedureOrderFact ADD CONSTRAINT [ProcedureOrderFact-ProviderDim1] FOREIGN KEY (AUTH_BY_PROVDR_SK) REFERENCES ProviderDim (PROVDR_SK);
ALTER TABLE ProcedureOrderFact ADD CONSTRAINT [ProcedureOrderFact-TimeDim] FOREIGN KEY (ORDRD_TS_SK) REFERENCES DW_TM_OF_DY_DIM (TM_OF_DY_SK);
ALTER TABLE ProcedureOrderFact ADD CONSTRAINT [ProcedureOrderFact-UserDim] FOREIGN KEY (ORDRD_BY_USR_SK) REFERENCES UserDim (USR_SK);
ALTER TABLE ProviderDim ADD CONSTRAINT [ProviderDim-ProviderAffiliationDim] FOREIGN KEY (INTN_EXT_CDS) REFERENCES ProviderAffiliationDim (INTN_EXT_CDS);
ALTER TABLE ProviderDim ADD CONSTRAINT [ProviderDim-ProviderClinicianTitleDim] FOREIGN KEY (CLNC_TITL_CDS) REFERENCES ProviderClinicianTitleDim (CLNC_TITL_CDS);
ALTER TABLE ProviderDim ADD CONSTRAINT [ProviderDim-ProviderFieldOfPracticeDim] FOREIGN KEY (MU_FLD_OF_PRACT_CDS) REFERENCES ProviderFieldOfPracticeDim (MU_FLD_OF_PRACT_CDS);
ALTER TABLE ProviderDim ADD CONSTRAINT [ProviderDim-ProviderInternalExternalDim] FOREIGN KEY (INTN_EXT_CDS) REFERENCES ProviderInternalExternalDim (INTN_EXT_CDS);
ALTER TABLE ProviderDim ADD CONSTRAINT [ProviderDim-ProviderPrimaryDepartmentDim] FOREIGN KEY (PRMY_DEPT_CDS) REFERENCES ProviderPrimaryDepartmentDim (PRMY_DEPT_CDS);
ALTER TABLE ProviderDim ADD CONSTRAINT [ProviderDim-ProviderPrimarySpecialtyDim] FOREIGN KEY (PRMY_SPCLY_CDS) REFERENCES ProviderPrimarySpecialtyDim (PRMY_SPCLY_CDS);
ALTER TABLE ProviderDim ADD CONSTRAINT [ProviderDim-ProviderReportingStructureDim] FOREIGN KEY (RPTNG_STRC_CDS) REFERENCES ProviderReportingStructureDim (RPTNG_STRC_CDS);
ALTER TABLE ProviderDim ADD CONSTRAINT [ProviderDim-ProviderTypeDim] FOREIGN KEY (PROVDR_TYPE_CDS) REFERENCES ProviderTypeDim (PROVDR_TYPE_CDS);
ALTER TABLE qps_Dim_Measure ADD CONSTRAINT [QualityMeasureDim-QualityMeasureSourceDim] FOREIGN KEY (Source_ID) REFERENCES QualityMeasureSourceDim (Source_ID);
ALTER TABLE SurgicalCaseDim ADD CONSTRAINT [SurgicalCaseDim-SurgicalCaseClassDim] FOREIGN KEY (CL_CDS) REFERENCES SurgicalCaseClassDim (CL_CDS);
ALTER TABLE SurgicalCaseDim ADD CONSTRAINT [SurgicalCaseDim-SurgicalCasePatientClassDim] FOREIGN KEY (SRG_PTNT_CLASS_CDS) REFERENCES SurgicalCasePatientClassDim (SRG_PTNT_CLASS_CDS);
ALTER TABLE SurgicalCaseDim ADD CONSTRAINT [SurgicalCaseDim-SurgicalCasePrimaryAnesthesiaTypeDim] FOREIGN KEY (PRMY_ANSTH_TYPE_CDS) REFERENCES SurgicalCasePrimaryAnesthesiaTypeDim (PRMY_ANSTH_TYPE_CDS);
ALTER TABLE SurgicalCaseDim ADD CONSTRAINT [SurgicalCaseDim-SurgicalCasePrimaryServiceDim] FOREIGN KEY (PRMY_SRVC_CDS) REFERENCES SurgicalCasePrimaryServiceDim (PRMY_SRVC_CDS);
ALTER TABLE SurgicalCaseDim ADD CONSTRAINT [SurgicalCaseDim-SurgicalCaseProcedureLevelDim] FOREIGN KEY (PRCDR_LEVL_CDS) REFERENCES SurgicalCaseProcedureLevelDim (PRCDR_LEVL_CDS);
ALTER TABLE SurgicalCaseDim ADD CONSTRAINT [SurgicalCaseDim-SurgicalCaseReasonNotPerformedDim] FOREIGN KEY (RSN_NOT_PRFRM_CDS) REFERENCES SurgicalCaseReasonNotPerformedDim (RSN_NOT_PRFRM_CDS);
ALTER TABLE SurgicalCaseFact ADD CONSTRAINT [SurgicalCaseFact-DateDim] FOREIGN KEY (SRG_DT) REFERENCES DW_CLNDR_DIM (CLNDR_DT);
ALTER TABLE SurgicalCaseFact ADD CONSTRAINT [SurgicalCaseFact-DateDim1] FOREIGN KEY (CASE_RQST_DT) REFERENCES DW_CLNDR_DIM (CLNDR_DT);
ALTER TABLE SurgicalCaseFact ADD CONSTRAINT [SurgicalCaseFact-DateDim12] FOREIGN KEY (SCHED_SETUP_STRT_DT) REFERENCES DW_CLNDR_DIM (CLNDR_DT);
ALTER TABLE SurgicalCaseFact ADD CONSTRAINT [SurgicalCaseFact-DateDim123] FOREIGN KEY (SCHED_IN_RM_DT) REFERENCES DW_CLNDR_DIM (CLNDR_DT);
ALTER TABLE SurgicalCaseFact ADD CONSTRAINT [SurgicalCaseFact-DateDim1234] FOREIGN KEY (SCHED_OUT_OF_RM_DT) REFERENCES DW_CLNDR_DIM (CLNDR_DT);
ALTER TABLE SurgicalCaseFact ADD CONSTRAINT [SurgicalCaseFact-DateDim12345] FOREIGN KEY (PTNT_IN_FCLT_DT) REFERENCES DW_CLNDR_DIM (CLNDR_DT);
ALTER TABLE SurgicalCaseFact ADD CONSTRAINT [SurgicalCaseFact-DateDim123456] FOREIGN KEY (PTNT_IN_PRE_PRCDR_DT) REFERENCES DW_CLNDR_DIM (CLNDR_DT);
ALTER TABLE SurgicalCaseFact ADD CONSTRAINT [SurgicalCaseFact-DateDim1234567] FOREIGN KEY (PTNT_OUT_OF_POST_OP_DT) REFERENCES DW_CLNDR_DIM (CLNDR_DT);
ALTER TABLE SurgicalCaseFact ADD CONSTRAINT [SurgicalCaseFact-DateDim12345678] FOREIGN KEY (POST_OP_CARE_CMPLT_DT) REFERENCES DW_CLNDR_DIM (CLNDR_DT);
ALTER TABLE SurgicalCaseFact ADD CONSTRAINT [SurgicalCaseFact-DateDim123456789] FOREIGN KEY (PTNT_POST_OP_DT) REFERENCES DW_CLNDR_DIM (CLNDR_DT);
ALTER TABLE SurgicalCaseFact ADD CONSTRAINT [SurgicalCaseFact-DateDim12345678910] FOREIGN KEY (PTNT_OUT_OF_PACU_DT) REFERENCES DW_CLNDR_DIM (CLNDR_DT);
ALTER TABLE SurgicalCaseFact ADD CONSTRAINT [SurgicalCaseFact-DateDim1234567891011] FOREIGN KEY (PACU_CARE_CMPLT_DT) REFERENCES DW_CLNDR_DIM (CLNDR_DT);
ALTER TABLE SurgicalCaseFact ADD CONSTRAINT [SurgicalCaseFact-DateDim123456789101112] FOREIGN KEY (ANSTH_STOP_DT) REFERENCES DW_CLNDR_DIM (CLNDR_DT);
ALTER TABLE SurgicalCaseFact ADD CONSTRAINT [SurgicalCaseFact-DateDim12345678910111213] FOREIGN KEY (PTNT_IN_PACU_DT) REFERENCES DW_CLNDR_DIM (CLNDR_DT);
ALTER TABLE SurgicalCaseFact ADD CONSTRAINT [SurgicalCaseFact-DateDim1234567891011121314] FOREIGN KEY (RM_CLNUP_CMPLT_DT) REFERENCES DW_CLNDR_DIM (CLNDR_DT);
ALTER TABLE SurgicalCaseFact ADD CONSTRAINT [SurgicalCaseFact-DateDim123456789101112131415] FOREIGN KEY (RM_CLNUP_STRT_DT) REFERENCES DW_CLNDR_DIM (CLNDR_DT);
ALTER TABLE SurgicalCaseFact ADD CONSTRAINT [SurgicalCaseFact-DateDim12345678910111213141516] FOREIGN KEY (PTNT_OUT_OF_RM_DT) REFERENCES DW_CLNDR_DIM (CLNDR_DT);
ALTER TABLE SurgicalCaseFact ADD CONSTRAINT [SurgicalCaseFact-DateDim1234567891011121314151617] FOREIGN KEY (PRCDR_CMPLT_DT) REFERENCES DW_CLNDR_DIM (CLNDR_DT);
ALTER TABLE SurgicalCaseFact ADD CONSTRAINT [SurgicalCaseFact-DateDim123456789101112131415161718] FOREIGN KEY (PRCDR_STRT_DT) REFERENCES DW_CLNDR_DIM (CLNDR_DT);
ALTER TABLE SurgicalCaseFact ADD CONSTRAINT [SurgicalCaseFact-DateDim12345678910111213141516171819] FOREIGN KEY (ANSTH_RDY_DT) REFERENCES DW_CLNDR_DIM (CLNDR_DT);
ALTER TABLE SurgicalCaseFact ADD CONSTRAINT [SurgicalCaseFact-DateDim123456789101112131415161718192021] FOREIGN KEY (PTNT_IN_RM_DT) REFERENCES DW_CLNDR_DIM (CLNDR_DT);
ALTER TABLE SurgicalCaseFact ADD CONSTRAINT [SurgicalCaseFact-DateDim12345678910111213141516171819202122] FOREIGN KEY (PRE_PRCDR_CMPLT_DT) REFERENCES DW_CLNDR_DIM (CLNDR_DT);
ALTER TABLE SurgicalCaseFact ADD CONSTRAINT [SurgicalCaseFact-DateDim1234567891011121314151617181920212223] FOREIGN KEY (ANSTH_STRT_DT) REFERENCES DW_CLNDR_DIM (CLNDR_DT);
ALTER TABLE SurgicalCaseFact ADD CONSTRAINT [SurgicalCaseFact-DateDim123456789101112131415161718192021222324] FOREIGN KEY (RM_RDY_DT) REFERENCES DW_CLNDR_DIM (CLNDR_DT);
ALTER TABLE SurgicalCaseFact ADD CONSTRAINT [SurgicalCaseFact-DateDim12345678910111213141516171819202122232425] FOREIGN KEY (RM_SETUP_STRT_DT) REFERENCES DW_CLNDR_DIM (CLNDR_DT);
ALTER TABLE SurgicalCaseFact ADD CONSTRAINT [SurgicalCaseFact-DateDim1234567891011121314151617181920212223242526] FOREIGN KEY (SCHED_CLNUP_CMPLT_DT) REFERENCES DW_CLNDR_DIM (CLNDR_DT);
ALTER TABLE SurgicalCaseFact ADD CONSTRAINT [SurgicalCaseFact-DepartmentDim] FOREIGN KEY (DEPT_SK) REFERENCES DepartmentDim (DEPT_SK);
ALTER TABLE SurgicalCaseFact ADD CONSTRAINT [SurgicalCaseFact-DiagnosisBridge] FOREIGN KEY (DIAG_CD_SK) REFERENCES dbo_DIAG_BRIDGE (DIAG_CD_SK);
ALTER TABLE SurgicalCaseFact ADD CONSTRAINT [SurgicalCaseFact-EncounterDim] FOREIGN KEY (HSPTL_ENCNT_SK) REFERENCES DW_ENCNT_DIM (ENCNT_SK);
ALTER TABLE SurgicalCaseFact ADD CONSTRAINT [SurgicalCaseFact-EncounterDim1] FOREIGN KEY (SRG_ENCNT_SK) REFERENCES DW_ENCNT_DIM (ENCNT_SK);
ALTER TABLE SurgicalCaseFact ADD CONSTRAINT [SurgicalCaseFact-PatientDim] FOREIGN KEY (PTNT_SK) REFERENCES LDW_PTNT_DIM (PTNT_SK);
ALTER TABLE SurgicalCaseFact ADD CONSTRAINT [SurgicalCaseFact-ProcedureDim] FOREIGN KEY (PRMY_PRCDR_CD_SK) REFERENCES ProcedureDim (PRCDR_CD_SK);
ALTER TABLE SurgicalCaseFact ADD CONSTRAINT [SurgicalCaseFact-ProviderDim] FOREIGN KEY (PRMY_PROVDR_SK) REFERENCES ProviderDim (PROVDR_SK);
ALTER TABLE SurgicalCaseFact ADD CONSTRAINT [SurgicalCaseFact-ProviderDim1] FOREIGN KEY (ANSTHGIST_PROVDR_SK) REFERENCES ProviderDim (PROVDR_SK);
ALTER TABLE SurgicalCaseFact ADD CONSTRAINT [SurgicalCaseFact-SurgicalCaseDim] FOREIGN KEY (CASE_SK) REFERENCES SurgicalCaseDim (CASE_SK);
ALTER TABLE SurgicalCaseFact ADD CONSTRAINT [SurgicalCaseFact-TimeDim] FOREIGN KEY (CASE_RQST_TM_SK) REFERENCES DW_TM_OF_DY_DIM (TM_OF_DY_SK);
ALTER TABLE SurgicalCaseFact ADD CONSTRAINT [SurgicalCaseFact-TimeDim1] FOREIGN KEY (SCHED_SETUP_STRT_TM_SK) REFERENCES DW_TM_OF_DY_DIM (TM_OF_DY_SK);
ALTER TABLE SurgicalCaseFact ADD CONSTRAINT [SurgicalCaseFact-TimeDim12] FOREIGN KEY (SCHED_IN_RM_TM_SK) REFERENCES DW_TM_OF_DY_DIM (TM_OF_DY_SK);
ALTER TABLE SurgicalCaseFact ADD CONSTRAINT [SurgicalCaseFact-TimeDim123] FOREIGN KEY (SCHED_OUT_OF_RM_TM_SK) REFERENCES DW_TM_OF_DY_DIM (TM_OF_DY_SK);
ALTER TABLE SurgicalCaseFact ADD CONSTRAINT [SurgicalCaseFact-TimeDim1234] FOREIGN KEY (SCHED_CLNUP_CMPLT_TM_SK) REFERENCES DW_TM_OF_DY_DIM (TM_OF_DY_SK);
ALTER TABLE SurgicalCaseFact ADD CONSTRAINT [SurgicalCaseFact-TimeDim12345] FOREIGN KEY (PTNT_IN_FCLT_TM_SK) REFERENCES DW_TM_OF_DY_DIM (TM_OF_DY_SK);
ALTER TABLE SurgicalCaseFact ADD CONSTRAINT [SurgicalCaseFact-TimeDim123456] FOREIGN KEY (PTNT_IN_PRE_PRCDR_TM_SK) REFERENCES DW_TM_OF_DY_DIM (TM_OF_DY_SK);
ALTER TABLE SurgicalCaseFact ADD CONSTRAINT [SurgicalCaseFact-TimeDim1234567] FOREIGN KEY (PTNT_OUT_OF_POST_OP_TM_SK) REFERENCES DW_TM_OF_DY_DIM (TM_OF_DY_SK);
ALTER TABLE SurgicalCaseFact ADD CONSTRAINT [SurgicalCaseFact-TimeDim12345678] FOREIGN KEY (POST_OP_CARE_CMPLT_TM_SK) REFERENCES DW_TM_OF_DY_DIM (TM_OF_DY_SK);
ALTER TABLE SurgicalCaseFact ADD CONSTRAINT [SurgicalCaseFact-TimeDim123456789] FOREIGN KEY (PTNT_POST_OP_TM_SK) REFERENCES DW_TM_OF_DY_DIM (TM_OF_DY_SK);
ALTER TABLE SurgicalCaseFact ADD CONSTRAINT [SurgicalCaseFact-TimeDim12345678910] FOREIGN KEY (PTNT_OUT_OF_PACU_TM_SK) REFERENCES DW_TM_OF_DY_DIM (TM_OF_DY_SK);
ALTER TABLE SurgicalCaseFact ADD CONSTRAINT [SurgicalCaseFact-TimeDim1234567891011] FOREIGN KEY (PACU_CARE_CMPLT_TM_SK) REFERENCES DW_TM_OF_DY_DIM (TM_OF_DY_SK);
ALTER TABLE SurgicalCaseFact ADD CONSTRAINT [SurgicalCaseFact-TimeDim123456789101112] FOREIGN KEY (ANSTH_STOP_TM_SK) REFERENCES DW_TM_OF_DY_DIM (TM_OF_DY_SK);
ALTER TABLE SurgicalCaseFact ADD CONSTRAINT [SurgicalCaseFact-TimeDim12345678910111213] FOREIGN KEY (PTNT_IN_PACU_TM_SK) REFERENCES DW_TM_OF_DY_DIM (TM_OF_DY_SK);
ALTER TABLE SurgicalCaseFact ADD CONSTRAINT [SurgicalCaseFact-TimeDim1234567891011121314] FOREIGN KEY (RM_CLNUP_CMPLT_TM_SK) REFERENCES DW_TM_OF_DY_DIM (TM_OF_DY_SK);
ALTER TABLE SurgicalCaseFact ADD CONSTRAINT [SurgicalCaseFact-TimeDim123456789101112131415] FOREIGN KEY (RM_CLNUP_STRT_TM_SK) REFERENCES DW_TM_OF_DY_DIM (TM_OF_DY_SK);
ALTER TABLE SurgicalCaseFact ADD CONSTRAINT [SurgicalCaseFact-TimeDim12345678910111213141516] FOREIGN KEY (PTNT_OUT_OF_RM_TM_SK) REFERENCES DW_TM_OF_DY_DIM (TM_OF_DY_SK);
ALTER TABLE SurgicalCaseFact ADD CONSTRAINT [SurgicalCaseFact-TimeDim1234567891011121314151617] FOREIGN KEY (PRCDR_CMPLT_TM_SK) REFERENCES DW_TM_OF_DY_DIM (TM_OF_DY_SK);
ALTER TABLE SurgicalCaseFact ADD CONSTRAINT [SurgicalCaseFact-TimeDim123456789101112131415161718] FOREIGN KEY (PRCDR_STRT_TM_SK) REFERENCES DW_TM_OF_DY_DIM (TM_OF_DY_SK);
ALTER TABLE SurgicalCaseFact ADD CONSTRAINT [SurgicalCaseFact-TimeDim12345678910111213141516171819] FOREIGN KEY (ANSTH_RDY_TM_SK) REFERENCES DW_TM_OF_DY_DIM (TM_OF_DY_SK);
ALTER TABLE SurgicalCaseFact ADD CONSTRAINT [SurgicalCaseFact-TimeDim123456789101112131415161718192021] FOREIGN KEY (PTNT_IN_RM_TM_SK) REFERENCES DW_TM_OF_DY_DIM (TM_OF_DY_SK);
ALTER TABLE SurgicalCaseFact ADD CONSTRAINT [SurgicalCaseFact-TimeDim12345678910111213141516171819202122] FOREIGN KEY (PRE_PRCDR_CMPLT_TM_SK) REFERENCES DW_TM_OF_DY_DIM (TM_OF_DY_SK);
ALTER TABLE SurgicalCaseFact ADD CONSTRAINT [SurgicalCaseFact-TimeDim1234567891011121314151617181920212223] FOREIGN KEY (ANSTH_STRT_TM_SK) REFERENCES DW_TM_OF_DY_DIM (TM_OF_DY_SK);
ALTER TABLE SurgicalCaseFact ADD CONSTRAINT [SurgicalCaseFact-TimeDim123456789101112131415161718192021222324] FOREIGN KEY (RM_RDY_TM_SK) REFERENCES DW_TM_OF_DY_DIM (TM_OF_DY_SK);
ALTER TABLE SurgicalCaseFact ADD CONSTRAINT [SurgicalCaseFact-TimeDim12345678910111213141516171819202122232425] FOREIGN KEY (RM_SETUP_STRT_TM_SK) REFERENCES DW_TM_OF_DY_DIM (TM_OF_DY_SK);
ALTER TABLE SurgicalProcedureEventFact ADD CONSTRAINT [SurgicalProcedureEventFact-BinaryDim] FOREIGN KEY (SCHED_IND) REFERENCES BinaryDim (Binary_CD);
ALTER TABLE SurgicalProcedureEventFact ADD CONSTRAINT [SurgicalProcedureEventFact-BinaryDim1] FOREIGN KEY (PRFRM_IND) REFERENCES BinaryDim (Binary_CD);
ALTER TABLE SurgicalProcedureEventFact ADD CONSTRAINT [SurgicalProcedureEventFact-BinaryDim12] FOREIGN KEY (PSSBL_IND) REFERENCES BinaryDim (Binary_CD);
ALTER TABLE SurgicalProcedureEventFact ADD CONSTRAINT [SurgicalProcedureEventFact-DateDim] FOREIGN KEY (SRG_DT) REFERENCES DW_CLNDR_DIM (CLNDR_DT);
ALTER TABLE SurgicalProcedureEventFact ADD CONSTRAINT [SurgicalProcedureEventFact-EncounterDim] FOREIGN KEY (HSPTL_ENCNT_SK) REFERENCES DW_ENCNT_DIM (ENCNT_SK);
ALTER TABLE SurgicalProcedureEventFact ADD CONSTRAINT [SurgicalProcedureEventFact-EncounterDim1] FOREIGN KEY (SRG_ENCNT_SK) REFERENCES DW_ENCNT_DIM (ENCNT_SK);
ALTER TABLE SurgicalProcedureEventFact ADD CONSTRAINT [SurgicalProcedureEventFact-PatientDim] FOREIGN KEY (PTNT_SK) REFERENCES LDW_PTNT_DIM (PTNT_SK);
ALTER TABLE SurgicalProcedureEventFact ADD CONSTRAINT [SurgicalProcedureEventFact-ProcedureDim] FOREIGN KEY (PRCDR_CD_SK) REFERENCES ProcedureDim (PRCDR_CD_SK);
ALTER TABLE SurgicalProcedureEventFact ADD CONSTRAINT [SurgicalProcedureEventFact-ProviderDim] FOREIGN KEY (PRMY_PROVDR_SURGEON_SK) REFERENCES ProviderDim (PROVDR_SK);
ALTER TABLE SurgicalProcedureEventFact ADD CONSTRAINT [SurgicalProcedureEventFact-ProviderDim1] FOREIGN KEY (SCND_PROVDR_SURGEON_SK) REFERENCES ProviderDim (PROVDR_SK);
ALTER TABLE SurgicalProcedureEventFact ADD CONSTRAINT [SurgicalProcedureEventFact-ProviderDim12] FOREIGN KEY (THRD_PROVDR_SURGEON_SK) REFERENCES ProviderDim (PROVDR_SK);
ALTER TABLE SurgicalProcedureEventFact ADD CONSTRAINT [SurgicalProcedureEventFact-SugicalProcedureEventWoundClassDim] FOREIGN KEY (WND_CLASS_CDS) REFERENCES SugicalProcedureEventWoundClassDim (WND_CLASS_CDS);
ALTER TABLE SurgicalProcedureEventFact ADD CONSTRAINT [SurgicalProcedureEventFact-SurgicalCaseDim] FOREIGN KEY (CASE_SK) REFERENCES SurgicalCaseDim (CASE_SK);
ALTER TABLE SurgicalProcedureEventFact ADD CONSTRAINT [SurgicalProcedureEventFact-SurgicalProcedureEventAnesthesiaTypeDim] FOREIGN KEY (ANSTH_TYPE_CDS) REFERENCES SurgicalProcedureEventAnesthesiaTypeDim (ANSTH_TYPE_CDS);
ALTER TABLE SurgicalProcedureEventFact ADD CONSTRAINT [SurgicalProcedureEventFact-SurgicalProcedureEventLateralityDim] FOREIGN KEY (LTRLTY_CDS) REFERENCES SurgicalProcedureEventLateralityDim (LTRLTY_CDS);
ALTER TABLE SurgicalProcedureEventFact ADD CONSTRAINT [SurgicalProcedureEventFact-SurgicalProcedureEventProcedureSiteDim] FOREIGN KEY (PRCDR_SITE_CDS) REFERENCES SurgicalProcedureEventProcedureSiteDim (PRCDR_SITE_CDS);
ALTER TABLE SurgicalProcedureEventFact ADD CONSTRAINT [SurgicalProcedureEventFact-SurgicalProcedureEventServiceDim] FOREIGN KEY (SRVC_CDS) REFERENCES SurgicalProcedureEventServiceDim (SRVC_CDS);
ALTER TABLE SurgicalSupplyDim ADD CONSTRAINT [SurgicalSupplyDim-SurgicalSupplyManufacturerDim] FOREIGN KEY (MNFCTR_CDS) REFERENCES SurgicalSupplyManufacturerDim (MNFCTR_CDS);
ALTER TABLE SurgicalSupplyDim ADD CONSTRAINT [SurgicalSupplyDim-SurgicalSupplyVendorDim] FOREIGN KEY (VND_CDS) REFERENCES SurgicalSupplyVendorDim (VND_CDS);
ALTER TABLE SurgicalSupplyUseFact ADD CONSTRAINT [SurgicalSupplyUseFact-BinaryDim] FOREIGN KEY (CRGBL_IND) REFERENCES BinaryDim (Binary_CD);
ALTER TABLE SurgicalSupplyUseFact ADD CONSTRAINT [SurgicalSupplyUseFact-DateDim] FOREIGN KEY (SRG_DT) REFERENCES DW_CLNDR_DIM (CLNDR_DT);
ALTER TABLE SurgicalSupplyUseFact ADD CONSTRAINT [SurgicalSupplyUseFact-DepartmentDim] FOREIGN KEY (DEPT_SK) REFERENCES DepartmentDim (DEPT_SK);
ALTER TABLE SurgicalSupplyUseFact ADD CONSTRAINT [SurgicalSupplyUseFact-EncounterDim] FOREIGN KEY (HSPTL_ENCNT_SK) REFERENCES DW_ENCNT_DIM (ENCNT_SK);
ALTER TABLE SurgicalSupplyUseFact ADD CONSTRAINT [SurgicalSupplyUseFact-EncounterDim1] FOREIGN KEY (SRG_ENCNT_SK) REFERENCES DW_ENCNT_DIM (ENCNT_SK);
ALTER TABLE SurgicalSupplyUseFact ADD CONSTRAINT [SurgicalSupplyUseFact-PatientDim] FOREIGN KEY (PTNT_SK) REFERENCES LDW_PTNT_DIM (PTNT_SK);
ALTER TABLE SurgicalSupplyUseFact ADD CONSTRAINT [SurgicalSupplyUseFact-ProcedureDim] FOREIGN KEY (PRCDR_CD_SK) REFERENCES ProcedureDim (PRCDR_CD_SK);
ALTER TABLE SurgicalSupplyUseFact ADD CONSTRAINT [SurgicalSupplyUseFact-ProviderDim] FOREIGN KEY (PRMY_PROVDR_SK) REFERENCES ProviderDim (PROVDR_SK);
ALTER TABLE SurgicalSupplyUseFact ADD CONSTRAINT [SurgicalSupplyUseFact-SurgicalCaseDim] FOREIGN KEY (CASE_SK) REFERENCES SurgicalCaseDim (CASE_SK);
ALTER TABLE SurgicalSupplyUseFact ADD CONSTRAINT [SurgicalSupplyUseFact-SurgicalSupplyDim] FOREIGN KEY (SPPLY_SK) REFERENCES SurgicalSupplyDim (SPPLY_SK);
ALTER TABLE SurgicalSupplyUseFact ADD CONSTRAINT [SurgicalSupplyUseFact-SurgicalSupplyUseLogStatusDim] FOREIGN KEY (LOG_STS_CDS) REFERENCES SurgicalSupplyUseLogStatusDim (LOG_STS_CDS);
ALTER TABLE SurgicalSupplyUseFact ADD CONSTRAINT [SurgicalSupplyUseFact-SurgicalSupplyUseORServiceDim] FOREIGN KEY (OR_SRVC_CDS) REFERENCES SurgicalSupplyUseORServiceDim (OR_SRVC_CDS);
ALTER TABLE UserDim ADD CONSTRAINT [UserDim-UserGenderDim] FOREIGN KEY (SEX_CDS) REFERENCES UserGenderDim (SEX_CDS);
