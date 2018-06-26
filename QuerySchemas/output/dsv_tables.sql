truncate table [dbo].[tblVS_dsv_tables]

insert into [dbo].[tblVS_dsv_tables]([dsv_table_id], [Name], [FriendlyName], [DbTableName], [QueryDefinition]) values
(38,'BinaryDim','BinaryDim','BinaryDim','SELECT        *
FROM            (VALUES (0, ''No''), (1, ''Yes''), (-1, ''Not Applicable'')) AS Colors(Binary_CD, Binary_Desc)')
,(57,'CensusGeographicalAreaDim','CensusGeographicalAreaDim','CensusGeographicalAreaDim','SELECT        GEO_AREA_SK, GEO_AREA_TYPE, GEO_AREA_DSPL_NM
FROM            DW.GEO_AREA_DIM
WHERE        (IS_CRNT = 1) AND (STRLEFT(SRC_GEO_AREA_ID, 2) IN (''11'', ''21'', ''37'', ''47'', ''51'', ''54''))')
,(58,'CensusMeasureFact','CensusMeasureFact','CensusMeasureFact','SELECT        DW.CENSUS_MSR_FACT.MSR_FACT_SK, DW.CENSUS_MSR_FACT.GEO_AREA_SK, DW.CENSUS_MSR_FACT.SRC_SK, DW.CENSUS_MSR_FACT.MSR_FLT_VAL, DW.CENSUS_MSR_FACT.MSR_VAL_SYM, 
                         CASE WHEN DW.CENSUS_MSR_FACT.MSR_FLT_VAL = 0 THEN 0 WHEN DW.CENSUS_MSR_FACT.MSR_FLT_VAL < 0 THEN NULL ELSE Log(DW.CENSUS_MSR_FACT.MSR_FLT_VAL) END AS MSR_FLT_VAL_Log,
                          Abstract.MSR_TYPE_AB AS MSR_TYPE_SK
FROM            DW.CENSUS_MSR_FACT, DW.GEO_AREA_DIM,
                             (SELECT DISTINCT AB.MSR_TYPE_AB, Comoplete.MSR_TYPE_FULL
                               FROM            (SELECT        MIN(DW.CENSUS_MSR_TYPE_DIM.MSR_TYPE_SK) AS MSR_TYPE_AB, DW.CENSUS_MSR_TYPE_DIM.SRC_MSR_TYPE_NM, DW.CENSUS_SRC_DIM.SRC_NM
                                                         FROM            DW.CENSUS_MSR_FACT CENSUS_MSR_FACT_2, DW.CENSUS_MSR_TYPE_DIM, DW.CENSUS_SRC_DIM
                                                         WHERE        CENSUS_MSR_FACT_2.MSR_TYPE_SK = DW.CENSUS_MSR_TYPE_DIM.MSR_TYPE_SK AND CENSUS_MSR_FACT_2.SRC_SK = DW.CENSUS_SRC_DIM.SRC_SK
                                                         GROUP BY DW.CENSUS_MSR_TYPE_DIM.SRC_MSR_TYPE_NM, DW.CENSUS_SRC_DIM.SRC_NM) AB,
                                                             (SELECT        CENSUS_MSR_TYPE_DIM_1.MSR_TYPE_SK AS MSR_TYPE_FULL, CENSUS_MSR_TYPE_DIM_1.SRC_MSR_TYPE_NM, CENSUS_SRC_DIM_1.SRC_NM
                                                               FROM            DW.CENSUS_MSR_FACT CENSUS_MSR_FACT_1, DW.CENSUS_MSR_TYPE_DIM CENSUS_MSR_TYPE_DIM_1, DW.CENSUS_SRC_DIM CENSUS_SRC_DIM_1
                                                               WHERE        CENSUS_MSR_FACT_1.MSR_TYPE_SK = CENSUS_MSR_TYPE_DIM_1.MSR_TYPE_SK AND CENSUS_MSR_FACT_1.SRC_SK = CENSUS_SRC_DIM_1.SRC_SK) Comoplete
                               WHERE        AB.SRC_MSR_TYPE_NM = Comoplete.SRC_MSR_TYPE_NM AND AB.SRC_NM = Comoplete.SRC_NM) Abstract
WHERE        DW.CENSUS_MSR_FACT.GEO_AREA_SK = DW.GEO_AREA_DIM.GEO_AREA_SK AND DW.CENSUS_MSR_FACT.MSR_TYPE_SK = Abstract.MSR_TYPE_FULL AND (DW.CENSUS_MSR_FACT.IS_CRNT = 1) AND 
                         (STRLEFT(DW.GEO_AREA_DIM.SRC_GEO_AREA_ID, 2) IN (''11'', ''21'', ''37'', ''47'', ''51'', ''54''))')
,(55,'CensusMeasureTypeDim','CensusMeasureTypeDim','CensusMeasureTypeDim','SELECT DISTINCT 
                         MSR_TYPE_AB AS MSR_TYPE_SK, CASE WHEN STRLEFT(SRC_MSR_TYPE_NM, 1) = ''"'' THEN SUBSTR(SRC_MSR_TYPE_NM, 2, LENGTH(SRC_MSR_TYPE_NM) - 3) 
                         ELSE SRC_MSR_TYPE_NM END AS SRC_MSR_TYPE_NM
FROM            (SELECT        MIN(DW.CENSUS_MSR_TYPE_DIM.MSR_TYPE_SK) AS MSR_TYPE_AB, DW.CENSUS_MSR_TYPE_DIM.SRC_MSR_TYPE_NM, DW.CENSUS_SRC_DIM.SRC_NM
                          FROM            DW.CENSUS_MSR_FACT CENSUS_MSR_FACT_2, DW.CENSUS_MSR_TYPE_DIM, DW.CENSUS_SRC_DIM
                          WHERE        CENSUS_MSR_FACT_2.MSR_TYPE_SK = DW.CENSUS_MSR_TYPE_DIM.MSR_TYPE_SK AND CENSUS_MSR_FACT_2.SRC_SK = DW.CENSUS_SRC_DIM.SRC_SK
                          GROUP BY DW.CENSUS_MSR_TYPE_DIM.SRC_MSR_TYPE_NM, DW.CENSUS_SRC_DIM.SRC_NM) AB')
,(56,'CensusSourceDim','CensusSourceDim','CensusSourceDim','SELECT     SRC_SK, SRC_DESC, SRC_YR, 
                  CASE WHEN SRC_ESTMTE_IN_YRS = ''1YR'' THEN ''ACS 1-Year'' WHEN SRC_ESTMTE_IN_YRS = ''3YR'' THEN ''ACS 3-Year'' WHEN SRC_ESTMTE_IN_YRS = ''5YR'' THEN ''ACS 5-Year'' WHEN SRC_ESTMTE_IN_YRS = ''SF1'' THEN ''Decennial Census'' END AS SRC_ESTMTE_IN_YRS
FROM        DW.CENSUS_SRC_DIM
WHERE     (IS_CRNT = 1)')
,(108,'qps_DM_Quality','DM_Quality_Fact','DM_Quality_Fact','SELECT     Data_ID, LO_CDS, SRC_DEPT_ID, Truven_Indicator, Source_Source_Measure_ID, Source_Measure_Title, Frequency, [Date], Result
FROM        qps.DM_Quality_Fact')
,(34,'DRGDim','DRGDim','DRGDim','SELECT     dd.DRG_CD_SK,dd.SRC_DRG_ID, dd.DRG_NM, dd.DRG_TYPE_CD AS DRG_CLASS, dd.TRNL_DRG_CD, CASE WHEN MDC_CD IS NULL 
                  THEN - 1 ELSE MDC_CD END AS MDC_CD, CASE WHEN MDC_NM IS NULL THEN ''Not Applicable'' ELSE MDC_NM END AS MDC_NM, sl.SVL_CD, sl.MSDRG_SVL
FROM        { oj CUBESPRD.DRG_CD_DIM dd LEFT OUTER JOIN
                  DW.V_MSDRG_SERVICE_LINE sl ON dd.TRNL_DRG_CD = sl.DRG }')
,(35,'DRGFact','DRGFact','DRGFact','SELECT ENCNT_DRG_SK
       , PRTY_SQNC
       , DRG_CD_SK
       , DRG_TYPE_CD
       , ACCT_SK
       , ENCNT_SK
       , PTNT_SK
       , ENCNT_DT
  FROM CUBESPRD.DRG_FACT')
,(37,'DRGSeqDim','DRGSeqDim','DRGSeqDim','SELECT DISTINCT PRTY_SQNC
      
  FROM CUBESPRD.DRG_FACT')
,(36,'DRGTypeDim','DRGTypeDim','DRGTypeDim','SELECT DISTINCT
        DRG_TYPE_CD
       , DRG_TYPE_DSPLY_NM
  FROM CUBESPRD.DRG_FACT')
,(1,'DW_CLNDR_DIM','DateDim','DateDim','SELECT        Date(CLNDR_DT) AS CLNDR_DT, CLNDR_DT_EPOCH, CLNDR_DT_FL_NM, CLNDR_DT_ABBR, CLNDR_CACHE_DT, YR_NUM, MTH_OF_YR_NUM, MTH_OF_YR_ABBR, MTH_OF_YR_NM, YR_AND_MTH_NUM, YR_AND_MTH_ABBR, 
                         YR_AND_MTH_NM, QTR_OF_YR_NUM, QTR_OF_YR_ABBR, YR_AND_QTR_NUM, YR_AND_QTR_ABBR, DY_OF_YR_NUM, DY_OF_MTH_NUM, DY_OF_WK_NUM, DY_OF_WK_ABBR, DY_OF_WK_NM, 
                         WK_OF_YR_NUM, PR_YR_NUM, PR_MTH_OF_YR_NUM, PR_MTH_OF_YR_ABBR, PR_MTH_OF_YR_NM, PR_YR_AND_MTH_NUM, PR_YR_AND_MTH_ABBR, PR_YR_AND_MTH_NM, PR_QTR_OF_YR_NUM, 
                         PR_QTR_OF_YR_ABBR, PR_YR_AND_QTR_NUM, PR_YR_AND_QTR_ABBR, FSCL_YR_NUM, FSCL_YR_BGN_DT, FSCL_YR_END_DT, FSCL_QTR_NUM, FSCL_QTR_ABBR, FSCL_QTR_BGN_DT, 
                         FSCL_QTR_END_DT, FSCL_MTH_NUM
FROM            DW.CLNDR_DIM WHERE YR_NUM >0')
,(5,'DepartmentDim','DepartmentDim','DepartmentDim','SELECT     DEPT_SK, SRC_DEPT_ID, DEPT_NM, DEPT_ABBR, ADDR, CITY, ST_PRV_CDS, ST_PRV_NM, ST_PRV_ABBR, PSTL_CDS, PH_NUM, RSTCT_IND, SPCLY_CDS, SPCLY_NM, PRFSNL_BILLNG_CL_CDS, PRFSNL_BILLNG_CL_NM, LO_CDS, LO_NM, SRVC_AREA_CDS, 
                  SRVC_AREA_NM, ALT_SRVC_AREA_CDS, ALT_SRVC_AREA_NM, ICU_DEPT_IND, PCU_DEPT_IND, LOC_TYPE_CDS, LOC_TYPE_DESC, FCM_Region_ID, FCM_Region_Name
FROM        cubesprd.DEPT_DIM')
,(31,'dbo_DIAG_BRIDGE','DiagnosisBridge','DiagnosisBridge','SELECT        DIAG_CD_SK, MSTR_DIAG_CD, DIAG_CD_DESC, ICD9_CD, ICD9_CD_LST, ICD10_CD, ICD10_CD_LST, DIAG_HIR_SK
FROM            DIAG_CD_DIM')
,(32,'LDW_DIAG_FACT','DiagnosisFact','DiagnosisFact','SELECT        DIAG_SK, DF.SRC_TYPE,SRC_DIAG_SQNC, 
CASE 
WHEN DF.DIAG_CD_SK < 0 THEN NULL ELSE DF.DIAG_CD_SK 
END AS DIAG_CD_SK, DF.PTNT_SK, ENCNT_SK, DEPT_SK, CHRNC_IND, PRMY_DIAG_IND, SCND_DIAG_IND, 
CASE 
WHEN (PRSNT_ON_ADMT_CD < 0) 
OR (PRSNT_ON_ADMT_CD IN (1410783,3)) THEN NULL ELSE CAST (PRSNT_ON_ADMT_CD AS INTEGER) 
END AS PRSNT_ON_ADMT_CD, ED_DIAG_IND, 
CASE 
WHEN DIAG_STRT_DT < ''1900-01-02''::"DATETIME" THEN NULL ELSE DIAG_STRT_DT 
END AS DIAG_STRT_DT, DIAG_STRT_TS_SK, 
CASE 
WHEN DIAG_END_DT = ''1000-01-02''::"DATETIME" OR DIAG_END_DT > ''2100-01-02''::"DATETIME" THEN NULL ELSE DIAG_END_DT 
END AS DIAG_END_DT, DIAG_END_TS_SK
FROM CUBESPRD.DIAG_FACT DF INNER JOIN CUBESPRD.DIAG_CD_DIM DCD ON DF.DIAG_CD_SK=DCD.DIAG_CD_SK INNER JOIN CUBESDEV.PTNT_DIM PD ON df.PTNT_SK=pd.PTNT_SK')
,(30,'dbo_DIAG_HYR_DIM','DiagnosisHierarchy','DiagnosisHierarchy','SELECT        DIAG_HIR_SK, DIAG_CLS_DESC, DIAG_PRN_SK
FROM            DIAG_HIR_DIM')
,(33,'DiagnosisPresentOnAdmit','DiagnosisPresentOnAdmitDim','DiagnosisPresentOnAdmitDim','SELECT    DISTINCT    CAST(PRSNT_ON_ADMT_CD AS INTEGER) AS PRSNT_ON_ADMT_CD, 
                          PRSNT_ON_ADMT_DESC
FROM CUBESPRD.DIAG_FACT  WHERE PRSNT_ON_ADMT_CD>0 AND PRSNT_ON_ADMT_CD<>1410783 AND PRSNT_ON_ADMT_DESC IS NOT NULL')
,(39,'DiagnosisSourceDim','DiagnosisSourceDim','DiagnosisSourceDim','SELECT DISTINCT
        SRC_TYPE
       , SRC_TYPE_DSPLY_NM
 FROM CUBESPRD.DIAG_FACT')
,(27,'EDVisitActivityLevelDim','EDVisitAcuityLevelDim','EDVisitAcuityLevelDim','SELECT DISTINCT
ACTY_LVL_CDS,
CASE WHEN ACTY_LVL_DESC=''IMMEDIATE'' THEN ''1 - IMMEDIATE'' 
WHEN ACTY_LVL_DESC=''EMERGENT'' THEN ''2 - EMERGENT'' 
WHEN ACTY_LVL_DESC=''URGENT'' THEN ''3 - URGENT'' 
WHEN ACTY_LVL_DESC=''LESS URGENT'' THEN ''4 - LESS URGENT'' 
WHEN ACTY_LVL_DESC=''NON-URGENT'' THEN ''5 - NON-URGENT'' 
END AS ACTY_LVL_DESC
FROM CUBESPRD.ED_VST_DIM
WHERE ACTY_LVL_CDS IS NOT NULL')
,(25,'EDVisitDim','EDVisitDim','EDVisitDim','SELECT DISTINCT EDPTNT_VST_SK
       , ENCNT_SK
       , PTNT_SK
       , SRC_ENCNT_ID
       , ED_DSPSTN_CDS
       , VST_FNNCL_CLSS_CDS
       , ACTY_LVL_CDS
       , MEANS_ARRVL_CDS
       , CASE WHEN PG_ER_SURVEY_ID IS NOT NULL THEN ''Yes'' ELSE ''No'' END AS PG_ER_SURVEYED
       , ER_ANALYSIS_A2_CDS
       , ER_ANALYSIS_A2
       , ER_ANALYSIS_A28_CDS
       , ER_ANALYSIS_A28
       , ER_ANALYSIS_A3_CDS
       , ER_ANALYSIS_A3
       , ER_ANALYSIS_A4_CDS
       , ER_ANALYSIS_A4
       , ER_ANALYSIS_A5_CDS
       , ER_ANALYSIS_A5
       , ER_ANALYSIS_A86_CDS
       , ER_ANALYSIS_A86
       , ER_ANALYSIS_A87_CDS
       , ER_ANALYSIS_A87
       , ER_ANALYSIS_B1_CDS
       , ER_ANALYSIS_B1
       , ER_ANALYSIS_B3_CDS
       , ER_ANALYSIS_B3
       , ER_ANALYSIS_B4_CDS
       , ER_ANALYSIS_B4
       , ER_ANALYSIS_B5_CDS
       , ER_ANALYSIS_B5
       , ER_ANALYSIS_B76_CDS
       , ER_ANALYSIS_B76
       , ER_ANALYSIS_C1_CDS
       , ER_ANALYSIS_C1
       , ER_ANALYSIS_C2_CDS
       , ER_ANALYSIS_C2
       , ER_ANALYSIS_C4_CDS
       , ER_ANALYSIS_C4
       , ER_ANALYSIS_C5_CDS
       , ER_ANALYSIS_C5
       , ER_ANALYSIS_C7_CDS
       , ER_ANALYSIS_C7
       , ER_ANALYSIS_C75_CDS
       , ER_ANALYSIS_C75
       , ER_ANALYSIS_D2_CDS
       , ER_ANALYSIS_D2
       , ER_ANALYSIS_D3_CDS
       , ER_ANALYSIS_D3
       , ER_ANALYSIS_D4_CDS
       , ER_ANALYSIS_D4
       , ER_ANALYSIS_D52_CDS
       , ER_ANALYSIS_D52
       , ER_ANALYSIS_D65_CDS
       , ER_ANALYSIS_D65
       , ER_ANALYSIS_E1_CDS
       , ER_ANALYSIS_E1
       , ER_ANALYSIS_E2_CDS
       , ER_ANALYSIS_E2
       , ER_ANALYSIS_E3_CDS
       , ER_ANALYSIS_E3
       , ER_DEMOGRAPHICS_EDCP1
       , ER_DEMOGRAPHICS_EDCP1_CDS
       , ER_DEMOGRAPHICS_EDCP10
       , ER_DEMOGRAPHICS_EDCP10_CDS
       , ER_DEMOGRAPHICS_EDCP11
       , ER_DEMOGRAPHICS_EDCP11_CDS
       , ER_DEMOGRAPHICS_EDCP12
       , ER_DEMOGRAPHICS_EDCP12_CDS
       , ER_DEMOGRAPHICS_EDCP13
       , ER_DEMOGRAPHICS_EDCP13_CDS
       , ER_DEMOGRAPHICS_EDCP16
       , ER_DEMOGRAPHICS_EDCP16_CDS
       , ER_DEMOGRAPHICS_EDCP17
       , ER_DEMOGRAPHICS_EDCP17_CDS
       , ER_DEMOGRAPHICS_EDCP2
       , ER_DEMOGRAPHICS_EDCP2_CDS
       , ER_DEMOGRAPHICS_EDCP22
       , ER_DEMOGRAPHICS_EDCP22_CDS
       , ER_DEMOGRAPHICS_EDCP23
       , ER_DEMOGRAPHICS_EDCP23_CDS
       , ER_DEMOGRAPHICS_EDCP24
       , ER_DEMOGRAPHICS_EDCP24_CDS
       , ER_DEMOGRAPHICS_EDCP25
       , ER_DEMOGRAPHICS_EDCP25_CDS
       , ER_DEMOGRAPHICS_EDCP26
       , ER_DEMOGRAPHICS_EDCP26_CDS
       , ER_DEMOGRAPHICS_EDCP27
       , ER_DEMOGRAPHICS_EDCP27_CDS
       , ER_DEMOGRAPHICS_EDCP28
       , ER_DEMOGRAPHICS_EDCP28_CDS
       , ER_DEMOGRAPHICS_EDCP29
       , ER_DEMOGRAPHICS_EDCP29_CDS
       , ER_DEMOGRAPHICS_EDCP3
       , ER_DEMOGRAPHICS_EDCP3_CDS
       , ER_DEMOGRAPHICS_EDCP30
       , ER_DEMOGRAPHICS_EDCP30_CDS
       , ER_DEMOGRAPHICS_EDCP31
       , ER_DEMOGRAPHICS_EDCP31_CDS
       , ER_DEMOGRAPHICS_EDCP32
       , ER_DEMOGRAPHICS_EDCP32_CDS
       , ER_DEMOGRAPHICS_EDCP33
       , ER_DEMOGRAPHICS_EDCP33_CDS
       , ER_DEMOGRAPHICS_EDCP35
       , ER_DEMOGRAPHICS_EDCP35_CDS
       , ER_DEMOGRAPHICS_EDCP36
       , ER_DEMOGRAPHICS_EDCP36_CDS
       , ER_DEMOGRAPHICS_EDCP37
       , ER_DEMOGRAPHICS_EDCP37_CDS
       , ER_DEMOGRAPHICS_EDCP39
       , ER_DEMOGRAPHICS_EDCP39_CDS
       , ER_DEMOGRAPHICS_EDCP4
       , ER_DEMOGRAPHICS_EDCP4_CDS
       , ER_DEMOGRAPHICS_EDCP40
       , ER_DEMOGRAPHICS_EDCP40_CDS
       , ER_DEMOGRAPHICS_EDCP41
       , ER_DEMOGRAPHICS_EDCP41_CDS
       , ER_DEMOGRAPHICS_EDCP42
       , ER_DEMOGRAPHICS_EDCP42_CDS
       , ER_DEMOGRAPHICS_EDCP43
       , ER_DEMOGRAPHICS_EDCP43_CDS
       , ER_DEMOGRAPHICS_EDCP48
       , ER_DEMOGRAPHICS_EDCP48_CDS
       , ER_DEMOGRAPHICS_EDCP59
       , ER_DEMOGRAPHICS_EDCP59_CDS
       , ER_DEMOGRAPHICS_EDCP6
       , ER_DEMOGRAPHICS_EDCP6_CDS
       , ER_DEMOGRAPHICS_EDCP61
       , ER_DEMOGRAPHICS_EDCP61_CDS
       , ER_DEMOGRAPHICS_EDCP62_CDS
       , ER_DEMOGRAPHICS_EDCP62
       , ER_DEMOGRAPHICS_EDCP63_CDS
       , ER_DEMOGRAPHICS_EDCP63
       , ER_DEMOGRAPHICS_EDCP64_CDS
       , ER_DEMOGRAPHICS_EDCP64
       , ER_DEMOGRAPHICS_EDCP65_CDS
       , ER_DEMOGRAPHICS_EDCP65
       , ER_DEMOGRAPHICS_EDCP9_CDS
       , ER_DEMOGRAPHICS_EDCP9
       , ER_ANALYSIS_F1_CDS
       , ER_ANALYSIS_F1
       , ER_ANALYSIS_F2_CDS
       , ER_ANALYSIS_F2
       , ER_ANALYSIS_F4_CDS
       , ER_ANALYSIS_F4
       , ER_ANALYSIS_F41_CDS
       , ER_ANALYSIS_F41
       , ER_ANALYSIS_F68_CDS
       , ER_ANALYSIS_F68
       , ER_ANALYSIS_Q11822_1_CDS
       , ER_ANALYSIS_Q11822_1
--     , ER_DEMOGRAPHICS_DISTRIB
--     , ER_DEMOGRAPHICS_DISTRIB_CDS
       , CASE WHEN PG_PE_SURVEY_ID IS NOT NULL THEN ''Yes'' ELSE ''No'' END AS PG_PE_SURVEYED
       , PE_ANALYSIS_A2_CDS
       , PE_ANALYSIS_A2
       , PE_ANALYSIS_A20_CDS
       , PE_ANALYSIS_A20
       , PE_ANALYSIS_A24_CDS
       , PE_ANALYSIS_A24
       , PE_ANALYSIS_A25_CDS
       , PE_ANALYSIS_A25
       , PE_ANALYSIS_A3_CDS
       , PE_ANALYSIS_A3
       , PE_ANALYSIS_A4_CDS
       , PE_ANALYSIS_A4
       , PE_ANALYSIS_A5_CDS
       , PE_ANALYSIS_A5
       , PE_ANALYSIS_A7_CDS
       , PE_ANALYSIS_A7
       , PE_ANALYSIS_B1_CDS
       , PE_ANALYSIS_B1
       , PE_ANALYSIS_B11_CDS
       , PE_ANALYSIS_B11
       , PE_ANALYSIS_B3_CDS
       , PE_ANALYSIS_B3
       , PE_ANALYSIS_B4_CDS
       , PE_ANALYSIS_B4
       , PE_ANALYSIS_B5_CDS
       , PE_ANALYSIS_B5
       , PE_ANALYSIS_C1_CDS
       , PE_ANALYSIS_C1
       , PE_ANALYSIS_C2_CDS
       , PE_ANALYSIS_C2
       , PE_ANALYSIS_C4_CDS
       , PE_ANALYSIS_C4
       , PE_ANALYSIS_C5_CDS
       , PE_ANALYSIS_C5
       , PE_ANALYSIS_C6_CDS
       , PE_ANALYSIS_C6
       , PE_ANALYSIS_C9_CDS
       , PE_ANALYSIS_C9
       , PE_ANALYSIS_D14_CDS
       , PE_ANALYSIS_D14
       , PE_ANALYSIS_D15_CDS
       , PE_ANALYSIS_D15
       , PE_ANALYSIS_D2_CDS
       , PE_ANALYSIS_D2
       , PE_ANALYSIS_D3_CDS
       , PE_ANALYSIS_D3
       , PE_ANALYSIS_D4_CDS
       , PE_ANALYSIS_D4
       , PE_ANALYSIS_F1_CDS
       , PE_ANALYSIS_F1
       , PE_ANALYSIS_F15_CDS
       , PE_ANALYSIS_F15
       , PE_ANALYSIS_F2_CDS
       , PE_ANALYSIS_F2
       , PE_ANALYSIS_F20_CDS
       , PE_ANALYSIS_F20
       , PE_ANALYSIS_F4_CDS
       , PE_ANALYSIS_F4
--     , PE_DEMOGRAPHICS_DISTRIB
--     , PE_DEMOGRAPHICS_DISTRIB_CDS
  FROM CUBESPRD.ED_VST_DIM')
,(26,'EDVisitDispositionDim','EDVisitDispositionDim','EDVisitDispositionDim','SELECT DISTINCT
ED_DSPSTN_CDS,
ED_DSPSTN_DESC
FROM CUBESPRD.ED_VST_DIM
WHERE ED_DSPSTN_CDS IS NOT NULL')
,(29,'EDVisitFact','EDVisitFact','EDVisitFact','SELECT DISTINCT EDPTNT_VST_SK
       , ENCNT_SK
       , PTNT_SK
       , HSP_DSCRG_DT
       , HSP_DSCRG_TS_SK
       , ARRVL_DT
       , ARRVL_TS_SK
       , ED_DSCRG_DT
       , ED_DSCRG_TS_SK
       , DSPSTN_INSTNT_DT
       , DSPSTN_INSTNT_TS_SK
       , FRST_NONED_DEPT_ARRVL_DT
       , FRST_NONED_DEPT_ARRVL_TS_SK
       , AVS_PRNT_INSTNT_DT
       , AVS_PRNT_INSTNT_TS_SK
       , AGE_YRS_AT_ENCNT
       , AGE_MNTHS_AT_ENCNT
       , AGE_DYS_AT_ENCNT
       , ADMT_DEPT_SK
       , FRST_NON_ED_DEPT_SK
       , PAT_RMD_DT
       , PAT_RMD_TS_SK
       , REG_CMPLTD_DT
       , REG_CMPLTD_TS_SK
       , TRGE_START_DT
       , TRGE_START_TS_SK
       , TRGE_CMPLTD_DT
       , TRGE_CMPLTD_TS_SK
       , FRST_ATTND_DT
       , FRST_ATTND_TS_SK
       , LAB_ORDRD_DT
       , LAB_ORDRD_TS_SK
       , LAB_CMPLTD_DT
       , LAB_CMPLTD_TS_SK
       , LAB_PRVDR_RVW_DT
       , LAB_PRVDR_RVW_TS_SK
       , IMG_ORDRD_DT
       , IMG_ORDRD_TS_SK
       , IMG_TST_CMPLTD_DT
       , IMG_TST_CMPLTD_TS_SK
       , IMG_PRVDR_RVW_DT
       , IMG_PRVDR_RVW_TS_SK
       , BED_RQST_DT
       , BED_RQST_TS_SK
       , CASE WHEN ARRV_TO_REG_CMPLTD < 0 THEN NULL ELSE ARRV_TO_REG_CMPLTD END AS ARRV_TO_REG_CMPLTD
	   , CASE WHEN ARRV_TO_REG_CMPLTD=0 THEN 0 WHEN ARRV_TO_REG_CMPLTD<0 THEN NULL ELSE Log(ARRV_TO_REG_CMPLTD)END As ARRV_TO_REG_CMPLTD_Log
       , CASE WHEN ARRV_TO_TRG_STRT < 0 THEN NULL ELSE ARRV_TO_TRG_STRT END AS ARRV_TO_TRG_STRT
       , CASE WHEN ARRV_TO_TRG_STRT=0 THEN 0 WHEN ARRV_TO_TRG_STRT<0 THEN NULL ELSE Log(ARRV_TO_TRG_STRT)END As ARRV_TO_TRG_STRT_Log
       , CASE WHEN TRG_STRT_TO_TRG_CMPLTD < 0 THEN NULL ELSE TRG_STRT_TO_TRG_CMPLTD END AS TRG_STRT_TO_TRG_CMPLTD
       , CASE WHEN TRG_STRT_TO_TRG_CMPLTD=0 THEN 0 WHEN TRG_STRT_TO_TRG_CMPLTD<0 THEN NULL ELSE Log(TRG_STRT_TO_TRG_CMPLTD)END As TRG_STRT_TO_TRG_CMPLTD_Log
       , CASE WHEN TRG_STRT_TO_PTNT_RMD < 0 THEN NULL ELSE TRG_STRT_TO_PTNT_RMD END AS TRG_STRT_TO_PTNT_RMD
       , CASE WHEN TRG_STRT_TO_PTNT_RMD=0 THEN 0 WHEN TRG_STRT_TO_PTNT_RMD<0 THEN NULL ELSE Log(TRG_STRT_TO_PTNT_RMD)END As TRG_STRT_TO_PTNT_RMD_Log
       , CASE WHEN BED_RQST_TO_PTNT_RMD < 0 THEN NULL ELSE BED_RQST_TO_PTNT_RMD END AS BED_RQST_TO_PTNT_RMD
       , CASE WHEN BED_RQST_TO_PTNT_RMD=0 THEN 0 WHEN BED_RQST_TO_PTNT_RMD<0 THEN NULL ELSE Log(BED_RQST_TO_PTNT_RMD)END As BED_RQST_TO_PTNT_RMD_Log
       , CASE WHEN TRG_CMPLTD_TO_PTNT_RMD < 0 THEN NULL ELSE TRG_CMPLTD_TO_PTNT_RMD END AS TRG_CMPLTD_TO_PTNT_RMD
       , CASE WHEN TRG_CMPLTD_TO_PTNT_RMD=0 THEN 0 WHEN TRG_CMPLTD_TO_PTNT_RMD<0 THEN NULL ELSE Log(TRG_CMPLTD_TO_PTNT_RMD)END As TRG_CMPLTD_TO_PTNT_RMD_Log
       , CASE WHEN TRG_CMPLTD_TO_ASSGN_ATTND < 0 THEN NULL ELSE TRG_CMPLTD_TO_ASSGN_ATTND END AS TRG_CMPLTD_TO_ASSGN_ATTND
       , CASE WHEN TRG_CMPLTD_TO_ASSGN_ATTND=0 THEN 0 WHEN TRG_CMPLTD_TO_ASSGN_ATTND<0 THEN NULL ELSE Log(TRG_CMPLTD_TO_ASSGN_ATTND)END As TRG_CMPLTD_TO_ASSGN_ATTND_Log
       , CASE WHEN PTNT_RMD_TO_ASSGN_ATTND < 0 THEN NULL ELSE PTNT_RMD_TO_ASSGN_ATTND END AS PTNT_RMD_TO_ASSGN_ATTND
       , CASE WHEN PTNT_RMD_TO_ASSGN_ATTND=0 THEN 0 WHEN PTNT_RMD_TO_ASSGN_ATTND<0 THEN NULL ELSE Log(PTNT_RMD_TO_ASSGN_ATTND)END As PTNT_RMD_TO_ASSGN_ATTND_Log
       , CASE WHEN ASSGN_ATTND_TO_DSPSTN < 0 THEN NULL ELSE ASSGN_ATTND_TO_DSPSTN END AS ASSGN_ATTND_TO_DSPSTN
       , CASE WHEN ASSGN_ATTND_TO_DSPSTN=0 THEN 0 WHEN ASSGN_ATTND_TO_DSPSTN<0 THEN NULL ELSE Log(ASSGN_ATTND_TO_DSPSTN)END As ASSGN_ATTND_TO_DSPSTN_Log
       , CASE WHEN DSPTN_TO_ED_DSCRG < 0 THEN NULL ELSE DSPTN_TO_ED_DSCRG END AS DSPTN_TO_ED_DSCRG
       , CASE WHEN DSPTN_TO_ED_DSCRG=0 THEN 0 WHEN DSPTN_TO_ED_DSCRG<0 THEN NULL ELSE Log(DSPTN_TO_ED_DSCRG)END As DSPTN_TO_ED_DSCRG_Log
       , CASE WHEN AVS_PRNTD_TO_ED_DSCRG < 0 THEN NULL ELSE AVS_PRNTD_TO_ED_DSCRG END AS AVS_PRNTD_TO_ED_DSCRG
       , CASE WHEN AVS_PRNTD_TO_ED_DSCRG=0 THEN 0 WHEN AVS_PRNTD_TO_ED_DSCRG<0 THEN NULL ELSE Log(AVS_PRNTD_TO_ED_DSCRG)END As AVS_PRNTD_TO_ED_DSCRG_Log
       , CASE WHEN ARRV_TO_LAB_ORDRD < 0 THEN NULL ELSE ARRV_TO_LAB_ORDRD END AS ARRV_TO_LAB_ORDRD
       , CASE WHEN ARRV_TO_LAB_ORDRD=0 THEN 0 WHEN ARRV_TO_LAB_ORDRD<0 THEN NULL ELSE Log(ARRV_TO_LAB_ORDRD)END As ARRV_TO_LAB_ORDRD_Log
       , CASE WHEN LAB_ORDRD_TO_CMPLTD < 0 THEN NULL ELSE LAB_ORDRD_TO_CMPLTD END AS LAB_ORDRD_TO_CMPLTD
       , CASE WHEN LAB_ORDRD_TO_CMPLTD=0 THEN 0 WHEN LAB_ORDRD_TO_CMPLTD<0 THEN NULL ELSE Log(LAB_ORDRD_TO_CMPLTD)END As LAB_ORDRD_TO_CMPLTD_Log
       , CASE WHEN LAB_CMPLTD_TO_PRVDR_RVW < 0 THEN NULL ELSE LAB_CMPLTD_TO_PRVDR_RVW END AS LAB_CMPLTD_TO_PRVDR_RVW
       , CASE WHEN LAB_CMPLTD_TO_PRVDR_RVW=0 THEN 0 WHEN LAB_CMPLTD_TO_PRVDR_RVW<0 THEN NULL ELSE Log(LAB_CMPLTD_TO_PRVDR_RVW)END As LAB_CMPLTD_TO_PRVDR_RVW_Log
       , CASE WHEN ARRV_TO_IMG_ORDRD < 0 THEN NULL ELSE ARRV_TO_IMG_ORDRD END AS ARRV_TO_IMG_ORDRD
       , CASE WHEN ARRV_TO_IMG_ORDRD=0 THEN 0 WHEN ARRV_TO_IMG_ORDRD<0 THEN NULL ELSE Log(ARRV_TO_IMG_ORDRD)END As ARRV_TO_IMG_ORDRD_Log
       , CASE WHEN IMG_TST_ORDRD_TO_CMPLTD < 0 THEN NULL ELSE IMG_TST_ORDRD_TO_CMPLTD END AS IMG_TST_ORDRD_TO_CMPLTD
       , CASE WHEN IMG_TST_ORDRD_TO_CMPLTD=0 THEN 0 WHEN IMG_TST_ORDRD_TO_CMPLTD<0 THEN NULL ELSE Log(IMG_TST_ORDRD_TO_CMPLTD)END As IMG_TST_ORDRD_TO_CMPLTD_Log
       , CASE WHEN IMG_TST_CMPLTD_TO_PRVDR_RVW < 0 THEN NULL ELSE IMG_TST_CMPLTD_TO_PRVDR_RVW END AS IMG_TST_CMPLTD_TO_PRVDR_RVW
       , CASE WHEN IMG_TST_CMPLTD_TO_PRVDR_RVW=0 THEN 0 WHEN IMG_TST_CMPLTD_TO_PRVDR_RVW<0 THEN NULL ELSE Log(IMG_TST_CMPLTD_TO_PRVDR_RVW)END As IMG_TST_CMPLTD_TO_PRVDR_RVW_Log
       , CASE WHEN ARRV_TO_ED_DSCRG < 0 THEN NULL ELSE ARRV_TO_ED_DSCRG END AS ARRV_TO_ED_DSCRG
       , CASE WHEN ARRV_TO_ED_DSCRG=0 THEN 0 WHEN ARRV_TO_ED_DSCRG<0 THEN NULL ELSE Log(ARRV_TO_ED_DSCRG)END As ARRV_TO_ED_DSCRG_Log
       , GLSGW_VAL
       , CASE WHEN GLSGW_VAL=0 THEN 0 WHEN GLSGW_VAL<0 THEN NULL ELSE Log(GLSGW_VAL)END As GLSGW_VAL_Log
FROM CUBESPRD.ED_VST_FACT')
,(53,'EDVisitFinancialClass','EDVisitFinancialClass','EDVisitFinancialClass','SELECT DISTINCT
VST_FNNCL_CLSS_CDS,
VST_FNNCL_CLSS_DESC
FROM CUBESPRD.ED_VST_DIM')
,(28,'EDVisitMeansOfArrivalDim','EDVisitMeansOfArrivalDim','EDVisitMeansOfArrivalDim','SELECT DISTINCT 
MEANS_ARRVL_CDS,
MEANS_ARRVL_DESC
FROM CUBESPRD.ED_VST_DIM')
,(139,'EncounterBillingClassDim','EncounterBillingClassDim','EncounterBillingClassDim','SELECT DISTINCT 
BILLING_CLASS_CDS,
BILLING_CLASS_DESC
FROM CUBESPRD.ENCNT_DIM WHERE BILLING_CLASS_CDS IS NOT NULL')
,(138,'EncounterDepartmentDim','EncounterDepartmentDim','EncounterDepartmentDim','SELECT DISTINCT 
DEPT_CDS,
DEPT_DESC
FROM CUBESPRD.ENCNT_DIM WHERE DEPT_CDS IS NOT NULL')
,(3,'DW_ENCNT_DIM','EncounterDim','EncounterDim','SELECT ENCNT_SK,
SRC_ENCNT_ID,
PTNT_STS_CDS, 
ENCNT_TYPE_CDS, 
LEVL_OF_CARE_CDS,
PTNT_BSE_CLSS_CDS, 
CASE WHEN TRAUMA_IND= 0 THEN ''NO'' WHEN TRAUMA_IND= 1 THEN ''YES'' ELSE NULL END AS TRAUMA_IND,
AGE_YRS_AT_ENCNT,
AGE_MNTHS_AT_ENCNT,
AGE_DYS_AT_ENCNT,
PRD_LINE_CDS,
BILLING_CLASS_CDS,
DEPT_CDS
--, SECTION_CDS
FROM CUBESPRD.ENCNT_DIM')
,(13,'EncounterEncouterypeDim','EncounterEncouterTypeDim','EncounterEncouterTypeDim','SELECT DISTINCT 
ENCNT_TYPE_CDS, ENCNT_TYPE_DESC
FROM CUBESPRD.ENCNT_DIM')
,(4,'DW_ENCNT_FACT','EncounterFact','EncounterFact','SELECT ENCNT_FACT_SK
       , ENCNT_SK
       , PTNT_SK
       , DEPT_SK
       , ENCNT_DT
       , AGE_YRS_AT_ENCNT
       , AGE_MNTHS_AT_ENCNT
       , AGE_DYS_AT_ENCNT
       , ENCNT_WAIT_IN_DAYS
  FROM CUBESPRD.ENCNT_FACT')
,(16,'EncounterLevelofCareDim','EncounterLevelofCareDim','EncounterLevelofCareDim','SELECT DISTINCT 
LEVL_OF_CARE_CDS, LEVL_OF_CARE_DESC
FROM CUBESPRD.ENCNT_DIM WHERE LEVL_OF_CARE_CDS IS NOT NULL')
,(15,'EncounterPatientStatusDim','EncounterPatientStatusDim','EncounterPatientStatusDim','SELECT DISTINCT 
PTNT_STS_CDS, PTNT_STS_DESC
FROM CUBESPRD.ENCNT_DIM WHERE PTNT_STS_CDS IS NOT NULL')
,(137,'EncounterProductLineDim','EncounterProductLineDim','EncounterProductLineDim','SELECT DISTINCT 
PRD_LINE_CDS,
PROD_LINE_DESC
FROM CUBESPRD.ENCNT_DIM WHERE PRD_LINE_CDS IS NOT NULL')
,(14,'EncouterBaseClassDim','EncouterBaseClassDim','EncouterBaseClassDim','SELECT DISTINCT
PTNT_BSE_CLSS_CDS, PTNT_BSE_CLSS_NM
FROM  CUBESPRD.ENCNT_DIM')
,(9,'InpatientAdmitSourceDim','InpatientAdmitSourceDim','InpatientAdmitSourceDim','SELECT DISTINCT
ADMT_SRC_CDS, 
ADMT_SRC_DESC 
FROM CUBESPRD.INPTNT_DIM WHERE ADMT_SRC_CDS IS NOT NULL')
,(10,'InpatientAdmitTypeDim','InpatientAdmitTypeDim','InpatientAdmitTypeDim','SELECT DISTINCT ADMT_TYPE_CDS, ADMT_TYPE_DESC
FROM CUBESPRD.INPTNT_DIM WHERE TRIM(ADMT_TYPE_CDS) IS NOT NULL')
,(6,'InpatientDim','InpatientDim','InpatientDim','SELECT   I.INPTNT_VST_SK
       , IF.ENCNT_SK
       , I.SRC_ENCNT_ID
       , PTNT_CL_CDS
       , ADMT_SRC_CDS
       , ADMT_TYPE_CDS
       , DSCRG_DSPSTN_CDS
       , DSCRG_DSTN_CDS
       , I.AGE_YRS_AT_CLNC_INPTNT_ADMT
       , I.AGE_MNTHS_AT_CLNC_INPTNT_ADMT
       , I.AGE_DYS_AT_CLNC_INPTNT_ADMT
       , I.LOS_DYS_CLNC_INPTNT
       , I.LOS_HRS_CLNC_INPTNT
       , I.AGE_YRS_AT_CLNC_ADMT
       , I.AGE_MNTHS_AT_CLNC_ADMT
       , I.AGE_DYS_AT_CLNC_ADMT
       , I.LOS_DYS_CLNC
       , I.LOS_HRS_CLNC
       , 
CASE 
WHEN AMI_1 = -1 THEN ''Non-eligible'' WHEN AMI_1 = 0 THEN ''Eligible'' WHEN AMI_1 = 1 THEN ''Positive'' END As AMI_1
       , 
CASE 
WHEN AMI_2 = -1 THEN ''Non-eligible'' WHEN AMI_2 = 0 THEN ''Eligible'' WHEN AMI_2 = 1 THEN ''Positive'' END As AMI_2
       , 
CASE 
WHEN AMI_3 = -1 THEN ''Non-eligible'' WHEN AMI_3 = 0 THEN ''Eligible'' WHEN AMI_3 = 1 THEN ''Positive'' END As AMI_3
       , 
CASE 
WHEN AMI_5 = -1 THEN ''Non-eligible'' WHEN AMI_5 = 0 THEN ''Eligible'' WHEN AMI_5 = 1 THEN ''Positive'' END As AMI_5
       , 
CASE 
WHEN AMI_7 = -1 THEN ''Non-eligible'' WHEN AMI_7 = 0 THEN ''Eligible'' WHEN AMI_7 = 1 THEN ''Positive'' END As AMI_7
       , 
CASE 
WHEN AMI_7A = -1 THEN ''Non-eligible'' WHEN AMI_7A = 0 THEN ''Eligible'' WHEN AMI_7A = 1 THEN ''Positive'' END As AMI_7A
       , 
CASE 
WHEN AMI_8 = -1 THEN ''Non-eligible'' WHEN AMI_8 = 0 THEN ''Eligible'' WHEN AMI_8 = 1 THEN ''Positive'' END As AMI_8
       , 
CASE 
WHEN AMI_8A = -1 THEN ''Non-eligible'' WHEN AMI_8A = 0 THEN ''Eligible'' WHEN AMI_8A = 1 THEN ''Positive'' END As AMI_8A
       , 
CASE 
WHEN AMI_10 = -1 THEN ''Non-eligible'' WHEN AMI_10 = 0 THEN ''Eligible'' WHEN AMI_10 = 1 THEN ''Positive'' END As AMI_10
       , 
CASE 
WHEN ED_1A = -1 THEN ''Non-eligible'' WHEN ED_1A = 0 THEN ''Eligible'' WHEN ED_1A = 1 THEN ''Positive'' END As ED_1A
       , 
CASE 
WHEN ED_1B = -1 THEN ''Non-eligible'' WHEN ED_1B = 0 THEN ''Eligible'' WHEN ED_1B = 1 THEN ''Positive'' END As ED_1B
       , 
CASE 
WHEN ED_1C = -1 THEN ''Non-eligible'' WHEN ED_1C = 0 THEN ''Eligible'' WHEN ED_1C = 1 THEN ''Positive'' END As ED_1C
       , 
CASE 
WHEN ED_2A = -1 THEN ''Non-eligible'' WHEN ED_2A = 0 THEN ''Eligible'' WHEN ED_2A = 1 THEN ''Positive'' END As ED_2A
       , 
CASE 
WHEN ED_2B = -1 THEN ''Non-eligible'' WHEN ED_2B = 0 THEN ''Eligible'' WHEN ED_2B = 1 THEN ''Positive'' END As ED_2B
       , 
CASE 
WHEN ED_2C = -1 THEN ''Non-eligible'' WHEN ED_2C = 0 THEN ''Eligible'' WHEN ED_2C = 1 THEN ''Positive'' END As ED_2C
       , 
CASE 
WHEN HF_1 = -1 THEN ''Non-eligible'' WHEN HF_1 = 0 THEN ''Eligible'' WHEN HF_1 = 1 THEN ''Positive'' END As HF_1
       , 
CASE 
WHEN HF_2 = -1 THEN ''Non-eligible'' WHEN HF_2 = 0 THEN ''Eligible'' WHEN HF_2 = 1 THEN ''Positive'' END As HF_2
       , 
CASE 
WHEN HF_3 = -1 THEN ''Non-eligible'' WHEN HF_3 = 0 THEN ''Eligible'' WHEN HF_3 = 1 THEN ''Positive'' END As HF_3
        , 
CASE 
WHEN  IMM_1A = -1 THEN ''Non-eligible'' WHEN   IMM_1A = 0 THEN ''Eligible'' WHEN  IMM_1A  = 1 THEN ''Positive'' END As  IMM_1A
       , 
CASE 
WHEN  IMM_1B = -1 THEN ''Non-eligible'' WHEN    IMM_1B = 0 THEN ''Eligible'' WHEN  IMM_1B  = 1 THEN ''Positive'' END As  IMM_1B
       , 
CASE 
WHEN  IMM_1C = -1 THEN ''Non-eligible'' WHEN   IMM_1C = 0 THEN ''Eligible'' WHEN  IMM_1C  = 1 THEN ''Positive'' END As  IMM_1C
       , 
CASE 
WHEN  IMM_2 = -1 THEN ''Non-eligible'' WHEN   IMM_2 = 0 THEN ''Eligible'' WHEN  IMM_2  = 1 THEN ''Positive'' END As  IMM_2
       , 
CASE 
WHEN  PN_3A = -1 THEN ''Non-eligible'' WHEN   PN_3A = 0 THEN ''Eligible'' WHEN  PN_3A  = 1 THEN ''Positive'' END As  PN_3A
       , 
CASE 
WHEN  PN_3B = -1 THEN ''Non-eligible'' WHEN   PN_3B = 0 THEN ''Eligible'' WHEN  PN_3B  = 1 THEN ''Positive'' END As  PN_3B
       , 
CASE 
WHEN  PN_6 = -1 THEN ''Non-eligible'' WHEN   PN_6 = 0 THEN ''Eligible'' WHEN  PN_6  = 1 THEN ''Positive'' END As  PN_6
       , 
CASE 
WHEN  PN_6A = -1 THEN ''Non-eligible'' WHEN   PN_6A = 0 THEN ''Eligible'' WHEN  PN_6A  = 1 THEN ''Positive'' END As  PN_6A
       , 
CASE 
WHEN  PN_6B = -1 THEN ''Non-eligible'' WHEN   PN_6B = 0 THEN ''Eligible'' WHEN  PN_6B  = 1 THEN ''Positive'' END As  PN_6B
       , 
CASE 
WHEN  SCIP_CARD_2 = -1 THEN ''Non-eligible'' WHEN   SCIP_CARD_2 = 0 THEN ''Eligible'' WHEN  SCIP_CARD_2  = 1 THEN ''Positive'' END As  SCIP_CARD_2
       , 
CASE 
WHEN  SCIP_INF_1A = -1 THEN ''Non-eligible'' WHEN   SCIP_INF_1A = 0 THEN ''Eligible'' WHEN  SCIP_INF_1A  = 1 THEN ''Positive'' END As  SCIP_INF_1A
       , 
CASE 
WHEN  SCIP_INF_1B = -1 THEN ''Non-eligible'' WHEN   SCIP_INF_1B = 0 THEN ''Eligible'' WHEN  SCIP_INF_1B  = 1 THEN ''Positive'' END As  SCIP_INF_1B
       , 
CASE 
WHEN  SCIP_INF_1C = -1 THEN ''Non-eligible'' WHEN   SCIP_INF_1C = 0 THEN ''Eligible'' WHEN  SCIP_INF_1C  = 1 THEN ''Positive'' END As  SCIP_INF_1C
       , 
CASE 
WHEN  SCIP_INF_1D = -1 THEN ''Non-eligible'' WHEN   SCIP_INF_1D = 0 THEN ''Eligible'' WHEN  SCIP_INF_1D  = 1 THEN ''Positive'' END As  SCIP_INF_1D
       , 
CASE 
WHEN  SCIP_INF_1E = -1 THEN ''Non-eligible'' WHEN   SCIP_INF_1E = 0 THEN ''Eligible'' WHEN  SCIP_INF_1E  = 1 THEN ''Positive'' END As  SCIP_INF_1E
       , 
CASE 
WHEN  SCIP_INF_1F = -1 THEN ''Non-eligible'' WHEN   SCIP_INF_1F = 0 THEN ''Eligible'' WHEN  SCIP_INF_1F  = 1 THEN ''Positive'' END As  SCIP_INF_1F
       , 
CASE 
WHEN  SCIP_INF_1G = -1 THEN ''Non-eligible'' WHEN   SCIP_INF_1G = 0 THEN ''Eligible'' WHEN  SCIP_INF_1G  = 1 THEN ''Positive'' END As  SCIP_INF_1G
       , 
CASE 
WHEN  SCIP_INF_1H = -1 THEN ''Non-eligible'' WHEN   SCIP_INF_1H = 0 THEN ''Eligible'' WHEN  SCIP_INF_1H  = 1 THEN ''Positive'' END As  SCIP_INF_1H
       , 
CASE 
WHEN  SCIP_INF_2A = -1 THEN ''Non-eligible'' WHEN   SCIP_INF_2A = 0 THEN ''Eligible'' WHEN  SCIP_INF_2A  = 1 THEN ''Positive'' END As  SCIP_INF_2A
       , 
CASE 
WHEN  SCIP_INF_2B = -1 THEN ''Non-eligible'' WHEN   SCIP_INF_2B = 0 THEN ''Eligible'' WHEN  SCIP_INF_2B  = 1 THEN ''Positive'' END As  SCIP_INF_2B
       , 
CASE 
WHEN  SCIP_INF_2C = -1 THEN ''Non-eligible'' WHEN   SCIP_INF_2C = 0 THEN ''Eligible'' WHEN  SCIP_INF_2C  = 1 THEN ''Positive'' END As  SCIP_INF_2C
       , 
CASE 
WHEN  SCIP_INF_2D = -1 THEN ''Non-eligible'' WHEN   SCIP_INF_2D = 0 THEN ''Eligible'' WHEN  SCIP_INF_2D  = 1 THEN ''Positive'' END As  SCIP_INF_2D
       , 
CASE 
WHEN  SCIP_INF_2E = -1 THEN ''Non-eligible'' WHEN   SCIP_INF_2E = 0 THEN ''Eligible'' WHEN  SCIP_INF_2E  = 1 THEN ''Positive'' END As  SCIP_INF_2E
       , 
CASE 
WHEN  SCIP_INF_2F = -1 THEN ''Non-eligible'' WHEN   SCIP_INF_2F = 0 THEN ''Eligible'' WHEN  SCIP_INF_2F  = 1 THEN ''Positive'' END As  SCIP_INF_2F
       , 
CASE 
WHEN  SCIP_INF_2G = -1 THEN ''Non-eligible'' WHEN   SCIP_INF_2G = 0 THEN ''Eligible'' WHEN  SCIP_INF_2G  = 1 THEN ''Positive'' END As  SCIP_INF_2G
       , 
CASE 
WHEN  SCIP_INF_2H = -1 THEN ''Non-eligible'' WHEN   SCIP_INF_2H = 0 THEN ''Eligible'' WHEN  SCIP_INF_2H  = 1 THEN ''Positive'' END As  SCIP_INF_2H
       , 
CASE 
WHEN  SCIP_INF_3A = -1 THEN ''Non-eligible'' WHEN   SCIP_INF_3A = 0 THEN ''Eligible'' WHEN  SCIP_INF_3A  = 1 THEN ''Positive'' END As  SCIP_INF_3A
       , 
CASE 
WHEN  SCIP_INF_3B = -1 THEN ''Non-eligible'' WHEN   SCIP_INF_3B = 0 THEN ''Eligible'' WHEN  SCIP_INF_3B  = 1 THEN ''Positive'' END As  SCIP_INF_3B
       , 
CASE 
WHEN  SCIP_INF_3C = -1 THEN ''Non-eligible'' WHEN   SCIP_INF_3C = 0 THEN ''Eligible'' WHEN  SCIP_INF_3C  = 1 THEN ''Positive'' END As  SCIP_INF_3C
       , 
CASE 
WHEN  SCIP_INF_3D = -1 THEN ''Non-eligible'' WHEN   SCIP_INF_3D = 0 THEN ''Eligible'' WHEN  SCIP_INF_3D  = 1 THEN ''Positive'' END As  SCIP_INF_3D
       , 
CASE 
WHEN  SCIP_INF_3E = -1 THEN ''Non-eligible'' WHEN   SCIP_INF_3E = 0 THEN ''Eligible'' WHEN  SCIP_INF_3E  = 1 THEN ''Positive'' END As  SCIP_INF_3E
       , 
CASE 
WHEN  SCIP_INF_3F = -1 THEN ''Non-eligible'' WHEN   SCIP_INF_3F = 0 THEN ''Eligible'' WHEN  SCIP_INF_3F  = 1 THEN ''Positive'' END As  SCIP_INF_3F
       , 
CASE 
WHEN  SCIP_INF_3G = -1 THEN ''Non-eligible'' WHEN   SCIP_INF_3G = 0 THEN ''Eligible'' WHEN  SCIP_INF_3G  = 1 THEN ''Positive'' END As  SCIP_INF_3G
       , 
CASE 
WHEN  SCIP_INF_3H = -1 THEN ''Non-eligible'' WHEN   SCIP_INF_3H = 0 THEN ''Eligible'' WHEN  SCIP_INF_3H  = 1 THEN ''Positive'' END As  SCIP_INF_3H
       , 
CASE 
WHEN  SCIP_INF_4 = -1 THEN ''Non-eligible'' WHEN   SCIP_INF_4 = 0 THEN ''Eligible'' WHEN  SCIP_INF_4  = 1 THEN ''Positive'' END As  SCIP_INF_4
       , 
CASE 
WHEN  SCIP_INF_6 = -1 THEN ''Non-eligible'' WHEN   SCIP_INF_6 = 0 THEN ''Eligible'' WHEN  SCIP_INF_6  = 1 THEN ''Positive'' END As  SCIP_INF_6
       , 
CASE 
WHEN  SCIP_INF_9 = -1 THEN ''Non-eligible'' WHEN   SCIP_INF_9 = 0 THEN ''Eligible'' WHEN  SCIP_INF_9  = 1 THEN ''Positive'' END As  SCIP_INF_9
       , 
CASE 
WHEN  SCIP_INF_10 = -1 THEN ''Non-eligible'' WHEN   SCIP_INF_10 = 0 THEN ''Eligible'' WHEN  SCIP_INF_10  = 1 THEN ''Positive'' END As  SCIP_INF_10
       , 
CASE 
WHEN  SCIP_VTE_2 = -1 THEN ''Non-eligible'' WHEN   SCIP_VTE_2 = 0 THEN ''Eligible'' WHEN  SCIP_VTE_2  = 1 THEN ''Positive'' END As  SCIP_VTE_2
       , 
CASE 
WHEN  STK_1 = -1 THEN ''Non-eligible'' WHEN   STK_1 = 0 THEN ''Eligible'' WHEN  STK_1  = 1 THEN ''Positive'' END As  STK_1
       , 
CASE 
WHEN  STK_2 = -1 THEN ''Non-eligible'' WHEN   STK_2 = 0 THEN ''Eligible'' WHEN  STK_2  = 1 THEN ''Positive'' END As  STK_2
       , 
CASE 
WHEN  STK_3 = -1 THEN ''Non-eligible'' WHEN   STK_3 = 0 THEN ''Eligible'' WHEN  STK_3  = 1 THEN ''Positive'' END As  STK_3
       , 
CASE 
WHEN  STK_4 = -1 THEN ''Non-eligible'' WHEN   STK_4 = 0 THEN ''Eligible'' WHEN  STK_4  = 1 THEN ''Positive'' END As  STK_4
       , 
CASE 
WHEN  STK_5 = -1 THEN ''Non-eligible'' WHEN   STK_5 = 0 THEN ''Eligible'' WHEN  STK_5  = 1 THEN ''Positive'' END As  STK_5
       , 
CASE 
WHEN  STK_6 = -1 THEN ''Non-eligible'' WHEN   STK_6 = 0 THEN ''Eligible'' WHEN  STK_6  = 1 THEN ''Positive'' END As  STK_6
       , 
CASE 
WHEN  STK_8 = -1 THEN ''Non-eligible'' WHEN   STK_8 = 0 THEN ''Eligible'' WHEN  STK_8  = 1 THEN ''Positive'' END As  STK_8
       , 
CASE 
WHEN  STK_10 = -1 THEN ''Non-eligible'' WHEN   STK_10 = 0 THEN ''Eligible'' WHEN  STK_10  = 1 THEN ''Positive'' END As  STK_10
       , 
CASE 
WHEN  VTE_1 = -1 THEN ''Non-eligible'' WHEN   VTE_1 = 0 THEN ''Eligible'' WHEN  VTE_1  = 1 THEN ''Positive'' END As  VTE_1
       , 
CASE 
WHEN  VTE_2 = -1 THEN ''Non-eligible'' WHEN   VTE_2 = 0 THEN ''Eligible'' WHEN  VTE_2  = 1 THEN ''Positive'' END As  VTE_2
       , 
CASE 
WHEN  VTE_3 = -1 THEN ''Non-eligible'' WHEN   VTE_3 = 0 THEN ''Eligible'' WHEN  VTE_3  = 1 THEN ''Positive'' END As  VTE_3
       , 
CASE 
WHEN  VTE_4 = -1 THEN ''Non-eligible'' WHEN   VTE_4 = 0 THEN ''Eligible'' WHEN  VTE_4  = 1 THEN ''Positive'' END As  VTE_4
       , 
CASE 
WHEN  VTE_5 = -1 THEN ''Non-eligible'' WHEN   VTE_5 = 0 THEN ''Eligible'' WHEN  VTE_5  = 1 THEN ''Positive'' END As  VTE_5
       , 
CASE 
WHEN  VTE_6 = -1 THEN ''Non-eligible'' WHEN   VTE_6 = 0 THEN ''Eligible'' WHEN  VTE_6  = 1 THEN ''Positive'' END As  VTE_6
       , 
CASE 
WHEN CMS_1 = -1 THEN ''Non-eligible'' WHEN CMS_1 = 0 THEN ''Eligible'' WHEN CMS_1 = 1 THEN ''Positive'' END As CMS_1
       , 
CASE 
WHEN CMS_2 = -1 THEN ''Non-eligible'' WHEN CMS_2 = 0 THEN ''Eligible'' WHEN CMS_2 = 1 THEN ''Positive'' END As CMS_2
       , 
CASE 
WHEN CMS_3 = -1 THEN ''Non-eligible'' WHEN CMS_3 = 0 THEN ''Eligible'' WHEN CMS_3 = 1 THEN ''Positive'' END As CMS_3
       , 
CASE 
WHEN CMS_4 = -1 THEN ''Non-eligible'' WHEN CMS_4 = 0 THEN ''Eligible'' WHEN CMS_4 = 1 THEN ''Positive'' END As CMS_4
       , 
CASE 
WHEN CMS_5 = -1 THEN ''Non-eligible'' WHEN CMS_5 = 0 THEN ''Eligible'' WHEN CMS_5 = 1 THEN ''Positive'' END As CMS_5
       , 
CASE 
WHEN CMS_6 = -1 THEN ''Non-eligible'' WHEN CMS_6 = 0 THEN ''Eligible'' WHEN CMS_6 = 1 THEN ''Positive'' END As CMS_6
       , 
CASE 
WHEN CMS_7 = -1 THEN ''Non-eligible'' WHEN CMS_7 = 0 THEN ''Eligible'' WHEN CMS_7 = 1 THEN ''Positive'' END As CMS_7
       , 
CASE 
WHEN CMS_8 = -1 THEN ''Non-eligible'' WHEN CMS_8 = 0 THEN ''Eligible'' WHEN CMS_8 = 1 THEN ''Positive'' END As CMS_8
       , 
CASE 
WHEN CMS_9 = -1 THEN ''Non-eligible'' WHEN CMS_9 = 0 THEN ''Eligible'' WHEN CMS_9 = 1 THEN ''Positive'' END As CMS_9
       , 
CASE 
WHEN CMS_10 = -1 THEN ''Non-eligible'' WHEN CMS_10 = 0 THEN ''Eligible'' WHEN CMS_10 = 1 THEN ''Positive'' END As CMS_10
       , 
CASE 
WHEN CMS_11 = -1 THEN ''Non-eligible'' WHEN CMS_11 = 0 THEN ''Eligible'' WHEN CMS_11 = 1 THEN ''Positive'' END As CMS_11
       , 
CASE 
WHEN CMS_12 = -1 THEN ''Non-eligible'' WHEN CMS_12 = 0 THEN ''Eligible'' WHEN CMS_12 = 1 THEN ''Positive'' END As CMS_12
       , 
CASE 
WHEN CMS_13 = -1 THEN ''Non-eligible'' WHEN CMS_13 = 0 THEN ''Eligible'' WHEN CMS_13 = 1 THEN ''Positive'' END As CMS_13
       , 
CASE 
WHEN CMS_14 = -1 THEN ''Non-eligible'' WHEN CMS_14 = 0 THEN ''Eligible'' WHEN CMS_14 = 1 THEN ''Positive'' END As CMS_14
       , 
CASE 
WHEN CMS_15 = -1 THEN ''Non-eligible'' WHEN CMS_15 = 0 THEN ''Eligible'' WHEN CMS_15 = 1 THEN ''Positive'' END As CMS_15
       , 
CASE 
WHEN CMS_16 = -1 THEN ''Non-eligible'' WHEN CMS_16 = 0 THEN ''Eligible'' WHEN CMS_16 = 1 THEN ''Positive'' END As CMS_16
       , 
CASE 
WHEN CMS_17 = -1 THEN ''Non-eligible'' WHEN CMS_17 = 0 THEN ''Eligible'' WHEN CMS_17 = 1 THEN ''Positive'' END As CMS_17
       , 
CASE 
WHEN CMS_18 = -1 THEN ''Non-eligible'' WHEN CMS_18 = 0 THEN ''Eligible'' WHEN CMS_18 = 1 THEN ''Positive'' END As CMS_18
       , 
CASE 
WHEN CMS_159 = -1 THEN ''Non-eligible'' WHEN CMS_159 = 0 THEN ''Eligible'' WHEN CMS_159 = 1 THEN ''Positive'' END As CMS_159
       , 
CASE 
WHEN PREMIER_1 = -1 THEN ''Non-eligible'' WHEN PREMIER_1 = 0 THEN ''Eligible'' WHEN PREMIER_1 = 1 THEN ''Positive'' END As PREMIER_1
       , 
CASE 
WHEN PREMIER_2 = -1 THEN ''Non-eligible'' WHEN PREMIER_2 = 0 THEN ''Eligible'' WHEN PREMIER_2 = 1 THEN ''Positive'' END As PREMIER_2
       , 
CASE 
WHEN PREMIER_3 = -1 THEN ''Non-eligible'' WHEN PREMIER_3 = 0 THEN ''Eligible'' WHEN PREMIER_3 = 1 THEN ''Positive'' END As PREMIER_3
       , 
CASE 
WHEN PREMIER_4 = -1 THEN ''Non-eligible'' WHEN PREMIER_4 = 0 THEN ''Eligible'' WHEN PREMIER_4 = 1 THEN ''Positive'' END As PREMIER_4
       , 
CASE 
WHEN PREMIER_5 = -1 THEN ''Non-eligible'' WHEN PREMIER_5 = 0 THEN ''Eligible'' WHEN PREMIER_5 = 1 THEN ''Positive'' END As PREMIER_5
       , 
CASE 
WHEN PREMIER_7 = -1 THEN ''Non-eligible'' WHEN PREMIER_7 = 0 THEN ''Eligible'' WHEN PREMIER_7 = 1 THEN ''Positive'' END As PREMIER_7
       , 
CASE 
WHEN PREMIER_8 = -1 THEN ''Non-eligible'' WHEN PREMIER_8 = 0 THEN ''Eligible'' WHEN PREMIER_8 = 1 THEN ''Positive'' END As PREMIER_8
       , 
CASE 
WHEN PREMIER_10 = -1 THEN ''Non-eligible'' WHEN PREMIER_10 = 0 THEN ''Eligible'' WHEN PREMIER_10 = 1 THEN ''Positive'' END As PREMIER_10
       , 
CASE 
WHEN PREMIER_11 = -1 THEN ''Non-eligible'' WHEN PREMIER_11 = 0 THEN ''Eligible'' WHEN PREMIER_11 = 1 THEN ''Positive'' END As PREMIER_11
       , 
CASE 
WHEN PREMIER_12 = -1 THEN ''Non-eligible'' WHEN PREMIER_12 = 0 THEN ''Eligible'' WHEN PREMIER_12 = 1 THEN ''Positive'' END As PREMIER_12
       , 
CASE 
WHEN PREMIER_13 = -1 THEN ''Non-eligible'' WHEN PREMIER_13 = 0 THEN ''Eligible'' WHEN PREMIER_13 = 1 THEN ''Positive'' END As PREMIER_13
       , 
CASE 
WHEN PREMIER_14 = -1 THEN ''Non-eligible'' WHEN PREMIER_14 = 0 THEN ''Eligible'' WHEN PREMIER_14 = 1 THEN ''Positive'' END As PREMIER_14
       , 
CASE 
WHEN PREMIER_15 = -1 THEN ''Non-eligible'' WHEN PREMIER_15 = 0 THEN ''Eligible'' WHEN PREMIER_15 = 1 THEN ''Positive'' END As PREMIER_15
       , 
CASE 
WHEN PREMIER_16 = -1 THEN ''Non-eligible'' WHEN PREMIER_16 = 0 THEN ''Eligible'' WHEN PREMIER_16 = 1 THEN ''Positive'' END As PREMIER_16
       , 
CASE 
WHEN PREMIER_17 = -1 THEN ''Non-eligible'' WHEN PREMIER_17 = 0 THEN ''Eligible'' WHEN PREMIER_17 = 1 THEN ''Positive'' END As PREMIER_17
       , 
CASE 
WHEN PREMIER_18 = -1 THEN ''Non-eligible'' WHEN PREMIER_18 = 0 THEN ''Eligible'' WHEN PREMIER_18 = 1 THEN ''Positive'' END As PREMIER_18
       , 
CASE 
WHEN PREMIER_19 = -1 THEN ''Non-eligible'' WHEN PREMIER_19 = 0 THEN ''Eligible'' WHEN PREMIER_19 = 1 THEN ''Positive'' END As PREMIER_19
       , 
CASE 
WHEN PREMIER_20 = -1 THEN ''Non-eligible'' WHEN PREMIER_20 = 0 THEN ''Eligible'' WHEN PREMIER_20 = 1 THEN ''Positive'' END As PREMIER_20
       , 
CASE 
WHEN PREMIER_22 = -1 THEN ''Non-eligible'' WHEN PREMIER_22 = 0 THEN ''Eligible'' WHEN PREMIER_22 = 1 THEN ''Positive'' END As PREMIER_22
       , 
CASE 
WHEN PREMIER_23 = -1 THEN ''Non-eligible'' WHEN PREMIER_23 = 0 THEN ''Eligible'' WHEN PREMIER_23 = 1 THEN ''Positive'' END As PREMIER_23
       , 
CASE 
WHEN PREMIER_24 = -1 THEN ''Non-eligible'' WHEN PREMIER_24 = 0 THEN ''Eligible'' WHEN PREMIER_24 = 1 THEN ''Positive'' END As PREMIER_24
       , 
CASE 
WHEN PREMIER_25 = -1 THEN ''Non-eligible'' WHEN PREMIER_25 = 0 THEN ''Eligible'' WHEN PREMIER_25 = 1 THEN ''Positive'' END As PREMIER_25
       , 
CASE 
WHEN PREMIER_26 = -1 THEN ''Non-eligible'' WHEN PREMIER_26 = 0 THEN ''Eligible'' WHEN PREMIER_26 = 1 THEN ''Positive'' END As PREMIER_26
       , 
CASE 
WHEN PREMIER_27 = -1 THEN ''Non-eligible'' WHEN PREMIER_27 = 0 THEN ''Eligible'' WHEN PREMIER_27 = 1 THEN ''Positive'' END As PREMIER_27
       , 
CASE 
WHEN PREMIER_29 = -1 THEN ''Non-eligible'' WHEN PREMIER_29 = 0 THEN ''Eligible'' WHEN PREMIER_29 = 1 THEN ''Positive'' END As PREMIER_29
       , 
CASE 
WHEN PREMIER_30 = -1 THEN ''Non-eligible'' WHEN PREMIER_30 = 0 THEN ''Eligible'' WHEN PREMIER_30 = 1 THEN ''Positive'' END As PREMIER_30
       , 
CASE 
WHEN PREMIER_32 = -1 THEN ''Non-eligible'' WHEN PREMIER_32 = 0 THEN ''Eligible'' WHEN PREMIER_32 = 1 THEN ''Positive'' END As PREMIER_32
       , 
CASE 
WHEN PREMIER_35 = -1 THEN ''Non-eligible'' WHEN PREMIER_35 = 0 THEN ''Eligible'' WHEN PREMIER_35 = 1 THEN ''Positive'' END As PREMIER_35
       , 
CASE 
WHEN PREMIER_36 = -1 THEN ''Non-eligible'' WHEN PREMIER_36 = 0 THEN ''Eligible'' WHEN PREMIER_36 = 1 THEN ''Positive'' END As PREMIER_36
       , 
CASE 
WHEN PREMIER_37 = -1 THEN ''Non-eligible'' WHEN PREMIER_37 = 0 THEN ''Eligible'' WHEN PREMIER_37 = 1 THEN ''Positive'' END As PREMIER_37
       , 
CASE 
WHEN PREMIER_38 = -1 THEN ''Non-eligible'' WHEN PREMIER_38 = 0 THEN ''Eligible'' WHEN PREMIER_38 = 1 THEN ''Positive'' END As PREMIER_38
       , 
CASE 
WHEN PREMIER_40 = -1 THEN ''Non-eligible'' WHEN PREMIER_40 = 0 THEN ''Eligible'' WHEN PREMIER_40 = 1 THEN ''Positive'' END As PREMIER_40
       , 
CASE 
WHEN PREMIER_45 = -1 THEN ''Non-eligible'' WHEN PREMIER_45 = 0 THEN ''Eligible'' WHEN PREMIER_45 = 1 THEN ''Positive'' END As PREMIER_45
       , 
CASE 
WHEN PREMIER_46 = -1 THEN ''Non-eligible'' WHEN PREMIER_46 = 0 THEN ''Eligible'' WHEN PREMIER_46 = 1 THEN ''Positive'' END As PREMIER_46
       , 
CASE 
WHEN PREMIER_51 = -1 THEN ''Non-eligible'' WHEN PREMIER_51 = 0 THEN ''Eligible'' WHEN PREMIER_51 = 1 THEN ''Positive'' END As PREMIER_51
       , 
CASE 
WHEN PREMIER_52 = -1 THEN ''Non-eligible'' WHEN PREMIER_52 = 0 THEN ''Eligible'' WHEN PREMIER_52 = 1 THEN ''Positive'' END As PREMIER_52
       , 
CASE 
WHEN PREMIER_54 = -1 THEN ''Non-eligible'' WHEN PREMIER_54 = 0 THEN ''Eligible'' WHEN PREMIER_54 = 1 THEN ''Positive'' END As PREMIER_54
       , 
CASE 
WHEN PREMIER_55 = -1 THEN ''Non-eligible'' WHEN PREMIER_55 = 0 THEN ''Eligible'' WHEN PREMIER_55 = 1 THEN ''Positive'' END As PREMIER_55
       , 
CASE 
WHEN PREMIER_57 = -1 THEN ''Non-eligible'' WHEN PREMIER_57 = 0 THEN ''Eligible'' WHEN PREMIER_57 = 1 THEN ''Positive'' END As PREMIER_57
       , 
CASE 
WHEN PREMIER_58 = -1 THEN ''Non-eligible'' WHEN PREMIER_58 = 0 THEN ''Eligible'' WHEN PREMIER_58 = 1 THEN ''Positive'' END As PREMIER_58
       , 
CASE 
WHEN PREMIER_60 = -1 THEN ''Non-eligible'' WHEN PREMIER_60 = 0 THEN ''Eligible'' WHEN PREMIER_60 = 1 THEN ''Positive'' END As PREMIER_60
       , 
CASE 
WHEN PREMIER_61 = -1 THEN ''Non-eligible'' WHEN PREMIER_61 = 0 THEN ''Eligible'' WHEN PREMIER_61 = 1 THEN ''Positive'' END As PREMIER_61
       , 
CASE 
WHEN PREMIER_62 = -1 THEN ''Non-eligible'' WHEN PREMIER_62 = 0 THEN ''Eligible'' WHEN PREMIER_62 = 1 THEN ''Positive'' END As PREMIER_62
       , 
CASE 
WHEN PREMIER_65 = -1 THEN ''Non-eligible'' WHEN PREMIER_65 = 0 THEN ''Eligible'' WHEN PREMIER_65 = 1 THEN ''Positive'' END As PREMIER_65
       , 
CASE 
WHEN PREMIER_71 = -1 THEN ''Non-eligible'' WHEN PREMIER_71 = 0 THEN ''Eligible'' WHEN PREMIER_71 = 1 THEN ''Positive'' END As PREMIER_71
       , 
CASE 
WHEN PREMIER_73 = -1 THEN ''Non-eligible'' WHEN PREMIER_73 = 0 THEN ''Eligible'' WHEN PREMIER_73 = 1 THEN ''Positive'' END As PREMIER_73
       , 
CASE 
WHEN PREMIER_75 = -1 THEN ''Non-eligible'' WHEN PREMIER_75 = 0 THEN ''Eligible'' WHEN PREMIER_75 = 1 THEN ''Positive'' END As PREMIER_75
       , 
CASE 
WHEN PREMIER_76 = -1 THEN ''Non-eligible'' WHEN PREMIER_76 = 0 THEN ''Eligible'' WHEN PREMIER_76 = 1 THEN ''Positive'' END As PREMIER_76
       , 
CASE 
WHEN PREMIER_77 = -1 THEN ''Non-eligible'' WHEN PREMIER_77 = 0 THEN ''Eligible'' WHEN PREMIER_77 = 1 THEN ''Positive'' END As PREMIER_77
       , 
CASE 
WHEN PREMIER_78 = -1 THEN ''Non-eligible'' WHEN PREMIER_78 = 0 THEN ''Eligible'' WHEN PREMIER_78 = 1 THEN ''Positive'' END As PREMIER_78
       , 
CASE 
WHEN PREMIER_79 = -1 THEN ''Non-eligible'' WHEN PREMIER_79 = 0 THEN ''Eligible'' WHEN PREMIER_79 = 1 THEN ''Positive'' END As PREMIER_79
       , 
CASE 
WHEN PREMIER_80 = -1 THEN ''Non-eligible'' WHEN PREMIER_80 = 0 THEN ''Eligible'' WHEN PREMIER_80 = 1 THEN ''Positive'' END As PREMIER_80
       , 
CASE 
WHEN PREMIER_81 = -1 THEN ''Non-eligible'' WHEN PREMIER_81 = 0 THEN ''Eligible'' WHEN PREMIER_81 = 1 THEN ''Positive'' END As PREMIER_81
       , 
CASE 
WHEN PREMIER_82 = -1 THEN ''Non-eligible'' WHEN PREMIER_82 = 0 THEN ''Eligible'' WHEN PREMIER_82 = 1 THEN ''Positive'' END As PREMIER_82
       , 
CASE 
WHEN PREMIER_84 = -1 THEN ''Non-eligible'' WHEN PREMIER_84 = 0 THEN ''Eligible'' WHEN PREMIER_84 = 1 THEN ''Positive'' END As PREMIER_84
       , 
CASE 
WHEN PREMIER_86 = -1 THEN ''Non-eligible'' WHEN PREMIER_86 = 0 THEN ''Eligible'' WHEN PREMIER_86 = 1 THEN ''Positive'' END As PREMIER_86
       , 
CASE 
WHEN PREMIER_88 = -1 THEN ''Non-eligible'' WHEN PREMIER_88 = 0 THEN ''Eligible'' WHEN PREMIER_88 = 1 THEN ''Positive'' END As PREMIER_88
       , 
CASE 
WHEN PREMIER_92 = -1 THEN ''Non-eligible'' WHEN PREMIER_92 = 0 THEN ''Eligible'' WHEN PREMIER_92 = 1 THEN ''Positive'' END As PREMIER_92
       , 
CASE 
WHEN PREMIER_94 = -1 THEN ''Non-eligible'' WHEN PREMIER_94 = 0 THEN ''Eligible'' WHEN PREMIER_94 = 1 THEN ''Positive'' END As PREMIER_94
       , 
CASE 
WHEN PREMIER_96 = -1 THEN ''Non-eligible'' WHEN PREMIER_96 = 0 THEN ''Eligible'' WHEN PREMIER_96 = 1 THEN ''Positive'' END As PREMIER_96
       , 
CASE 
WHEN PREMIER_97 = -1 THEN ''Non-eligible'' WHEN PREMIER_97 = 0 THEN ''Eligible'' WHEN PREMIER_97 = 1 THEN ''Positive'' END As PREMIER_97
       , 
CASE 
WHEN PREMIER_98 = -1 THEN ''Non-eligible'' WHEN PREMIER_98 = 0 THEN ''Eligible'' WHEN PREMIER_98 = 1 THEN ''Positive'' END As PREMIER_98
       , 
CASE 
WHEN PREMIER_99 = -1 THEN ''Non-eligible'' WHEN PREMIER_99 = 0 THEN ''Eligible'' WHEN PREMIER_99 = 1 THEN ''Positive'' END As PREMIER_99
       , 
CASE 
WHEN PREMIER_100 = -1 THEN ''Non-eligible'' WHEN PREMIER_100 = 0 THEN ''Eligible'' WHEN PREMIER_100 = 1 THEN ''Positive'' END As PREMIER_100
       , 
CASE 
WHEN PREMIER_104 = -1 THEN ''Non-eligible'' WHEN PREMIER_104 = 0 THEN ''Eligible'' WHEN PREMIER_104 = 1 THEN ''Positive'' END As PREMIER_104
       , 
CASE 
WHEN PREMIER_107 = -1 THEN ''Non-eligible'' WHEN PREMIER_107 = 0 THEN ''Eligible'' WHEN PREMIER_107 = 1 THEN ''Positive'' END As PREMIER_107
       , 
CASE 
WHEN PREMIER_108 = -1 THEN ''Non-eligible'' WHEN PREMIER_108 = 0 THEN ''Eligible'' WHEN PREMIER_108 = 1 THEN ''Positive'' END As PREMIER_108
       , 
CASE 
WHEN PREMIER_109 = -1 THEN ''Non-eligible'' WHEN PREMIER_109 = 0 THEN ''Eligible'' WHEN PREMIER_109 = 1 THEN ''Positive'' END As PREMIER_109
       , 
CASE 
WHEN PREMIER_110 = -1 THEN ''Non-eligible'' WHEN PREMIER_110 = 0 THEN ''Eligible'' WHEN PREMIER_110 = 1 THEN ''Positive'' END As PREMIER_110
       , 
CASE 
WHEN PREMIER_111 = -1 THEN ''Non-eligible'' WHEN PREMIER_111 = 0 THEN ''Eligible'' WHEN PREMIER_111 = 1 THEN ''Positive'' END As PREMIER_111
       , 
CASE 
WHEN PREMIER_112 = -1 THEN ''Non-eligible'' WHEN PREMIER_112 = 0 THEN ''Eligible'' WHEN PREMIER_112 = 1 THEN ''Positive'' END As PREMIER_112
       , 
CASE 
WHEN PREMIER_117 = -1 THEN ''Non-eligible'' WHEN PREMIER_117 = 0 THEN ''Eligible'' WHEN PREMIER_117 = 1 THEN ''Positive'' END As PREMIER_117
       , 
CASE 
WHEN PREMIER_118 = -1 THEN ''Non-eligible'' WHEN PREMIER_118 = 0 THEN ''Eligible'' WHEN PREMIER_118 = 1 THEN ''Positive'' END As PREMIER_118
       , 
CASE 
WHEN PREMIER_120 = -1 THEN ''Non-eligible'' WHEN PREMIER_120 = 0 THEN ''Eligible'' WHEN PREMIER_120 = 1 THEN ''Positive'' END As PREMIER_120
       , 
CASE 
WHEN PREMIER_125 = -1 THEN ''Non-eligible'' WHEN PREMIER_125 = 0 THEN ''Eligible'' WHEN PREMIER_125 = 1 THEN ''Positive'' END As PREMIER_125
       , 
CASE 
WHEN PREMIER_126 = -1 THEN ''Non-eligible'' WHEN PREMIER_126 = 0 THEN ''Eligible'' WHEN PREMIER_126 = 1 THEN ''Positive'' END As PREMIER_126
       , 
CASE 
WHEN PREMIER_127 = -1 THEN ''Non-eligible'' WHEN PREMIER_127 = 0 THEN ''Eligible'' WHEN PREMIER_127 = 1 THEN ''Positive'' END As PREMIER_127
       , 
CASE 
WHEN PREMIER_128 = -1 THEN ''Non-eligible'' WHEN PREMIER_128 = 0 THEN ''Eligible'' WHEN PREMIER_128 = 1 THEN ''Positive'' END As PREMIER_128
       , 
CASE 
WHEN PREMIER_130 = -1 THEN ''Non-eligible'' WHEN PREMIER_130 = 0 THEN ''Eligible'' WHEN PREMIER_130 = 1 THEN ''Positive'' END As PREMIER_130
       , 
CASE 
WHEN PREMIER_131 = -1 THEN ''Non-eligible'' WHEN PREMIER_131 = 0 THEN ''Eligible'' WHEN PREMIER_131 = 1 THEN ''Positive'' END As PREMIER_131
       , 
CASE 
WHEN PREMIER_134 = -1 THEN ''Non-eligible'' WHEN PREMIER_134 = 0 THEN ''Eligible'' WHEN PREMIER_134 = 1 THEN ''Positive'' END As PREMIER_134
       , 
CASE 
WHEN PREMIER_136 = -1 THEN ''Non-eligible'' WHEN PREMIER_136 = 0 THEN ''Eligible'' WHEN PREMIER_136 = 1 THEN ''Positive'' END As PREMIER_136
       , 
CASE 
WHEN PREMIER_138 = -1 THEN ''Non-eligible'' WHEN PREMIER_138 = 0 THEN ''Eligible'' WHEN PREMIER_138 = 1 THEN ''Positive'' END As PREMIER_138
       , 
CASE 
WHEN PREMIER_139 = -1 THEN ''Non-eligible'' WHEN PREMIER_139 = 0 THEN ''Eligible'' WHEN PREMIER_139 = 1 THEN ''Positive'' END As PREMIER_139
       , 
CASE 
WHEN PREMIER_141 = -1 THEN ''Non-eligible'' WHEN PREMIER_141 = 0 THEN ''Eligible'' WHEN PREMIER_141 = 1 THEN ''Positive'' END As PREMIER_141
       , 
CASE 
WHEN PREMIER_142 = -1 THEN ''Non-eligible'' WHEN PREMIER_142 = 0 THEN ''Eligible'' WHEN PREMIER_142 = 1 THEN ''Positive'' END As PREMIER_142
       , 
CASE 
WHEN PREMIER_143 = -1 THEN ''Non-eligible'' WHEN PREMIER_143 = 0 THEN ''Eligible'' WHEN PREMIER_143 = 1 THEN ''Positive'' END As PREMIER_143
       , 
CASE 
WHEN PREMIER_144 = -1 THEN ''Non-eligible'' WHEN PREMIER_144 = 0 THEN ''Eligible'' WHEN PREMIER_144 = 1 THEN ''Positive'' END As PREMIER_144
       , 
CASE 
WHEN PREMIER_150 = -1 THEN ''Non-eligible'' WHEN PREMIER_150 = 0 THEN ''Eligible'' WHEN PREMIER_150 = 1 THEN ''Positive'' END As PREMIER_150
       , 
CASE 
WHEN PREMIER_153 = -1 THEN ''Non-eligible'' WHEN PREMIER_153 = 0 THEN ''Eligible'' WHEN PREMIER_153 = 1 THEN ''Positive'' END As PREMIER_153
       , 
CASE 
WHEN PREMIER_154 = -1 THEN ''Non-eligible'' WHEN PREMIER_154 = 0 THEN ''Eligible'' WHEN PREMIER_154 = 1 THEN ''Positive'' END As PREMIER_154
       , 
CASE 
WHEN PREMIER_155 = -1 THEN ''Non-eligible'' WHEN PREMIER_155 = 0 THEN ''Eligible'' WHEN PREMIER_155 = 1 THEN ''Positive'' END As PREMIER_155
       , 
CASE 
WHEN PREMIER_156 = -1 THEN ''Non-eligible'' WHEN PREMIER_156 = 0 THEN ''Eligible'' WHEN PREMIER_156 = 1 THEN ''Positive'' END As PREMIER_156
       , 
CASE 
WHEN PREMIER_157 = -1 THEN ''Non-eligible'' WHEN PREMIER_157 = 0 THEN ''Eligible'' WHEN PREMIER_157 = 1 THEN ''Positive'' END As PREMIER_157
       , 
CASE 
WHEN PREMIER_158 = -1 THEN ''Non-eligible'' WHEN PREMIER_158 = 0 THEN ''Eligible'' WHEN PREMIER_158 = 1 THEN ''Positive'' END As PREMIER_158
       , 
CASE 
WHEN PREMIER_159 = -1 THEN ''Non-eligible'' WHEN PREMIER_159 = 0 THEN ''Eligible'' WHEN PREMIER_159 = 1 THEN ''Positive'' END As PREMIER_159
       , 
CASE 
WHEN  IQI1_ESOPHAGEAL_RESECTION_VOL = -1 THEN ''Non-eligible'' WHEN   IQI1_ESOPHAGEAL_RESECTION_VOL = 0 THEN ''Eligible'' WHEN  IQI1_ESOPHAGEAL_RESECTION_VOL  = 1 THEN ''Positive'' END As  IQI1_ESOPHAGEAL_RESECTION_VOL
       , 
CASE 
WHEN  IQI2_PANCREATIC_RESECTION_VOL = -1 THEN ''Non-eligible'' WHEN   IQI2_PANCREATIC_RESECTION_VOL = 0 THEN ''Eligible'' WHEN  IQI2_PANCREATIC_RESECTION_VOL  = 1 THEN ''Positive'' END As  IQI2_PANCREATIC_RESECTION_VOL
       , 
CASE 
WHEN  IQI4_AAA_REPAIR_VOL = -1 THEN ''Non-eligible'' WHEN   IQI4_AAA_REPAIR_VOL = 0 THEN ''Eligible'' WHEN  IQI4_AAA_REPAIR_VOL  = 1 THEN ''Positive'' END As  IQI4_AAA_REPAIR_VOL
       , 
CASE 
WHEN  IQI5_CABG_VOL = -1 THEN ''Non-eligible'' WHEN   IQI5_CABG_VOL = 0 THEN ''Eligible'' WHEN  IQI5_CABG_VOL  = 1 THEN ''Positive'' END As  IQI5_CABG_VOL
       , 
CASE 
WHEN  IQI6_PTCA_VOL = -1 THEN ''Non-eligible'' WHEN   IQI6_PTCA_VOL = 0 THEN ''Eligible'' WHEN  IQI6_PTCA_VOL  = 1 THEN ''Positive'' END As  IQI6_PTCA_VOL
       , 
CASE 
WHEN  IQI7_CAROTID_ENDARTERECTOMY_VOL = -1 THEN ''Non-eligible'' WHEN   IQI7_CAROTID_ENDARTERECTOMY_VOL = 0 THEN ''Eligible'' WHEN  IQI7_CAROTID_ENDARTERECTOMY_VOL  = 1 THEN ''Positive'' END As  IQI7_CAROTID_ENDARTERECTOMY_VOL
       , 
CASE 
WHEN  IQI2A_PANCREATIC_RESECTION_VOL = -1 THEN ''Non-eligible'' WHEN   IQI2A_PANCREATIC_RESECTION_VOL = 0 THEN ''Eligible'' WHEN  IQI2A_PANCREATIC_RESECTION_VOL  = 1 THEN ''Positive'' END As  IQI2A_PANCREATIC_RESECTION_VOL
       , 
CASE 
WHEN  IQI2B_PANCREATIC_RESECTION_VOL = -1 THEN ''Non-eligible'' WHEN   IQI2B_PANCREATIC_RESECTION_VOL = 0 THEN ''Eligible'' WHEN  IQI2B_PANCREATIC_RESECTION_VOL  = 1 THEN ''Positive'' END As  IQI2B_PANCREATIC_RESECTION_VOL
       , 
CASE 
WHEN  IQI4A_AAA_REPAIR_VOL = -1 THEN ''Non-eligible'' WHEN   IQI4A_AAA_REPAIR_VOL = 0 THEN ''Eligible'' WHEN  IQI4A_AAA_REPAIR_VOL  = 1 THEN ''Positive'' END As  IQI4A_AAA_REPAIR_VOL
       , 
CASE 
WHEN  IQI4B_AAA_REPAIR_VOL = -1 THEN ''Non-eligible'' WHEN   IQI4B_AAA_REPAIR_VOL = 0 THEN ''Eligible'' WHEN  IQI4B_AAA_REPAIR_VOL  = 1 THEN ''Positive'' END As  IQI4B_AAA_REPAIR_VOL
       , 
CASE 
WHEN  IQI4C_AAA_REPAIR_VOL = -1 THEN ''Non-eligible'' WHEN   IQI4C_AAA_REPAIR_VOL = 0 THEN ''Eligible'' WHEN  IQI4C_AAA_REPAIR_VOL  = 1 THEN ''Positive'' END As  IQI4C_AAA_REPAIR_VOL
       , 
CASE 
WHEN  IQI4D_AAA_REPAIR_VOL = -1 THEN ''Non-eligible'' WHEN   IQI4D_AAA_REPAIR_VOL = 0 THEN ''Eligible'' WHEN  IQI4D_AAA_REPAIR_VOL  = 1 THEN ''Positive'' END As  IQI4D_AAA_REPAIR_VOL
       , 
CASE 
WHEN  IQI8_ESOPHAGEAL_RESECTION_MORT = -1 THEN ''Non-eligible'' WHEN   IQI8_ESOPHAGEAL_RESECTION_MORT = 0 THEN ''Eligible'' WHEN  IQI8_ESOPHAGEAL_RESECTION_MORT  = 1 THEN ''Positive'' END As  IQI8_ESOPHAGEAL_RESECTION_MORT
       , 
CASE 
WHEN  IQI9_PANCREATIC_RESECTION_MORT = -1 THEN ''Non-eligible'' WHEN   IQI9_PANCREATIC_RESECTION_MORT = 0 THEN ''Eligible'' WHEN  IQI9_PANCREATIC_RESECTION_MORT  = 1 THEN ''Positive'' END As  IQI9_PANCREATIC_RESECTION_MORT
       , 
CASE 
WHEN  IQI11_AAA_REPAIR_MORT = -1 THEN ''Non-eligible'' WHEN   IQI11_AAA_REPAIR_MORT = 0 THEN ''Eligible'' WHEN  IQI11_AAA_REPAIR_MORT  = 1 THEN ''Positive'' END As  IQI11_AAA_REPAIR_MORT
       , 
CASE 
WHEN  IQI12_CABG_MORT = -1 THEN ''Non-eligible'' WHEN   IQI12_CABG_MORT = 0 THEN ''Eligible'' WHEN  IQI12_CABG_MORT  = 1 THEN ''Positive'' END As  IQI12_CABG_MORT
       , 
CASE 
WHEN  IQI13_CRANIOTOMY_MORT = -1 THEN ''Non-eligible'' WHEN   IQI13_CRANIOTOMY_MORT = 0 THEN ''Eligible'' WHEN  IQI13_CRANIOTOMY_MORT  = 1 THEN ''Positive'' END As  IQI13_CRANIOTOMY_MORT
       , 
CASE 
WHEN  IQI14_HIP_REPLACEMENT_MORT = -1 THEN ''Non-eligible'' WHEN   IQI14_HIP_REPLACEMENT_MORT = 0 THEN ''Eligible'' WHEN  IQI14_HIP_REPLACEMENT_MORT  = 1 THEN ''Positive'' END As  IQI14_HIP_REPLACEMENT_MORT
       , 
CASE 
WHEN  IQI15_AMI_MORT = -1 THEN ''Non-eligible'' WHEN   IQI15_AMI_MORT = 0 THEN ''Eligible'' WHEN  IQI15_AMI_MORT  = 1 THEN ''Positive'' END As  IQI15_AMI_MORT
       , 
CASE 
WHEN  IQI16_CHF_MORT = -1 THEN ''Non-eligible'' WHEN   IQI16_CHF_MORT = 0 THEN ''Eligible'' WHEN  IQI16_CHF_MORT  = 1 THEN ''Positive'' END As  IQI16_CHF_MORT
       , 
CASE 
WHEN  IQI17_ACUTE_STROKE_MORT = -1 THEN ''Non-eligible'' WHEN   IQI17_ACUTE_STROKE_MORT = 0 THEN ''Eligible'' WHEN  IQI17_ACUTE_STROKE_MORT  = 1 THEN ''Positive'' END As  IQI17_ACUTE_STROKE_MORT
       , 
CASE 
WHEN  IQI18_GASTROINTESTINAL_HEM_MORT = -1 THEN ''Non-eligible'' WHEN   IQI18_GASTROINTESTINAL_HEM_MORT = 0 THEN ''Eligible'' WHEN  IQI18_GASTROINTESTINAL_HEM_MORT  = 1 THEN ''Positive'' END As  IQI18_GASTROINTESTINAL_HEM_MORT
       , 
CASE 
WHEN  IQI19_HIP_FRACTURE_MORT = -1 THEN ''Non-eligible'' WHEN   IQI19_HIP_FRACTURE_MORT = 0 THEN ''Eligible'' WHEN  IQI19_HIP_FRACTURE_MORT  = 1 THEN ''Positive'' END As  IQI19_HIP_FRACTURE_MORT
       , 
CASE 
WHEN  IQI20_PNEUMONIA_MORT = -1 THEN ''Non-eligible'' WHEN   IQI20_PNEUMONIA_MORT = 0 THEN ''Eligible'' WHEN  IQI20_PNEUMONIA_MORT  = 1 THEN ''Positive'' END As  IQI20_PNEUMONIA_MORT
       , 
CASE 
WHEN  IQI21_CESAREAN_DELIVERY = -1 THEN ''Non-eligible'' WHEN   IQI21_CESAREAN_DELIVERY = 0 THEN ''Eligible'' WHEN  IQI21_CESAREAN_DELIVERY  = 1 THEN ''Positive'' END As  IQI21_CESAREAN_DELIVERY
       , 
CASE 
WHEN  IQI22_VBAC_UNCOMP = -1 THEN ''Non-eligible'' WHEN   IQI22_VBAC_UNCOMP = 0 THEN ''Eligible'' WHEN  IQI22_VBAC_UNCOMP  = 1 THEN ''Positive'' END As  IQI22_VBAC_UNCOMP
       , 
CASE 
WHEN  IQI23_LAPAROSCOPIC_CHOLECYSTECTOMY = -1 THEN ''Non-eligible'' WHEN   IQI23_LAPAROSCOPIC_CHOLECYSTECTOMY = 0 THEN ''Eligible'' WHEN  IQI23_LAPAROSCOPIC_CHOLECYSTECTOMY  = 1 THEN ''Positive'' END As  IQI23_LAPAROSCOPIC_CHOLECYSTECTOMY
       , 
CASE 
WHEN  IQI24_INCIDENTAL_APPENDECTOMY_ELDERLY = -1 THEN ''Non-eligible'' WHEN   IQI24_INCIDENTAL_APPENDECTOMY_ELDERLY = 0 THEN ''Eligible'' WHEN  IQI24_INCIDENTAL_APPENDECTOMY_ELDERLY  = 1 THEN ''Positive'' END As  IQI24_INCIDENTAL_APPENDECTOMY_ELDERLY
       , 
CASE 
WHEN  IQI25_BILATERAL_CARDIAC_CATH = -1 THEN ''Non-eligible'' WHEN   IQI25_BILATERAL_CARDIAC_CATH = 0 THEN ''Eligible'' WHEN  IQI25_BILATERAL_CARDIAC_CATH  = 1 THEN ''Positive'' END As  IQI25_BILATERAL_CARDIAC_CATH
       , 
CASE 
WHEN  IQI30_PTCA_MORT = -1 THEN ''Non-eligible'' WHEN   IQI30_PTCA_MORT = 0 THEN ''Eligible'' WHEN  IQI30_PTCA_MORT  = 1 THEN ''Positive'' END As  IQI30_PTCA_MORT
       , 
CASE 
WHEN  IQI31_CAROTID_ENDARTERECTOMY_MORT = -1 THEN ''Non-eligible'' WHEN   IQI31_CAROTID_ENDARTERECTOMY_MORT = 0 THEN ''Eligible'' WHEN  IQI31_CAROTID_ENDARTERECTOMY_MORT  = 1 THEN ''Positive'' END As  IQI31_CAROTID_ENDARTERECTOMY_MORT
       , 
CASE 
WHEN  IQI32_AMI_MORT_RATE_WO_TRANSFER = -1 THEN ''Non-eligible'' WHEN   IQI32_AMI_MORT_RATE_WO_TRANSFER = 0 THEN ''Eligible'' WHEN  IQI32_AMI_MORT_RATE_WO_TRANSFER  = 1 THEN ''Positive'' END As  IQI32_AMI_MORT_RATE_WO_TRANSFER
       , 
CASE 
WHEN  IQI33_PRI_CESAREAN_DELIVERY = -1 THEN ''Non-eligible'' WHEN   IQI33_PRI_CESAREAN_DELIVERY = 0 THEN ''Eligible'' WHEN  IQI33_PRI_CESAREAN_DELIVERY  = 1 THEN ''Positive'' END As  IQI33_PRI_CESAREAN_DELIVERY
       , 
CASE 
WHEN  IQI34_VBAC_ALL = -1 THEN ''Non-eligible'' WHEN   IQI34_VBAC_ALL = 0 THEN ''Eligible'' WHEN  IQI34_VBAC_ALL  = 1 THEN ''Positive'' END As  IQI34_VBAC_ALL
       , 
CASE 
WHEN  IQI9A_PANCREATIC_RESECTION_MORT = -1 THEN ''Non-eligible'' WHEN   IQI9A_PANCREATIC_RESECTION_MORT = 0 THEN ''Eligible'' WHEN  IQI9A_PANCREATIC_RESECTION_MORT  = 1 THEN ''Positive'' END As  IQI9A_PANCREATIC_RESECTION_MORT
       , 
CASE 
WHEN  IQI9B_PANCREATIC_RESECTION_MORT = -1 THEN ''Non-eligible'' WHEN   IQI9B_PANCREATIC_RESECTION_MORT = 0 THEN ''Eligible'' WHEN  IQI9B_PANCREATIC_RESECTION_MORT  = 1 THEN ''Positive'' END As  IQI9B_PANCREATIC_RESECTION_MORT
       , 
CASE 
WHEN IQI11A_AAA_REPAIR_MORT = -1 THEN ''Non-eligible'' WHEN   IQI11A_AAA_REPAIR_MORT = 0 THEN ''Eligible'' WHEN IQI11A_AAA_REPAIR_MORT  = 1 THEN ''Positive'' END As IQI11A_AAA_REPAIR_MORT
       , 
CASE 
WHEN  IQI11B_AAA_REPAIR_MORT = -1 THEN ''Non-eligible'' WHEN   IQI11B_AAA_REPAIR_MORT = 0 THEN ''Eligible'' WHEN  IQI11B_AAA_REPAIR_MORT  = 1 THEN ''Positive'' END As  IQI11B_AAA_REPAIR_MORT
       , 
CASE 
WHEN  IQI11C_AAA_REPAIR_MORT = -1 THEN ''Non-eligible'' WHEN   IQI11C_AAA_REPAIR_MORT = 0 THEN ''Eligible'' WHEN  IQI11C_AAA_REPAIR_MORT  = 1 THEN ''Positive'' END As  IQI11C_AAA_REPAIR_MORT
       , 
CASE 
WHEN  IQI11D_AAA_REPAIR_MORT = -1 THEN ''Non-eligible'' WHEN   IQI11D_AAA_REPAIR_MORT = 0 THEN ''Eligible'' WHEN  IQI11D_AAA_REPAIR_MORT  = 1 THEN ''Positive'' END As  IQI11D_AAA_REPAIR_MORT
       , 
CASE 
WHEN  IQI17A_ACUTE_STROKE_MORT = -1 THEN ''Non-eligible'' WHEN   IQI17A_ACUTE_STROKE_MORT = 0 THEN ''Eligible'' WHEN  IQI17A_ACUTE_STROKE_MORT  = 1 THEN ''Positive'' END As  IQI17A_ACUTE_STROKE_MORT
       , 
CASE 
WHEN  IQI17B_ACUTE_STROKE_MORT = -1 THEN ''Non-eligible'' WHEN   IQI17B_ACUTE_STROKE_MORT = 0 THEN ''Eligible'' WHEN  IQI17B_ACUTE_STROKE_MORT  = 1 THEN ''Positive'' END As  IQI17B_ACUTE_STROKE_MORT
       , 
CASE 
WHEN  IQI17C_ACUTE_STROKE_MORT = -1 THEN ''Non-eligible'' WHEN   IQI17C_ACUTE_STROKE_MORT = 0 THEN ''Eligible'' WHEN  IQI17C_ACUTE_STROKE_MORT  = 1 THEN ''Positive'' END As  IQI17C_ACUTE_STROKE_MORT
       , 
CASE 
WHEN  ANES_COMP = -1 THEN ''Non-eligible'' WHEN   ANES_COMP = 0 THEN ''Eligible'' WHEN  ANES_COMP  = 1 THEN ''Positive'' END As  ANES_COMP
       , 
CASE 
WHEN  ASPIR_PNEUMONIA = -1 THEN ''Non-eligible'' WHEN   ASPIR_PNEUMONIA = 0 THEN ''Eligible'' WHEN  ASPIR_PNEUMONIA  = 1 THEN ''Positive'' END As  ASPIR_PNEUMONIA
       , 
CASE 
WHEN  BIRTH_TRAUMA = -1 THEN ''Non-eligible'' WHEN   BIRTH_TRAUMA = 0 THEN ''Eligible'' WHEN  BIRTH_TRAUMA  = 1 THEN ''Positive'' END As  BIRTH_TRAUMA
       , 
CASE 
WHEN  CABG_AFTER_PTCA = -1 THEN ''Non-eligible'' WHEN   CABG_AFTER_PTCA = 0 THEN ''Eligible'' WHEN  CABG_AFTER_PTCA  = 1 THEN ''Positive'' END As  CABG_AFTER_PTCA
       , 
CASE 
WHEN  DEATH_LOW_MORT_DRG = -1 THEN ''Non-eligible'' WHEN   DEATH_LOW_MORT_DRG = 0 THEN ''Eligible'' WHEN  DEATH_LOW_MORT_DRG  = 1 THEN ''Positive'' END As  DEATH_LOW_MORT_DRG
       , 
CASE 
WHEN  DECUB_ULCER_RISK_PAT = -1 THEN ''Non-eligible'' WHEN   DECUB_ULCER_RISK_PAT = 0 THEN ''Eligible'' WHEN  DECUB_ULCER_RISK_PAT  = 1 THEN ''Positive'' END As  DECUB_ULCER_RISK_PAT
       , 
CASE 
WHEN  DECUBITUS_ULCER = -1 THEN ''Non-eligible'' WHEN   DECUBITUS_ULCER = 0 THEN ''Eligible'' WHEN  DECUBITUS_ULCER  = 1 THEN ''Positive'' END As  DECUBITUS_ULCER
       , 
CASE 
WHEN  FAIL_RESCUE = -1 THEN ''Non-eligible'' WHEN   FAIL_RESCUE = 0 THEN ''Eligible'' WHEN  FAIL_RESCUE  = 1 THEN ''Positive'' END As  FAIL_RESCUE
       , 
CASE 
WHEN  FAIL_RESCUE_A = -1 THEN ''Non-eligible'' WHEN   FAIL_RESCUE_A = 0 THEN ''Eligible'' WHEN  FAIL_RESCUE_A  = 1 THEN ''Positive'' END As  FAIL_RESCUE_A
       , 
CASE 
WHEN  FAIL_RESCUE_B = -1 THEN ''Non-eligible'' WHEN   FAIL_RESCUE_B = 0 THEN ''Eligible'' WHEN  FAIL_RESCUE_B  = 1 THEN ''Positive'' END As  FAIL_RESCUE_B
       , 
CASE 
WHEN  FAIL_RESCUE_C = -1 THEN ''Non-eligible'' WHEN   FAIL_RESCUE_C = 0 THEN ''Eligible'' WHEN  FAIL_RESCUE_C  = 1 THEN ''Positive'' END As  FAIL_RESCUE_C
       , 
CASE 
WHEN  FAIL_RESCUE_D = -1 THEN ''Non-eligible'' WHEN   FAIL_RESCUE_D = 0 THEN ''Eligible'' WHEN  FAIL_RESCUE_D  = 1 THEN ''Positive'' END As  FAIL_RESCUE_D
       , 
CASE 
WHEN  FAIL_RESCUE_E = -1 THEN ''Non-eligible'' WHEN   FAIL_RESCUE_E = 0 THEN ''Eligible'' WHEN  FAIL_RESCUE_E  = 1 THEN ''Positive'' END As  FAIL_RESCUE_E
       , 
CASE 
WHEN  FOREIGN_BODY_LEFT = -1 THEN ''Non-eligible'' WHEN   FOREIGN_BODY_LEFT = 0 THEN ''Eligible'' WHEN  FOREIGN_BODY_LEFT  = 1 THEN ''Positive'' END As  FOREIGN_BODY_LEFT
       , 
CASE 
WHEN  IN_HOSP_FRAC = -1 THEN ''Non-eligible'' WHEN   IN_HOSP_FRAC = 0 THEN ''Eligible'' WHEN  IN_HOSP_FRAC  = 1 THEN ''Positive'' END As  IN_HOSP_FRAC
       , 
CASE 
WHEN  INFECTION_MED_CARE = -1 THEN ''Non-eligible'' WHEN   INFECTION_MED_CARE = 0 THEN ''Eligible'' WHEN  INFECTION_MED_CARE  = 1 THEN ''Positive'' END As  INFECTION_MED_CARE
       , 
CASE 
WHEN  INTRAOP_NERVE_COMP = -1 THEN ''Non-eligible'' WHEN   INTRAOP_NERVE_COMP = 0 THEN ''Eligible'' WHEN  INTRAOP_NERVE_COMP  = 1 THEN ''Positive'' END As  INTRAOP_NERVE_COMP
       , 
CASE 
WHEN  LATRO_PNEUMOTHORAX = -1 THEN ''Non-eligible'' WHEN   LATRO_PNEUMOTHORAX = 0 THEN ''Eligible'' WHEN  LATRO_PNEUMOTHORAX  = 1 THEN ''Positive'' END As  LATRO_PNEUMOTHORAX
       , 
CASE 
WHEN  MALIG_HYPERTHERMIA = -1 THEN ''Non-eligible'' WHEN   MALIG_HYPERTHERMIA = 0 THEN ''Eligible'' WHEN  MALIG_HYPERTHERMIA  = 1 THEN ''Positive'' END As  MALIG_HYPERTHERMIA
       , 
CASE 
WHEN  OB_LACERATIONS = -1 THEN ''Non-eligible'' WHEN   OB_LACERATIONS = 0 THEN ''Eligible'' WHEN  OB_LACERATIONS  = 1 THEN ''Positive'' END As  OB_LACERATIONS
       , 
CASE 
WHEN  OB_TRA_CSECT = -1 THEN ''Non-eligible'' WHEN   OB_TRA_CSECT = 0 THEN ''Eligible'' WHEN  OB_TRA_CSECT  = 1 THEN ''Positive'' END As  OB_TRA_CSECT
       , 
CASE 
WHEN  OB_TRA_VAG_W_INSTR = -1 THEN ''Non-eligible'' WHEN   OB_TRA_VAG_W_INSTR = 0 THEN ''Eligible'' WHEN  OB_TRA_VAG_W_INSTR  = 1 THEN ''Positive'' END As  OB_TRA_VAG_W_INSTR
       , 
CASE 
WHEN  OB_TRA_VAG_WO_INSTR = -1 THEN ''Non-eligible'' WHEN   OB_TRA_VAG_WO_INSTR = 0 THEN ''Eligible'' WHEN  OB_TRA_VAG_WO_INSTR  = 1 THEN ''Positive'' END As  OB_TRA_VAG_WO_INSTR
       , 
CASE 
WHEN  OB_WOUND_CSECT = -1 THEN ''Non-eligible'' WHEN   OB_WOUND_CSECT = 0 THEN ''Eligible'' WHEN  OB_WOUND_CSECT  = 1 THEN ''Positive'' END As  OB_WOUND_CSECT
       , 
CASE 
WHEN  OB_WOUND_VAG = -1 THEN ''Non-eligible'' WHEN   OB_WOUND_VAG = 0 THEN ''Eligible'' WHEN  OB_WOUND_VAG  = 1 THEN ''Positive'' END As  OB_WOUND_VAG
       , 
CASE 
WHEN  OTHER_OB_COMP_DEL = -1 THEN ''Non-eligible'' WHEN   OTHER_OB_COMP_DEL = 0 THEN ''Eligible'' WHEN  OTHER_OB_COMP_DEL  = 1 THEN ''Positive'' END As  OTHER_OB_COMP_DEL
       , 
CASE 
WHEN  POST_PART_URIN_INFECT = -1 THEN ''Non-eligible'' WHEN   POST_PART_URIN_INFECT = 0 THEN ''Eligible'' WHEN  POST_PART_URIN_INFECT  = 1 THEN ''Positive'' END As  POST_PART_URIN_INFECT
       , 
CASE 
WHEN  POSTOP_AMI = -1 THEN ''Non-eligible'' WHEN   POSTOP_AMI = 0 THEN ''Eligible'' WHEN  POSTOP_AMI  = 1 THEN ''Positive'' END As  POSTOP_AMI
       , 
CASE 
WHEN  POSTOP_DERANGEMNTS = -1 THEN ''Non-eligible'' WHEN   POSTOP_DERANGEMNTS = 0 THEN ''Eligible'' WHEN  POSTOP_DERANGEMNTS  = 1 THEN ''Positive'' END As  POSTOP_DERANGEMNTS
       , 
CASE 
WHEN  POSTOP_HEM = -1 THEN ''Non-eligible'' WHEN   POSTOP_HEM = 0 THEN ''Eligible'' WHEN  POSTOP_HEM  = 1 THEN ''Positive'' END As  POSTOP_HEM
       , 
CASE 
WHEN  POSTOP_HIP_FRAC = -1 THEN ''Non-eligible'' WHEN   POSTOP_HIP_FRAC = 0 THEN ''Eligible'' WHEN  POSTOP_HIP_FRAC  = 1 THEN ''Positive'' END As  POSTOP_HIP_FRAC
       , 
CASE 
WHEN POSTOP_IATRO_CARD = -1 THEN ''Non-eligible'' WHEN   POSTOP_IATRO_CARD = 0 THEN ''Eligible'' WHEN POSTOP_IATRO_CARD  = 1 THEN ''Positive'' END As POSTOP_IATRO_CARD
       , 
CASE 
WHEN  POSTOP_IATRO_NERV = -1 THEN ''Non-eligible'' WHEN   POSTOP_IATRO_NERV = 0 THEN ''Eligible'' WHEN  POSTOP_IATRO_NERV  = 1 THEN ''Positive'' END As  POSTOP_IATRO_NERV
       , 
CASE 
WHEN  POSTOP_PUL_EMB = -1 THEN ''Non-eligible'' WHEN   POSTOP_PUL_EMB = 0 THEN ''Eligible'' WHEN  POSTOP_PUL_EMB  = 1 THEN ''Positive'' END As  POSTOP_PUL_EMB
       , 
CASE 
WHEN  POSTOP_RESP_FAILURE = -1 THEN ''Non-eligible'' WHEN   POSTOP_RESP_FAILURE = 0 THEN ''Eligible'' WHEN  POSTOP_RESP_FAILURE  = 1 THEN ''Positive'' END As  POSTOP_RESP_FAILURE
       , 
CASE 
WHEN  POSTOP_SEPSIS = -1 THEN ''Non-eligible'' WHEN   POSTOP_SEPSIS = 0 THEN ''Eligible'' WHEN  POSTOP_SEPSIS  = 1 THEN ''Positive'' END As  POSTOP_SEPSIS
       , 
CASE 
WHEN  POSTOP_WOUND_DEHIS = -1 THEN ''Non-eligible'' WHEN   POSTOP_WOUND_DEHIS = 0 THEN ''Eligible'' WHEN  POSTOP_WOUND_DEHIS  = 1 THEN ''Positive'' END As  POSTOP_WOUND_DEHIS
       , 
CASE 
WHEN  REOPEN_SURG_SITE = -1 THEN ''Non-eligible'' WHEN   REOPEN_SURG_SITE = 0 THEN ''Eligible'' WHEN  REOPEN_SURG_SITE  = 1 THEN ''Positive'' END As  REOPEN_SURG_SITE
       , 
CASE 
WHEN  SUTURE_LACERATION = -1 THEN ''Non-eligible'' WHEN   SUTURE_LACERATION = 0 THEN ''Eligible'' WHEN  SUTURE_LACERATION  = 1 THEN ''Positive'' END As  SUTURE_LACERATION
       , 
CASE 
WHEN  TECH_DIFF_PROC = -1 THEN ''Non-eligible'' WHEN   TECH_DIFF_PROC = 0 THEN ''Eligible'' WHEN  TECH_DIFF_PROC  = 1 THEN ''Positive'' END As  TECH_DIFF_PROC
       , 
CASE 
WHEN  TRANSF_REACTION = -1 THEN ''Non-eligible'' WHEN   TRANSF_REACTION = 0 THEN ''Eligible'' WHEN  TRANSF_REACTION  = 1 THEN ''Positive'' END As  TRANSF_REACTION
       , 
CASE 
WHEN  UTERINE_RUPTURE = -1 THEN ''Non-eligible'' WHEN   UTERINE_RUPTURE = 0 THEN ''Eligible'' WHEN  UTERINE_RUPTURE  = 1 THEN ''Positive'' END As  UTERINE_RUPTURE
       , MMBR_OF_ASTHM_RGSTRY_CDS
       , MMBR_OF_CKD_RGSTRY_CDS
       , MMBR_OF_COPD_RGSTRY_CDS
       , MMBR_OF_CHF_RGSTRY_CDS
       , MMBR_OF_CAD_RGSTRY_CDS
       , MMBR_OF_CF_RGSTRY_CDS
       , MMBR_OF_DIABTS_RGSTRY_CDS
       , MMBR_OF_HIV_RGSTRY_CDS
       , MMBR_OF_HTN_RGSTRY_CDS
       , MMBR_OF_OBSTY_RGSTRY_CDS
       , MMBR_OF_OPD_RGSTRY_CDS
       , MMBR_OF_PREDIABTS_RGSTRY_CDS
       , MMBR_OF_TBCCO_RGSTRY_CDS
       , IS_ENC_MDCR_CDS
       , IS_ENC_MDCD_CDS
       , PCP_PRMRY_DEPT_SK
       , PCP_PROVDR_SK
       , PAT_HAS_FLLWP_DCMNTD_CDS
       , REV_LOC_CDS
       , I.SRC_CD
       , 
CASE PX_IND 
WHEN 0 THEN ''No'' WHEN 1 THEN ''Yes'' END AS PX_IND
       , IN_DEMOGRAPHICS_DISTRIB
       , IN_ANALYSIS_A1_CDS
       , IN_ANALYSIS_A1
       , IN_ANALYSIS_A2_CDS
       , IN_ANALYSIS_A2
       , IN_ANALYSIS_D1_CDS
       , IN_ANALYSIS_D1
       , IN_ANALYSIS_D2_CDS
       , IN_ANALYSIS_D2
       , IN_ANALYSIS_D3_CDS
       , IN_ANALYSIS_D3
       , IN_ANALYSIS_E1_CDS
       , IN_ANALYSIS_E1
       , IN_ANALYSIS_E2_CDS
       , IN_ANALYSIS_E2
       , IN_ANALYSIS_E4_CDS
       , IN_ANALYSIS_E4
       , IN_ANALYSIS_E7_CDS
       , IN_ANALYSIS_E7
       , IN_ANALYSIS_I1_CDS
       , IN_ANALYSIS_I1
       , IN_ANALYSIS_I3_CDS
       , IN_ANALYSIS_I3
       , IN_ANALYSIS_I4_CDS
       , IN_ANALYSIS_I4
       , IN_ANALYSIS_I5_CDS
       , IN_ANALYSIS_I5
       , IN_ANALYSIS_I6_CDS
       , IN_ANALYSIS_I6
       , IN_ANALYSIS_L2_CDS
       , IN_ANALYSIS_L2
       , IN_ANALYSIS_L3_CDS
       , IN_ANALYSIS_L3
       , IN_ANALYSIS_L5_CDS
       , IN_ANALYSIS_L5
       , IN_ANALYSIS_L6_CDS
       , IN_ANALYSIS_L6
       , IN_ANALYSIS_L8_CDS
       , IN_ANALYSIS_L8
       , IN_ANALYSIS_M2_CDS
       , IN_ANALYSIS_M2
       , IN_ANALYSIS_M3_CDS
       , IN_ANALYSIS_M3
       , IN_ANALYSIS_M4_CDS
       , IN_ANALYSIS_M4
       , IN_ANALYSIS_N1_CDS
       , IN_ANALYSIS_N1
       , IN_ANALYSIS_N2_CDS
       , IN_ANALYSIS_N2
       , IN_ANALYSIS_N3_CDS
       , IN_ANALYSIS_N3
       , IN_ANALYSIS_N4_CDS
       , IN_ANALYSIS_N4
       , IN_ANALYSIS_N5_CDS
       , IN_ANALYSIS_N5
       , IN_ANALYSIS_N6_CDS
       , IN_ANALYSIS_N6
       , IN_ANALYSIS_O2_CDS
       , IN_ANALYSIS_O2
       , IN_ANALYSIS_O3_CDS
       , IN_ANALYSIS_O3
       , IN_ANALYSIS_O4_CDS
       , IN_ANALYSIS_O4
       , IN_ANALYSIS_P1_CDS
       , IN_ANALYSIS_P1
       , IN_ANALYSIS_P2_CDS
       , IN_ANALYSIS_P2
       , IN_ANALYSIS_P3_CDS
       , IN_ANALYSIS_P3
       , IN_ANALYSIS_P4_CDS
       , IN_ANALYSIS_P4
       , IN_ANALYSIS_P5_CDS
       , IN_ANALYSIS_P5
       , IN_ANALYSIS_Q11822_1_CDS
       , IN_ANALYSIS_Q11822_1
       , IN_ANALYSIS_R1_CDS
       , IN_ANALYSIS_R1
       , IN_ANALYSIS_R2_CDS
       , IN_ANALYSIS_R2
       , IN_ANALYSIS_R3_CDS
       , IN_ANALYSIS_R3
       , IN_ANALYSIS_R4_CDS
       , IN_ANALYSIS_R4
       , IN_ANALYSIS_R5_CDS
       , IN_ANALYSIS_R5
       , IN_ANALYSIS_T1_CDS
       , IN_ANALYSIS_T1
       , IN_ANALYSIS_T3_CDS
       , IN_ANALYSIS_T3
       , IN_ANALYSIS_T5_CDS
       , IN_ANALYSIS_T5
       , IN_ANALYSIS_T7_CDS
       , IN_ANALYSIS_T7
       , IN_ANALYSIS_V2_CDS
       , IN_ANALYSIS_V2
       , IN_ANALYSIS_V3_CDS
       , IN_ANALYSIS_V3
       , IN_CAHPS_CMS_1
       , IN_CAHPS_CMS_1_CDS
       , IN_CAHPS_CMS_10
       , IN_CAHPS_CMS_10_CDS
       , IN_CAHPS_CMS_11
       , IN_CAHPS_CMS_11_CDS
       , IN_CAHPS_CMS_12
       , IN_CAHPS_CMS_12_CDS
       , IN_CAHPS_CMS_13CL
       , IN_CAHPS_CMS_13CL_CDS
       , IN_CAHPS_CMS_14
       , IN_CAHPS_CMS_14_CDS
       , IN_CAHPS_CMS_15CL
       , IN_CAHPS_CMS_15CL_CDS
       , IN_CAHPS_CMS_16CL
       , IN_CAHPS_CMS_16CL_CDS
       , IN_CAHPS_CMS_18
       , IN_CAHPS_CMS_18_CDS
       , IN_CAHPS_CMS_19CL
       , IN_CAHPS_CMS_19CL_CDS
       , IN_CAHPS_CMS_2
       , IN_CAHPS_CMS_2_CDS
       , IN_CAHPS_CMS_20
       , IN_CAHPS_CMS_20_CDS
       , IN_CAHPS_CMS_21CL
       , IN_CAHPS_CMS_21CL_CDS
       , IN_CAHPS_CMS_22CL
       , IN_CAHPS_CMS_22CL_CDS
       , IN_CAHPS_CMS_23
       , IN_CAHPS_CMS_23_CDS
       , IN_CAHPS_CMS_24
       , IN_CAHPS_CMS_24_CDS
       , IN_CAHPS_CMS_25
       , IN_CAHPS_CMS_25_CDS
       , IN_CAHPS_CMS_26
       , IN_CAHPS_CMS_26_CDS
       , IN_CAHPS_CMS_27
       , IN_CAHPS_CMS_27_CDS
       , IN_CAHPS_CMS_28
       , IN_CAHPS_CMS_28_CDS
       , IN_CAHPS_CMS_29A
       , IN_CAHPS_CMS_29A_CDS
       , IN_CAHPS_CMS_29B
       , IN_CAHPS_CMS_29B_CDS
       , IN_CAHPS_CMS_29C
       , IN_CAHPS_CMS_29C_CDS
       , IN_CAHPS_CMS_29D
       , IN_CAHPS_CMS_29D_CDS
       , IN_CAHPS_CMS_29E
       , IN_CAHPS_CMS_29E_CDS
       , IN_CAHPS_CMS_3
       , IN_CAHPS_CMS_3_CDS
       , IN_CAHPS_CMS_30
       , IN_CAHPS_CMS_30_CDS
       , IN_CAHPS_CMS_33CL
       , IN_CAHPS_CMS_33CL_CDS
       , IN_CAHPS_CMS_34
       , IN_CAHPS_CMS_34_CDS
       , IN_CAHPS_CMS_37CL
       , IN_CAHPS_CMS_37CL_CDS
       , IN_CAHPS_CMS_38
       , IN_CAHPS_CMS_38_CDS
       , IN_CAHPS_CMS_39
       , IN_CAHPS_CMS_39_CDS
       , IN_CAHPS_CMS_40
       , IN_CAHPS_CMS_40_CDS
       , IN_CAHPS_CMS_41
       , IN_CAHPS_CMS_41_CDS
       , IN_CAHPS_CMS_6
       , IN_CAHPS_CMS_6_CDS
       , IN_CAHPS_CMS_7
       , IN_CAHPS_CMS_7_CDS
       , IN_CAHPS_CMS_8
       , IN_CAHPS_CMS_8_CDS , 
CASE READMSN_INDX_ADMSN_IND 
WHEN 0 THEN ''No'' WHEN 1 THEN ''Yes'' END AS READMISSION_INDX_ADMSN_IND
       , 
CASE READMSN_READMSN_IND 
WHEN 0 THEN ''No'' WHEN 1 THEN ''Yes'' END  AS READMISSION_READMSN_IND
       , READMSN_PLN_UNPLN AS READMISSION_PLN_UNPLN
	, 
CASE READMSN_AMI 
WHEN 0 THEN ''No'' WHEN 1 THEN ''Yes'' ELSE ''Not Applicable'' END AS READMISSION_AMI_IND 
	, 
CASE READMSN_HF 
WHEN 0 THEN ''No'' WHEN 1 THEN ''Yes'' ELSE ''Not Applicable'' END AS READMISSION_HF_IND
	, 
CASE READMSN_COPD 
WHEN 0 THEN ''No'' WHEN 1 THEN ''Yes'' ELSE ''Not Applicable'' END AS READMISSION_COPD_IND
	, 
CASE READMSN_PNEU 
WHEN 0 THEN ''No'' WHEN 1 THEN ''Yes'' ELSE ''Not Applicable'' END AS READMISSION_PNEU_IND
	, 
CASE READMSN_CABG 
WHEN 0 THEN ''No'' WHEN 1 THEN ''Yes'' ELSE ''Not Applicable'' END AS READMISSION_CABG_IND
	, 
CASE READMSN_THATKA 
WHEN 0 THEN ''No'' WHEN 1 THEN ''Yes'' ELSE ''Not Applicable'' END AS READMISSION_THATKA_IND
	, 
CASE READMSN_SEPSIS 
WHEN 0 THEN ''No'' WHEN 1 THEN ''Yes'' ELSE ''Not Applicable'' END AS READMISSION_SEPSIS_IND
       , READMSN_CASE_IND
FROM CUBESPRD.INPTNT_DIM I
INNER JOIN CUBESPRD.INPTNT_FACT IF ON I.INPTNT_VST_SK = IF.INPTNT_VST_SK')
,(12,'InpatientDischargeDestinationDim','InpatientDischargeDestinationDim','InpatientDischargeDestinationDim','SELECT DISTINCT
DSCRG_DSTN_CDS, 
DSCRG_DSTN_DESC
FROM CUBESPRD.INPTNT_DIM')
,(11,'InpatientDischargeDispositionDim','InpatientDischargeDispositionDim','InpatientDischargeDispositionDim','SELECT DISTINCT
INT4(IP.DSCRG_DSPSTN_CDS) AS DSCRG_DSPSTN_CDS, 
IP.DSCRG_DSPSTN_DESC
FROM CUBESPRD.INPTNT_DIM IP 
WHERE ((IP.INPTNT_VST_SK > 0) 
AND (INT4(IP.DSCRG_DSPSTN_CDS) > 0)) AND (INT4(IP.DSCRG_DSPSTN_CDS) <>101)')
,(7,'InpatientFact','InpatientFact','InpatientFact','SELECT INPTNT_VST_SK
       , SRC_ENCNT_ID
       , CLNC_INPTNT_ADMT_DT
       , CLNC_INPTNT_ADMT_TS_SK 
       , ENCNT_SK
       , AGE_YRS_AT_CLNC_INPTNT_ADMT
	   , CASE WHEN AGE_YRS_AT_CLNC_INPTNT_ADMT=0 THEN 0 
		WHEN (AGE_YRS_AT_CLNC_INPTNT_ADMT<0 
		OR AGE_YRS_AT_CLNC_INPTNT_ADMT> 120) THEN NULL ELSE Log(AGE_YRS_AT_CLNC_INPTNT_ADMT)
		END As AGE_YRS_AT_CLNC_INPTNT_ADMT_Log
       , AGE_MNTHS_AT_CLNC_INPTNT_ADMT
       , AGE_DYS_AT_CLNC_INPTNT_ADMT
       , LOS_DYS_CLNC_INPTNT
	   , LOS_HRS_CLNC_INPTNT
       , CASE WHEN LOS_DYS_CLNC_INPTNT=0 THEN 0 
		WHEN LOS_DYS_CLNC_INPTNT<0 THEN NULL ELSE Log(LOS_DYS_CLNC_INPTNT)
		END As LOS_DYS_CLNC_INPTNT_Log
       , CASE WHEN LOS_HRS_CLNC_INPTNT=0 THEN 0 
		WHEN LOS_HRS_CLNC_INPTNT < 0 THEN NULL ELSE Log(LOS_HRS_CLNC_INPTNT)
		END As LOS_HRS_CLNC_INPTNT_Log
       , INPTNT_APPT_MADE_DT
       , HSPTL_ADMT_DT
       , HSPTL_ADMT_TS_SK
       , HSPTL_DSCRG_DT
       , HSPTL_DSCRG_TS_SK
       , PRMY_CDD_PRCDR_SK
       , PRMY_CDD_DIAG_SK
       , LOS_DYS_EXPCT_INPTNT
	   , PTNT_SK 
	   , HSPTL_ADMT_PROVDR_SK
       , HSPTL_DSCRG_PROVDR_SK
  FROM CUBESPRD.INPTNT_FACT')
,(8,'InpatientPatientClassDim','InpatientPatientClassDim','InpatientPatientClassDim','SELECT DISTINCT
INT4(IP.PTNT_CL_CDS) 
AS PTNT_CL_CDS, 
IP.PTNT_CL_DESC 
FROM CUBESPRD.INPTNT_DIM IP 
WHERE ((IP.INPTNT_VST_SK > 0) 
AND (INT4(IP.PTNT_CL_CDS) > 0))')
,(90,'LabComponentDim','LabComponentDim','LabComponentDim','SELECT CMPNT_SK
       , CMPNT_NM ||'' ('' ||SRC_CMPNT_ID ||'')'' COMP_NAME
       , CMPNT_ABBR
       , BAS_NM
       , CMN_NM
       , CMPNT_TYPE_CDS
       , CMPNT_SUBT_CDS
       , DFLT_UNT
       , EXPCT_MIN_VAL
       , EXPCT_MAX_VAL
  FROM EDW_PRD.CUBESPRD.LAB_CMPNT_DIM')
,(94,'LabComponentResultFact','LabComponentResultFact','LabComponentResultFact','SELECT CMPNT_RSLT_FACT_SK
       , SRC_CMPNT_RSLT_ID
       , R.LAB_TST_SK
       , R.PTNT_SK
       , AUTH_PROVDR_SK
       , PRCDR_CD_SK
       , R.ENCNT_SK
       , CASE WHEN RSULT_LAB_SK < 0 OR RSULT_LAB_SK=1500001 THEN NULL ELSE RSULT_LAB_SK END RSULT_LAB_SK
       , LAB_CMPNT_SK
       , RSLT_FLG_CD_SK
       , LAB_STS_CD_SK
       , ORDRD_DT
       , ORDRD_TS_SK
       , CLCT_TS_SK
       , CASE WHEN CLCT_DT > NOW() THEN NULL ELSE  CLCT_DT END AS  CLCT_DT
       , RSLT_DT
       , RSLT_TS_SK
       , RSLT_VAL_INTG
       , RSLT_VAL_FLT
       , RSLT_VAL_TXT
       , REF_UNT
       , REF_NRML_VAL
       , REFN_LOW_VAL
       , REFN_HI_VAL
       , R.ABNRML_IND
  FROM EDW_PRD.CUBESPRD.LAB_CMPNT_RSLT_FACT R  
 INNER JOIN CUBESPRD.PTNT_DIM P ON R.PTNT_SK = P.PTNT_SK
 INNER JOIN CUBESPRD.ENCNT_DIM E ON R.ENCNT_SK = E.ENCNT_SK  
 INNER JOIN DW.LAB_TST_DIM AS DLTD ON R.LAB_TST_SK= DLTD.LAB_TST_SK AND DLTD.ORDR_TYPE_CDS IN (''3'',''31'',''61'',''7'')')
,(95,'LabComponentResultFactLabStatusDim','LabComponentResultFactLabStatusDim','LabComponentResultFactLabStatusDim','SELECT  DISTINCT R.LAB_STS_CD_SK, CD_DESC
  FROM EDW_PRD.DW.CMN_CD_DIM CD
  INNER JOIN CUBESPRD.LAB_CMPNT_RSLT_FACT R ON R.LAB_STS_CD_SK = CD.CMN_CD_SK
WHERE R.LAB_STS_CD_SK IS NOT NULL')
,(91,'LabComponentResultFactResultFlagDim','LabComponentResultFactResultFlagDim','LabComponentResultFactResultFlagDim','SELECT  DISTINCT R.RSLT_FLG_CD_SK, 
	CD_DESC
  FROM EDW_PRD.DW.CMN_CD_DIM CD
  INNER JOIN CUBESPRD.LAB_CMPNT_RSLT_FACT R ON R.RSLT_FLG_CD_SK = CD.CMN_CD_SK
 WHERE R.RSLT_FLG_CD_SK IS NOT NULL')
,(92,'LabComponentSubstrateDim','LabComponentSubstrateDim','LabComponentSubstrateDim','SELECT DISTINCT 
 	 CMPNT_SUBT_CDS
       , CMPNT_SUBT_NM
 FROM  EDW_PRD.CUBESPRD.LAB_CMPNT_DIM
WHERE  	 CMPNT_SUBT_CDS IS NOT NULL')
,(93,'LabComponentTypeDim','LabComponentTypeDim','LabComponentTypeDim','SELECT DISTINCT 
         CMPNT_TYPE_CDS
       , CMPNT_TYPE_NM
FROM EDW_PRD.CUBESPRD.LAB_CMPNT_DIM
WHERE CMPNT_TYPE_CDS IS NOT NULL')
,(96,'LabDim','LabDim','LabDim','SELECT   LAB_SK
       , LAB_NM ||'' (''  || SRC_LAB_ID ||'')'' LAB_NAME
       , LAB_ADDR
       , LAB_CITY
       , LAB_ST_CDS
       , LAB_ST_ABBR
       , LAB_PSTL_CDS
  FROM EDW_PRD.CUBESPRD.LAB_DIM
  WHERE LAB_SK > 0 AND LAB_SK <> 1500001')
,(97,'LabTestCancellationReasonDim','LabTestCancellationReasonDim','LabTestCancellationReasonDim','SELECT DISTINCT
CNCL_RSN_CDS, CNCL_RSN_DESC
FROM CUBESPRD.LAB_TST_DIM
WHERE CNCL_RSN_CDS IS NOT NULL')
,(98,'LabTestDim','LabTestDim','LabTestDim','SELECT LTD.LAB_TST_SK
       , LTD.SRC_TST_ID
       , LTD.RSULT_LAB_CDS
       , LTD.TST_CDS
       , LTD.ABNRML_LEVL_DESC
       , LTD.VRFCTN_STS_CDS
       , LTD.ORDR_PRTY_CDS
       , LTD.ORDR_SRC_TYPE_CDS
       , LTD.SPCMN_NM
       , CASE WHEN LTD.SPCMN_TYPE_DESC=''NOT_ENTERED'' THEN NULL ELSE LTD.SPCMN_TYPE_CDS END AS SPCMN_TYPE_CDS
       , LTD.SPCMN_SRC_CDS
       , LTD.CNCL_RSN_CDS
       , CASE WHEN LTD.HI_PRTY_IND = 0 THEN ''No'' WHEN LTD.HI_PRTY_IND = 1 THEN ''Yes'' ELSE NULL END HI_PRTY_IND
       , CASE WHEN LTD.CORR_IND = 0 THEN ''No'' WHEN LTD.CORR_IND = 1 THEN ''Yes'' ELSE NULL END CORR_IND
       , CASE WHEN LTD.CRTCL_IND = 0 THEN ''No'' WHEN LTD.CRTCL_IND = 1 THEN ''Yes'' ELSE NULL END CRTCL_IND
       , CASE WHEN LTD.ABNRML_IND = 0 THEN ''No'' WHEN LTD.ABNRML_IND = 1 THEN ''Yes'' ELSE NULL END ABNRML_IND
       , DLTD.ORDR_TYPE_CDS :: INT AS ORDR_TYPE_CDS
  FROM CUBESPRD.LAB_TST_DIM LTD INNER JOIN DW.LAB_TST_DIM AS DLTD ON LTD.LAB_TST_SK= DLTD.LAB_TST_SK AND DLTD.ORDR_TYPE_CDS IN (''3'',''31'',''61'',''7'')')
,(99,'LabTestFact','LabTestFact','LabTestFact','SELECT LAB_TST_FACT_SK
       , LTF.SRC_TST_ID
       , LTF.LAB_TST_SK
       , LTF.PTNT_SK
       , AUTH_PROVDR_SK
       , PRCDR_CD_SK
       , LTF.ENCNT_SK
       , CASE WHEN RSULT_LAB_SK < 0 OR RSULT_LAB_SK=1500001 THEN NULL ELSE RSULT_LAB_SK
 END AS RSULT_LAB_SK
       , CASE WHEN YEAR(ORDRD_DT) = ''1000'' THEN NULL ELSE ORDRD_DT END ORDRD_DT
       , ORDRD_TS_SK
       , CLCT_USR_SK
       , CLCT_DEPT_SK
       , CASE WHEN (YEAR(CLCT_DT) < 1900 OR YEAR(CLCT_DT) > 2100) THEN NULL ELSE CLCT_DT END CLCT_DT
       , CLCT_TS_SK
       , CASE WHEN YEAR(SCHED_CLCT_DT) < 1860 THEN NULL ELSE SCHED_CLCT_DT END SCHED_CLCT_DT
       , SCHED_CLCT_TS_SK
       , CASE WHEN YEAR(FRST_FNL_VRFY_DT) = ''1000'' THEN NULL ELSE FRST_FNL_VRFY_DT END FRST_FNL_VRFY_DT  
       , FRST_FNL_VRFY_USR_SK
       , CASE WHEN YEAR(FRST_VRFY_DT) = ''1000'' THEN NULL ELSE FRST_VRFY_DT END FRST_VRFY_DT
       , FRST_VRFY_USR_SK
       , CASE WHEN YEAR(LST_FNL_VRFY_DT) = ''1000'' THEN NULL ELSE LST_FNL_VRFY_DT END LST_FNL_VRFY_DT
       , LST_FNL_VRFY_USR_SK
       , CASE WHEN YEAR(LST_VRFY_DT) = ''1000'' THEN NULL ELSE LST_VRFY_DT END LST_VRFY_DT
       , CASE WHEN YEAR(FRST_CORR_DT) = ''1000'' THEN NULL ELSE FRST_CORR_DT END FRST_CORR_DT
       , FRST_CORR_USR_SK
       , CASE WHEN YEAR(LST_CORR_DT) = ''1000'' THEN NULL ELSE LST_CORR_DT END LST_CORR_DT
       , LST_CORR_USR_SK
       , COLL_TM_MNT
  FROM EDW_PRD.CUBESPRD.LAB_TST_FACT LTF INNER JOIN CUBESPRD.ENCNT_DIM E ON LTF.ENCNT_SK=E.ENCNT_SK INNER JOIN EDW_PRD.CUBESPRD.PTNT_DIM PD ON  LTF.PTNT_SK=PD.PTNT_SK
  INNER JOIN DW.LAB_TST_DIM AS DLTD ON LTF.LAB_TST_SK= DLTD.LAB_TST_SK AND DLTD.ORDR_TYPE_CDS IN (''3'',''31'',''61'',''7'')')
,(100,'LabTestNameDim','LabTestNameDim','LabTestNameDim','SELECT DISTINCT 
	TST_CDS,	 
	TST_NM ||'' ('' ||TST_CDS ||'')'' TEST_NAME
FROM CUBESPRD.LAB_TST_DIM')
,(101,'LabTestOrderPriorityDim','LabTestOrderPriorityDim','LabTestOrderPriorityDim','SELECT DISTINCT ORDR_PRTY_CDS, ORDR_PRTY_DESC
FROM CUBESPRD.LAB_TST_DIM
WHERE ORDR_PRTY_CDS IS NOT NULL')
,(102,'LabTestOrderSourceTypeDim','LabTestOrderSourceTypeDim','LabTestOrderSourceTypeDim','SELECT DISTINCT ORDR_SRC_TYPE_CDS, ORDR_SRC_TYPE_DESC
FROM CUBESPRD.LAB_TST_DIM
WHERE ORDR_SRC_TYPE_CDS IS NOT NULL')
,(140,'LabTestOrderType','LabTestOrderTypeDim','LabTestOrderTypeDim','SELECT DISTINCT 
       ORDR_TYPE_CDS :: INT AS ORDR_TYPE_CDS, ORDR_TYPE_DESC
  FROM DW.LAB_TST_DIM WHERE ORDR_TYPE_CDS IN (''3'',''31'',''61'',''7'')')
,(103,'LabTestSpecimenSourceDim','LabTestSpecimenSourceDim','LabTestSpecimenSourceDim','SELECT DISTINCT
SPCMN_SRC_CDS, SPCMN_SRC_DESC 
FROM CUBESPRD.LAB_TST_DIM
WHERE SPCMN_SRC_CDS IS NOT NULL')
,(104,'LabTestSpecimenTypeDim','LabTestSpecimenTypeDim','LabTestSpecimenTypeDim','SELECT DISTINCT
SPCMN_TYPE_CDS, SPCMN_TYPE_DESC
FROM CUBESPRD.LAB_TST_DIM
WHERE SPCMN_TYPE_CDS IS NOT NULL AND SPCMN_TYPE_DESC <> ''NOT_ENTERED''')
,(105,'LabTestVerificationStatusDim','LabTestVerificationStatusDim','LabTestVerificationStatusDim','SELECT DISTINCT VRFCTN_STS_CDS, VRFCTN_STS_DESC
FROM CUBESPRD.LAB_TST_DIM
WHERE  VRFCTN_STS_CDS IS NOT NULL')
,(109,'qps_Dim_Measure','MeasureDim','MeasureDim','SELECT     Measure_Dim_ID, Source_ID, Source_Measure_ID, Measure, Is_Active
FROM        qps.Dim_Measure')
,(110,'qps_Dim_Measure_Group','MeasureGroupDim','MeasureGroupDim','SELECT     Measure_Group_Dim_ID, Measure_Group_ID, Glossary_Link
FROM        qps.Dim_Measure_Group')
,(113,'MeasureMDFact','MeasureMDFact','MeasureMDFact','SELECT     Data_ID, Source_Source_Measure_ID AS Measure_Dim_ID, YEAR([Date]) * 100 + MONTH([Date]) AS Meaure_Month, Result, SRC_DEPT_ID
FROM        qps.DM_Quality_Fact
WHERE     (SRC_DEPT_ID IS NOT NULL) AND (Frequency = N''Monthly'')')
,(114,'MeasureMLFact','MeasureMLFact','MeasureMLFact','SELECT     Data_ID, Source_Source_Measure_ID AS Measure_Dim_ID, YEAR([Date]) * 100 + MONTH([Date]) AS Meaure_Month, Result, LO_CDS
FROM        qps.DM_Quality_Fact
WHERE     (LO_CDS IS NOT NULL) AND (Frequency = N''Monthly'')')
,(116,'MeasureQDFact','MeasureQDFact','MeasureQDFact','SELECT     Data_ID, Source_Source_Measure_ID AS Measure_Dim_ID, YEAR([Date]) * 10 + DATEPART(Quarter, [Date]) AS Meaure_Quarter, Result, SRC_DEPT_ID
FROM        qps.DM_Quality_Fact
WHERE     (SRC_DEPT_ID IS NOT NULL) AND (Frequency = N''Quarterly'')')
,(115,'MeasureQLFact','MeasureQLFact','MeasureQLFact','SELECT     Data_ID, Source_Source_Measure_ID AS Measure_Dim_ID, YEAR([Date]) * 10 + DATEPART(Quarter, [Date]) AS Meaure_Quarter, Result, LO_CDS
FROM        qps.DM_Quality_Fact
WHERE     (LO_CDS IS NOT NULL) AND (Frequency = N''Quarterly'')')
,(111,'QualityMeasureSourceDim','MeasureSourceDim','MeasureSourceDim','SELECT     Source_ID, Source_Name
FROM        qps.Dim_Source')
,(80,'MedicationAdministrationActionDim','MedicationAdministrationActionDim','MedicationAdministrationActionDim','SELECT DISTINCT 
        ADMN_ACTN_CDS_SK
       , ADMN_ACTN_DESC
  FROM CUBESPRD.MDCTN_ADMN_FACT')
,(79,'MedicationAdministrationFact','MedicationAdministrationFact','MedicationAdministrationFact','SELECT MDCTN_ADMN_FACT_SK
       , ma.MDCTN_ORDR_SK 
       , PTNT_SK
       , ENCNT_SK
       , ADMN_DEPT_SK
       , ADMN_USR_SK
       , PRMY_CMPNT_SK
       , SCND_CMPNT_SK
       , THRD_CMPNT_SK
       , FOURTH_CMPNT_SK
       , FIFTH_CMPNT_SK
       , ADMN_ACTN_CDS_SK
       , SCHED_ADMN_DT
       , SCHED_ADMN_TS_SK
       , ADMN_DT
       , ADMN_TS_SK
       , CRG_AMT
       , RPRST_COST
       , ACQSTN_COST
       , MDCTN_REQ_SCAN_AT_ADMN_IND
       , MDCTN_SCANNED_AT_ADMN_IND
       , PTNT_REQ_SCAN_AT_ADMN_IND
       , PTNT_SCANNED_AT_ADMN_IND
 FROM EDW_PRD.CUBESPRD.MDCTN_ADMN_FACT ma INNER JOIN CUBESPRD.MDCTN_ORDR_DIM mo ON ma.MDCTN_ORDR_SK=mo.MDCTN_ORDR_SK')
,(59,'MedicationAdministrationRouteDim','MedicationAdministrationRouteDim','MedicationAdministrationRouteDim','SELECT DISTINCT ADMN_RT_CDS
       , ADMN_RT_DESC
FROM CUBESPRD.MDCTN_DIM WHERE ADMN_RT_CDS IS NOT NULL')
,(60,'MedicationDEAClassDim','MedicationDEAClassDim','MedicationDEAClassDim','SELECT DISTINCT DEA_CLASS_CDS
      , DEA_CLASS_DESC
FROM  CUBESPRD.MDCTN_DIM WHERE DEA_CLASS_CDS IS NOT NULL')
,(54,'MedicationDim','MedicationDim','MedicationDim','SELECT MDCTN_SK
       , SRC_MDCTN_ID
       , MDCTN_NM
       , GNRC_NM
       , THRPC_CLASS_CDS
       , PHARM_CLASS_CDS
       , PHARM_SUBCLS_CDS
       , MDCTN_FORM_CDS
       , ADMN_RT_CDS
       , MDCTN_STRG
       , GPI_NUM
       , DEA_CLASS_CDS
       , CASE WHEN CNTLD_SUBSTN_IND = 0 OR CNTLD_SUBSTN_IND IS NULL THEN ''NO'' 
	      WHEN CNTLD_SUBSTN_IND = 1 THEN ''YES'' 
	      END AS CNTLD_SUBSTN_IND
  FROM CUBESPRD.MDCTN_DIM')
,(61,'MedicationFormDim','MedicationFormDim','MedicationFormDim','SELECT DISTINCT MDCTN_FORM_CDS
       , MDCTN_FORM_DESC
FROM CUBESPRD.MDCTN_DIM WHERE MDCTN_FORM_CDS IS NOT NULL')
,(68,'MedicationOrderCalculatedDoseUnitDim','MedicationOrderCalculatedDoseUnitDim','MedicationOrderCalculatedDoseUnitDim','SELECT DISTINCT 
  CLCLTD_DOSE_UNT_CDS, 
  CLCLTD_DOSE_UNT_DESC
  FROM CUBESPRD.MDCTN_ORDR_DIM WHERE CLCLTD_DOSE_UNT_CDS IS NOT NULL')
,(69,'MedicationOrderClassDim','MedicationOrderClassDim','MedicationOrderClassDim','SELECT DISTINCT ORDR_CLASS_CDS
,ORDR_CLASS_DESC
FROM CUBESPRD.MDCTN_ORDR_DIM WHERE ORDR_CLASS_CDS IS NOT NULL')
,(65,'MedicationOrderDim','MedicationOrderDim','MedicationOrderDim','SELECT   MD.MDCTN_ORDR_SK
	, SRC_ORDR_ID
	, PTNT_INSTR
       , FREQ_DESC
       , RT_CDS
       , QTY_UNT_CDS
       , DOSE_UNT_CDS
       , CLCLTD_DOSE_UNT_CDS
       , ORDR_SRC_CDS
       , ORDR_CLASS_CDS
       , ORDR_MODE_CDS
       , ORDR_PRTY_CDS
       , ORDR_SET_SRC_CDS
       , PRN_RSN_1
       , INDC_FOR_USE_1
	, CASE WHEN CPOE_IND = 0 THEN ''No'' WHEN CPOE_IND = 1 THEN ''Yes'' ELSE NULL END AS CPOE_IND
	, CASE WHEN DSPNS_AS_WRTN_IND = 0 THEN ''No'' WHEN DSPNS_AS_WRTN_IND = 1 THEN ''Yes'' ELSE NULL END AS DSPNS_AS_WRTN_IND
	, CASE WHEN ORDRD_AS_NONFORM_IND = 0 THEN ''No'' WHEN ORDRD_AS_NONFORM_IND = 1 THEN ''Yes'' ELSE NULL END AS ORDRD_AS_NONFORM_IND
	, CASE WHEN VRFD_AS_NONFORM_IND = 0 THEN ''No'' WHEN VRFD_AS_NONFORM_IND = 1 THEN ''Yes'' ELSE NULL END AS VRFD_AS_NONFORM_IND
	, CASE WHEN AUTOMAT_VRFD_IND = 0 THEN ''No'' WHEN AUTOMAT_VRFD_IND = 1 THEN ''Yes'' ELSE NULL END AS AUTOMAT_VRFD_IND
	, CASE WHEN VRBL_IND = 0 THEN ''No'' WHEN VRBL_IND = 1 THEN ''Yes'' ELSE NULL END AS VRBL_IND
	, CASE WHEN REQR_COSIG_IND = 0 THEN ''No'' WHEN REQR_COSIG_IND = 1 THEN ''Yes'' ELSE NULL END AS REQR_COSIG_IND
	, CASE WHEN COSIG_IND = 0 THEN ''No'' WHEN COSIG_IND = 1 THEN ''Yes'' ELSE NULL END AS COSIG_IND
	, CASE WHEN VRBL_SGN_IND = 0 THEN ''No'' WHEN VRBL_SGN_IND = 1 THEN ''Yes'' ELSE NULL END AS VRBL_SGN_IND
  FROM CUBESPRD.MDCTN_ORDR_DIM MD
  INNER JOIN CUBESPRD.MDCTN_ORDR_FACT MF ON MD.MDCTN_ORDR_SK = MF.MDCTN_ORDR_SK
  INNER JOIN CUBESPRD.ENCNT_DIM ED ON MF.ENCNT_SK = ED.ENCNT_SK')
,(67,'MedicationOrderDoseUnitDim','MedicationOrderDoseUnitDim','MedicationOrderDoseUnitDim','SELECT DISTINCT DOSE_UNT_CDS,
CASE WHEN DOSE_UNT_CDS=10004 THEN ''CARTRIDGE'' ELSE DOSE_UNT_DESC END AS DOSE_UNT_DESC
FROM CUBESPRD.MDCTN_ORDR_DIM WHERE DOSE_UNT_CDS IS NOT NULL')
,(76,'MedicationOrderFact','MedicationOrderFact','MedicationOrderFact','SELECT 	 MDCTN_ORDR_FACT_SK
       , CASE WHEN MDCTN_ORDR_SK < 0 THEN NULL ELSE MDCTN_ORDR_SK END AS MDCTN_ORDR_SK
       , PTNT_SK
       , ENCNT_SK
       , DEPT_SK
       , PHRM_SK
       , MDCTN_SK
       , ORDRD_BY_USR_SK
       , ORDRD_BY_PROVDR_SK
       , AUTH_BY_PROVDR_SK
       , ORDRD_DT
       , ORDRD_TS_SK
       , ORDR_STRT_DT
       , ORDR_STRT_TS_SK
       , ORDR_END_DT
       , ORDR_END_TS_SK
       , ORDR_DSCNTND_DT
       , DSCNTND_TS_SK
       , QTY
       , MIN_DOSE
       , MAXM_DOSE
       , CLCLTD_MIN_DOSE
       , CLCLTD_MAXM_DOSE
       , NBR_OF_DOSES
       , NBR_WRTN_REFILLS
  FROM CUBESPRD.MDCTN_ORDR_FACT')
,(70,'MedicationOrderFrequencyDim','MedicationOrderFrequencyDim','MedicationOrderFrequencyDim','SELECT DISTINCT FREQ_CDS
       , FREQ_DESC
FROM CUBESPRD.MDCTN_ORDR_DIM WHERE FREQ_CDS IS NOT NULL')
,(66,'MedicationOrderModeDim','MedicationOrderModeDim','MedicationOrderModeDim','SELECT DISTINCT ORDR_MODE_CDS
       , ORDR_MODE_DESC
FROM CUBESPRD.MDCTN_ORDR_DIM WHERE ORDR_MODE_CDS IS NOT NULL')
,(71,'MedicationOrderPriorityDim','MedicationOrderPriorityDim','MedicationOrderPriorityDim','SELECT DISTINCT ORDR_PRTY_CDS
       , ORDR_PRTY_DESC
FROM CUBESPRD.MDCTN_ORDR_DIM WHERE ORDR_PRTY_CDS IS NOT NULL')
,(72,'MedicationOrderQuantityUnitDim','MedicationOrderQuantityUnitDim','MedicationOrderQuantityUnitDim','SELECT DISTINCT QTY_UNT_CDS,
CASE WHEN QTY_UNT_CDS=10004 THEN ''CARTRIDGE'' ELSE QTY_UNT_DESC END AS QTY_UNT_DESC
FROM CUBESPRD.MDCTN_ORDR_DIM WHERE QTY_UNT_CDS IS NOT NULL')
,(73,'MedicationOrderRouteDim','MedicationOrderRouteDim','MedicationOrderRouteDim','SELECT DISTINCT RT_CDS
       , RT_DESC
FROM CUBESPRD.MDCTN_ORDR_DIM WHERE RT_CDS IS NOT NULL')
,(74,'MedicationOrderSetSourceDim','MedicationOrderSetSourceDim','MedicationOrderSetSourceDim','SELECT DISTINCT ORDR_SET_SRC_CDS, 
CASE 
WHEN ORDR_SET_SRC_NM=''IP-SUR:ORTHO: TOTAL HIP REPLACEMENT: POSTOP (PHASE OF CARE)'' THEN ''IP-SUR:ORTHO: TOTAL HIP REPLACEMENT (PHASES OF CARE)'' 
WHEN ORDR_SET_SRC_NM=''IP-ID:GI FECAL MICROBIOTA TRANSPLANTATION (COLONOSCOPY)'' THEN ''IP-ID:GI FECAL MICROBIOTA TRANSPLANTATION'' 
WHEN ORDR_SET_SRC_NM=''IP-CAR:PRO:ABLATION FOR ATRIAL FIBRILLATION  (CRMH ONLY)'' THEN ''IP-CAR:PRO:ABLATION  (CRMH ONLY)'' 
WHEN ORDR_SET_SRC_NM=''IP-SUR:ORTHO: TOTAL KNEE: PREOP (PHASE OF CARE)'' THEN ''IP-SUR:ORTHO: TOTAL KNEE''
WHEN ORDR_SET_SRC_NM=''IP-PED: PARENTERAL NUTRITION (PN) AND METABOLIC MONITORING''THEN ''IP-PED: PARENTERAL NUTRITION (PPN/TPN) AND METABOLIC MONITORING''
ELSE ORDR_SET_SRC_NM 
END AS ORDR_SET_SRC_NM
FROM CUBESPRD.MDCTN_ORDR_DIM
WHERE ORDR_SET_SRC_CDS 
IS NOT NULL')
,(75,'MedicationOrderSourceDim','MedicationOrderSourceDim','MedicationOrderSourceDim','SELECT DISTINCT ORDR_SRC_CDS
       , ORDR_SRC_DESC
FROM CUBESPRD.MDCTN_ORDR_DIM WHERE ORDR_SRC_CDS IS NOT NULL')
,(62,'MedicationPharmacologicalClassDim','MedicationPharmacologicalClassDim','MedicationPharmacologicalClassDim','SELECT DISTINCT PHARM_CLASS_CDS
       , CASE WHEN PHARM_CLASS_CDS=256 THEN ''MIOTICS AND OTHER INTRAOCULAR PRESSURE REDUCERS'' ELSE PHARM_CLASS_DESC END AS PHARM_CLASS_DESC
FROM CUBESPRD.MDCTN_DIM WHERE PHARM_CLASS_CDS IS NOT NULL')
,(64,'MedicationPharmacologicalSubclassDim','MedicationPharmacologicalSubclassDim','MedicationPharmacologicalSubclassDim','SELECT DISTINCT PHARM_SUBCLS_CDS
       , CASE WHEN PHARM_SUBCLS_DESC=''ANTINEOPLASTIC - ANTIBODY-DRUG CONJUGATES (ADCS)'' THEN ''ANTINEOPLASTIC - ANTIBODY-DRUG COMPLEXES'' ELSE PHARM_SUBCLS_DESC END AS PHARM_SUBCLS_DESC
 FROM CUBESPRD.MDCTN_DIM WHERE PHARM_SUBCLS_CDS IS NOT NULL')
,(63,'MedicationTherapeuticClassDim','MedicationTherapeuticClassDim','MedicationTherapeuticClassDim','SELECT DISTINCT THRPC_CLASS_CDS,
THRPC_CLASS_DESC
FROM CUBESPRD.MDCTN_DIM WHERE THRPC_CLASS_CDS IS NOT NULL')
,(22,'OutpatientAdmitConfirmationStatusDim','OutpatientAdmitConfStatrusDim','OutpatientAdmitConfStatrusDim','SELECT DISTINCT ADMT_CNF_STT_CDS
       , ADMT_CNF_STT_NM
FROM CUBESPRD.OUTPTNT_DIM WHERE ADMT_CNF_STT_CDS IS NOT NULL')
,(23,'OutpatientAppointmentConfirmation','OutpatientAppointmentConfirmationStatusDim','OutpatientAppointmentConfirmationStatusDim','SELECT DISTINCT APPT_CNF_STT_CDS
       , APPT_CNF_STT_NM
FROM CUBESPRD.OUTPTNT_DIM WHERE APPT_CNF_STT_CDS IS NOT NULL')
,(20,'OutpatientAppointmentStatusDim','OutpatientAppointmentStatusDim','OutpatientAppointmentStatusDim','SELECT DISTINCT APPT_STTS_CDS
       , APPT_STTS_NM
FROM CUBESPRD.OUTPTNT_DIM WHERE APPT_STTS_CDS IS NOT NULL')
,(24,'OutpatientCancellationReasonDim','OutpatientCancellationReasonDim','OutpatientCancellationReasonDim','SELECT DISTINCT CNCL_RSN_CDS
       , CNCL_RSN_NM
FROM CUBESPRD.OUTPTNT_DIM WHERE CNCL_RSN_CDS IS NOT NULL')
,(18,'OutpatientDim','OutpatientDim','OutpatientDim','SELECT OUTPTNT_VST_SK
       , ENCNT_SK
       , SRC_TYPE
       , APPT_STTS_CDS
       , APPT_STTS_NM
       , VST_FNNCL_CLSS_CDS
       , ADMT_CNF_STT_CDS
       , APPT_CNF_STT_CDS
       , CNCL_RSN_CDS
       , AGE_YRS_AT_ENCNT
       , AGE_MNTHS_AT_ENCNT
       , 
CASE 
WHEN AGE_DYS_AT_ENCNT < 0 THEN NULL ELSE AGE_DYS_AT_ENCNT 
END AS AGE_DYS_AT_ENCNT
       , 
CASE 
WHEN MDCTN_RVWD_IND= 0 THEN ''No'' WHEN MDCTN_RVWD_IND= 1 THEN ''Yes'' END AS MDCTN_RVWD_IND
       , 
CASE 
WHEN PRBLM_LST_RVWD= 0 THEN ''No'' WHEN PRBLM_LST_RVWD= 1 THEN ''Yes'' END AS PRBLM_LST_RVWD
       , 
CASE 
WHEN AVS_PRNTD_IND= 0 THEN ''No'' WHEN AVS_PRNTD_IND= 1 THEN ''Yes'' END AS AVS_PRNTD_IND
       , 
CASE 
WHEN ALLRG_RVWD_IND= 0 THEN ''No'' WHEN ALLRG_RVWD_IND= 1 THEN ''Yes'' END AS ALLRG_RVWD_IND
       , 
CASE 
WHEN CLSD_IND= 0 THEN ''No'' WHEN CLSD_IND= 1 THEN ''Yes'' END AS CLSD_IND
       , 
CASE 
WHEN APPT_CMPLT_IND= 0 THEN ''No'' WHEN APPT_CMPLT_IND= 1 THEN ''Yes'' END AS APPT_CMPLT_IND
       , 
CASE 
WHEN WLKN_IND= 0 THEN ''No'' WHEN WLKN_IND= 1 THEN ''Yes'' END AS WLKN_IND
       , 
CASE 
WHEN RFRRL_RQRD_IND= 0 THEN ''No'' WHEN RFRRL_RQRD_IND= 1 THEN ''Yes'' END AS RFRRL_RQRD_IND
, AS_ANALYSIS_C185_CDS
       , AS_ANALYSIS_C185
       , AS_ANALYSIS_C186_CDS
       , AS_ANALYSIS_C186
       , AS_ANALYSIS_C3_CDS
       , AS_ANALYSIS_C3
       , AS_ANALYSIS_D2_CDS
       , AS_ANALYSIS_D2
       , AS_ANALYSIS_D3_CDS
       , AS_ANALYSIS_D3
       , AS_ANALYSIS_D98_CDS
       , AS_ANALYSIS_D98
       , AS_ANALYSIS_D99_CDS
       , AS_ANALYSIS_D99
       , AS_ANALYSIS_Q11822_1_CDS
       , AS_ANALYSIS_Q11822_1
       , AS_CAHPS_OSC_1
       , AS_CAHPS_OSC_1_CDS
       , AS_CAHPS_OSC_10
       , AS_CAHPS_OSC_10_CDS
       , AS_CAHPS_OSC_11CL
       , AS_CAHPS_OSC_11CL_CDS
       , AS_CAHPS_OSC_12CL
       , AS_CAHPS_OSC_12CL_CDS
       , AS_CAHPS_OSC_13
       , AS_CAHPS_OSC_13_CDS
       , AS_CAHPS_OSC_14
       , AS_CAHPS_OSC_14_CDS
       , AS_CAHPS_OSC_15
       , AS_CAHPS_OSC_15_CDS
       , AS_CAHPS_OSC_16
       , AS_CAHPS_OSC_16_CDS
       , AS_CAHPS_OSC_17
       , AS_CAHPS_OSC_17_CDS
       , AS_CAHPS_OSC_18
       , AS_CAHPS_OSC_18_CDS
       , AS_CAHPS_OSC_19
       , AS_CAHPS_OSC_19_CDS
       , AS_CAHPS_OSC_2
       , AS_CAHPS_OSC_2_CDS
       , AS_CAHPS_OSC_20
       , AS_CAHPS_OSC_20_CDS
       , AS_CAHPS_OSC_21
       , AS_CAHPS_OSC_21_CDS
       , AS_CAHPS_OSC_22
       , AS_CAHPS_OSC_22_CDS
       , AS_CAHPS_OSC_23
       , AS_CAHPS_OSC_23_CDS
       , AS_CAHPS_OSC_24
       , AS_CAHPS_OSC_24_CDS
       , AS_CAHPS_OSC_3
       , AS_CAHPS_OSC_3_CDS
       , AS_CAHPS_OSC_4
       , AS_CAHPS_OSC_4_CDS
       , AS_CAHPS_OSC_5
       , AS_CAHPS_OSC_5_CDS
       , AS_CAHPS_OSC_6
       , AS_CAHPS_OSC_6_CDS
       , AS_CAHPS_OSC_7
       , AS_CAHPS_OSC_7_CDS
       , AS_CAHPS_OSC_8
       , AS_CAHPS_OSC_8_CDS
       , AS_CAHPS_OSC_9
       , AS_CAHPS_OSC_9_CDS
       , PG_OU_SURVEY_ID
       , OU_ANALYSIS_A4_CDS
       , OU_ANALYSIS_A4
       , OU_ANALYSIS_A48_CDS
       , OU_ANALYSIS_A48
       , OU_ANALYSIS_A6_CDS
       , OU_ANALYSIS_A6
       , OU_ANALYSIS_A7_CDS
       , OU_ANALYSIS_A7
       , OU_ANALYSIS_C121_CDS
       , OU_ANALYSIS_C121
       , OU_ANALYSIS_C2_CDS
       , OU_ANALYSIS_C2
       , OU_ANALYSIS_C6_CDS
       , OU_ANALYSIS_C6
       , OU_ANALYSIS_C7_CDS
       , OU_ANALYSIS_C7
       , OU_ANALYSIS_C8_CDS
       , OU_ANALYSIS_C8
       , OU_ANALYSIS_D2_CDS
       , OU_ANALYSIS_D2
       , OU_ANALYSIS_D3_CDS
       , OU_ANALYSIS_D3
       , OU_ANALYSIS_E1_CDS
       , OU_ANALYSIS_E1
       , OU_ANALYSIS_E101_CDS
       , OU_ANALYSIS_E101
       , OU_ANALYSIS_E102_CDS
       , OU_ANALYSIS_E102
       , OU_ANALYSIS_E14_CDS
       , OU_ANALYSIS_E14
       , OU_ANALYSIS_E38_CDS
       , OU_ANALYSIS_E38
       , OU_ANALYSIS_E4_CDS
       , OU_ANALYSIS_E4
       , OU_ANALYSIS_Q11822_1_CDS
       , OU_ANALYSIS_Q11822_1
       , OU_DEMOGRAPHICS_DAYWEEK_CDS
       , OU_DEMOGRAPHICS_DAYWEEK
       , PG_UC_SURVEY_ID
       , UC_ANALYSIS_A2_CDS
       , UC_ANALYSIS_A2
       , UC_ANALYSIS_A28_CDS
       , UC_ANALYSIS_A28
       , UC_ANALYSIS_A3_CDS
       , UC_ANALYSIS_A3
       , UC_ANALYSIS_A4_CDS
       , UC_ANALYSIS_A4
       , UC_ANALYSIS_A5_CDS
       , UC_ANALYSIS_A5
       , UC_ANALYSIS_B1_CDS
       , UC_ANALYSIS_B1
       , UC_ANALYSIS_B3_CDS
       , UC_ANALYSIS_B3
       , UC_ANALYSIS_B4_CDS
       , UC_ANALYSIS_B4
       , UC_ANALYSIS_B5_CDS
       , UC_ANALYSIS_B5
       , UC_ANALYSIS_B61_CDS
       , UC_ANALYSIS_B61
       , UC_ANALYSIS_C1_CDS
       , UC_ANALYSIS_C1
       , UC_ANALYSIS_C2_CDS
       , UC_ANALYSIS_C2
       , UC_ANALYSIS_C34_CDS
       , UC_ANALYSIS_C34
       , UC_ANALYSIS_C4_CDS
       , UC_ANALYSIS_C4
       , UC_ANALYSIS_C5_CDS
       , UC_ANALYSIS_C5
       , UC_ANALYSIS_C60_CDS
       , UC_ANALYSIS_C60
       , UC_ANALYSIS_C7_CDS
       , UC_ANALYSIS_C7
       , UC_ANALYSIS_D2_CDS
       , UC_ANALYSIS_D2
       , UC_ANALYSIS_D3_CDS
       , UC_ANALYSIS_D3
       , UC_ANALYSIS_D4_CDS
       , UC_ANALYSIS_D4
       , UC_ANALYSIS_D58_CDS
       , UC_ANALYSIS_D58
       , UC_ANALYSIS_D59_CDS
       , UC_ANALYSIS_D59
       , UC_ANALYSIS_E1_CDS
       , UC_ANALYSIS_E1
       , UC_ANALYSIS_E2_CDS
       , UC_ANALYSIS_E2
       , UC_ANALYSIS_E3_CDS
       , UC_ANALYSIS_E3
       , UC_ANALYSIS_F1_CDS
       , UC_ANALYSIS_F1
       , UC_ANALYSIS_F120_CDS
       , UC_ANALYSIS_F120
       , UC_ANALYSIS_F2_CDS
       , UC_ANALYSIS_F2
       , UC_ANALYSIS_F4_CDS
       , UC_ANALYSIS_F4
       , UC_ANALYSIS_F41_CDS
       , UC_ANALYSIS_F41
       , UC_ANALYSIS_Q11822_1_CDS
       , UC_ANALYSIS_Q11822_1
       , UC_DEMOGRAPHICS_DAYWEEK_CDS
       , UC_DEMOGRAPHICS_DAYWEEK
       , PG_MD_SURVEY_ID
       , MD_ANALYSIS_A1_CDS
       , MD_ANALYSIS_A1
       , MD_ANALYSIS_A14_CDS
       , MD_ANALYSIS_A14
       , MD_ANALYSIS_CP1_CDS
       , MD_ANALYSIS_CP1
       , MD_ANALYSIS_CP10_CDS
       , MD_ANALYSIS_CP10
       , MD_ANALYSIS_CP2_CDS
       , MD_ANALYSIS_CP2
       , MD_ANALYSIS_CP3_CDS
       , MD_ANALYSIS_CP3
       , MD_ANALYSIS_CP4_CDS
       , MD_ANALYSIS_CP4
       , MD_ANALYSIS_CP5_CDS
       , MD_ANALYSIS_CP5
       , MD_ANALYSIS_CP6_CDS
       , MD_ANALYSIS_CP6
       , MD_ANALYSIS_CP7_CDS
       , MD_ANALYSIS_CP7
       , MD_ANALYSIS_CP8_CDS
       , MD_ANALYSIS_CP8
       , MD_ANALYSIS_CP9_CDS
       , MD_ANALYSIS_CP9
       , MD_ANALYSIS_I1_CDS
       , MD_ANALYSIS_I1
       , MD_ANALYSIS_I2_CDS
       , MD_ANALYSIS_I2
       , MD_ANALYSIS_I3_CDS
       , MD_ANALYSIS_I3
       , MD_ANALYSIS_I60_CDS
       , MD_ANALYSIS_I60
       , MD_ANALYSIS_N1_CDS
       , MD_ANALYSIS_N1
       , MD_ANALYSIS_N2_CDS
       , MD_ANALYSIS_N2
       , MD_ANALYSIS_O15_CDS
       , MD_ANALYSIS_O15
       , MD_ANALYSIS_O2_CDS
       , MD_ANALYSIS_O2
       , MD_ANALYSIS_O4_CDS
       , MD_ANALYSIS_O4
       , MD_ANALYSIS_Q11822_1_CDS
       , MD_ANALYSIS_Q11822_1
       , MD_ANALYSIS_V2_CDS
       , MD_ANALYSIS_V2
       , MD_ANALYSIS_V60_CDS
       , MD_ANALYSIS_V60
       , MD_ANALYSIS_V7_CDS
       , MD_ANALYSIS_V7
       , MD_CAHPS_ACO_01C
       , MD_CAHPS_ACO_01C_CDS
       , MD_CAHPS_ACO_02C
       , MD_CAHPS_ACO_02C_CDS
       , MD_CAHPS_ACO_03C
       , MD_CAHPS_ACO_03C_CDS
       , MD_CAHPS_ACO_04C
       , MD_CAHPS_ACO_04C_CDS
       , MD_CAHPS_ACO_05C
       , MD_CAHPS_ACO_05C_CDS
       , MD_CAHPS_ACO_06C
       , MD_CAHPS_ACO_06C_CDS
       , MD_CAHPS_ACO_07C
       , MD_CAHPS_ACO_07C_CDS
       , MD_CAHPS_ACO_08C
       , MD_CAHPS_ACO_08C_CDS
       , MD_CAHPS_ACO_09C
       , MD_CAHPS_ACO_09C_CDS
       , MD_CAHPS_ACO_12C
       , MD_CAHPS_ACO_12C_CDS
       , MD_CAHPS_ACO_13C
       , MD_CAHPS_ACO_13C_CDS
       , MD_CAHPS_ACO_14C
       , MD_CAHPS_ACO_14C_CDS
       , MD_CAHPS_ACO_38C
       , MD_CAHPS_ACO_38C_CDS
       , MD_CAHPS_ACO_39C
       , MD_CAHPS_ACO_39C_CDS
       , MD_CAHPS_CG_1
       , MD_CAHPS_CG_1_CDS
       , MD_CAHPS_CG_2CL
       , MD_CAHPS_CG_2CL_CDS
       , MD_CAHPS_CG_18CL
       , MD_CAHPS_CG_18CL_CDS
       , MD_CAHPS_CG_19CL
       , MD_CAHPS_CG_19CL_CDS
       , MD_CAHPS_CG_20CL
       , MD_CAHPS_CG_20CL_CDS
       , MD_CAHPS_CG_21CL
       , MD_CAHPS_CG_21CL_CDS
       , MD_CAHPS_CG_22CL
       , MD_CAHPS_CG_22CL_CDS
       , MD_CAHPS_CG_23CL
       , MD_CAHPS_CG_23CL_CDS
       , MD_CAHPS_CG_24CL
       , MD_CAHPS_CG_24CL_CDS
       , MD_CAHPS_CG_25CL
       , MD_CAHPS_CG_25CL_CDS
       , MD_CAHPS_CG_26CL
       , MD_CAHPS_CG_26CL_CDS
       , MD_CAHPS_CG_27CL
       , MD_CAHPS_CG_27CL_CDS
       , MD_CAHPS_CG_28CL
       , MD_CAHPS_CG_28CL_CDS
       , MD_CAHPS_CG_29CL
       , MD_CAHPS_CG_29CL_CDS
       , MD_CAHPS_CG_34CL
       , MD_CAHPS_CG_34CL_CDS
       , MD_CAHPS_CG_35CL
       , MD_CAHPS_CG_35CL_CDS
       , MD_CAHPS_CG_36ACL
       , MD_CAHPS_CG_36ACL_CDS
       , MD_CAHPS_CG_36BCL
       , MD_CAHPS_CG_36BCL_CDS
       , MD_CAHPS_CG_36CCL
       , MD_CAHPS_CG_36CCL_CDS
       , MD_CAHPS_CG_36DCL
       , MD_CAHPS_CG_36DCL_CDS
       , MD_CAHPS_CG_36ECL
       , MD_CAHPS_CG_36ECL_CDS
       , MD_CAHPS_CG_36FCL
       , MD_CAHPS_CG_36FCL_CDS
       , MD_CAHPS_CG_37CL
       , MD_CAHPS_CG_37CL_CDS
       , MD_CAHPS_CG_38A
       , MD_CAHPS_CG_38A_CDS
       , MD_CAHPS_CG_38B
       , MD_CAHPS_CG_38B_CDS
       , MD_CAHPS_CG_38C
       , MD_CAHPS_CG_38C_CDS
       , MD_CAHPS_CG_38D
       , MD_CAHPS_CG_38D_CDS
       , MD_CAHPS_CG_38E
       , MD_CAHPS_CG_38E_CDS
       , MD_CAHPS_CG_57CL
       , MD_CAHPS_CG_57CL_CDS
       , SURVEY_TYPE
       , COMBINED_COMFORT_CDS
       , COMBINED_COMFORT
       , COMBINED_RATING_CDS
       , COMBINED_RATING
       , COMBINED_TEAMWORK_CDS
       , COMBINED_TEAMWORK
       , COMBINED_PRIVACY_CDS
       , COMBINED_PRIVACY
       , COMBINED_SENSITVITY_CDS
       , COMBINED_SENSITVITY
  FROM EDW_PRD.CUBESPRD.OUTPTNT_DIM')
,(19,'OutpatientFact','OutpatientFact','OutpatientFact','SELECT ENCNT_SK
       , PTNT_SK
       , APPT_TS_SK
       , APPT_DT
       , APPT_LNGTH
       , CASE WHEN APPT_LNGTH=0 THEN 0 WHEN APPT_LNGTH<0 THEN NULL ELSE LOG(APPT_LNGTH) END AS APPT_LNGTH_LOG
       , APPT_CRTN_INSTNT_TS_SK
       , APPT_CRTN_INSTNT_DT
       , CHCK_IN_INSTNT_TS_SK
       , CHCK_IN_INSTNT_DT
       , CHCK_OUT_INSTNT_TS_SK
       , CHCK_OUT_INSTNT_DT
       , ARRVL_INSTNT_TS_SK
       , ARRVL_INSTNT_DT
       , SCNDS_WTNG
       , CASE WHEN SCNDS_WTNG=0 THEN 0 WHEN SCNDS_WTNG<0 THEN NULL ELSE LOG(SCNDS_WTNG) END AS SCNDS_WTNG_LOG
       , DEPT_SK
       , RM_INSTNT_TS_SK
       , RM_INSTNT_DT
       , SCDS_IN_RM
       , CASE WHEN SCDS_IN_RM=0 THEN 0 WHEN SCDS_IN_RM<0 THEN NULL ELSE LOG(SCDS_IN_RM) END AS SCDS_IN_RM_LOG
       , BDY_MSS_IDX
       , BDY_SRFC_AREA
       , SYSTLC
       , DISTLC
       , TMP_IN_FHRNHT
       , PULSE
       , RSPRTNS
       , PRMY_DIAG_SK
       , PRMY_VST_PRVDR_KEY
       , SCND_VST_PRVDR_KEY
       , THRD_VST_PRVDR_KEY
       , FRTH_VST_PRVDR_KEY
       , AGE_YRS_AT_ENCNT
       , CASE WHEN AGE_YRS_AT_ENCNT=0 THEN 0 WHEN AGE_YRS_AT_ENCNT<0 THEN NULL ELSE LOG(AGE_YRS_AT_ENCNT) END AS AGE_YRS_AT_ENCNT_LOG
       , AGE_MNTHS_AT_ENCNT
       , AGE_DYS_AT_ENCNT

  FROM CUBESPRD.OUTPTNT_FACT')
,(21,'OutpatientFinancialClassDim','OutpatientFinancialClassDim','OutpatientFinancialClassDim','SELECT DISTINCT VST_FNNCL_CLSS_CDS
       , VST_FNNCL_CLSS_NM
FROM CUBESPRD.OUTPTNT_DIM')
,(2,'LDW_PTNT_DIM','PatientDim','PatientDim','SELECT PTNT_SK, SRC_PTNT_ID, MPI_NUM 
       , 
CASE 
WHEN BRTH_TS < ''01/01/1900'' THEN NULL ELSE date(BRTH_TS) 
END As BRTH_TS
       , MRTL_STS_CDS
       , MRTL_STS_DESC
       , CITY
       , CNTY_CDS , CNTY_DESC
       , ST_PRV_CDS
       , ST_PRV_NM , CRNT_PCP_PROVDR_SK
       , 
CASE 
WHEN CNTRY_NM=''US'' THEN SUBSTR(PSTL_CDS,1,5)ELSE 
NULL END as PSTL_CDS
       , CNTRY_CDS, CNTRY_NM
       , HME_PH_AREA_CDS
       , HME_PH_EXCHNG_CDS
       , WRK_PH_AREA_CDS
       , WRK_PH_EXCHNG_CDS
       , CASE WHEN LIV_STS_CDS < 0 THEN NULL ELSE LIV_STS_CDS END AS LIV_STS_CDS
       , LIV_STS_DESC
       , Date(DTH_TS) As DTH_TS
       , SEX_CDS, SEX_DESC
       , PRMY_LANG_CDS
       , PRMY_LANG_DESC
       , PRMY_RACE_CDS
       , PRMY_RACE_DESC
       , SCND_RACE_CDS
       , SCND_RACE_DESC
       , THRD_RACE_CDS
       , THRD_RACE_DESC
       , FOURTH_RACE_CDS
       , FOURTH_RACE_DESC
       , FIFTH_RACE_CDS
       , FIFTH_RACE_DESC
       ,  
CASE 
WHEN MULTI_RACIAL=0 THEN ''No'' WHEN MULTI_RACIAL=1 THEN ''Yes'' ELSE 
NULL END AS MULTI_RACIAL  ,
ETHNCTY_CDS
       , ETHNCTY_DESC
       , RELG_CDS
       , RELG_DESC
       , SMKE_STS_CDS
       , SMKE_STS_DESC
       , HI_LEVL_OF_EDU_CDS
       , HI_LEVL_OF_EDU_DESC
       , PRMY_PAYOR_CDS
       , PRMY_PAYOR_NM
       , PRMY_FNCL_CLASS_CDS
       , PRMY_FNCL_CLASS_DESC      
       , MTHR_PTNT_BABY_NUM   
       , AGE_IN_YRS As Age, 
CASE 
WHEN (AGE_IN_YRS<0 
OR AGE_IN_YRS> 120) THEN NULL ELSE AGE_IN_YRS 
END AS AGE_FACT, 
CASE 
WHEN AGE_IN_YRS=0 THEN 0 
WHEN (AGE_IN_YRS<0 
OR AGE_IN_YRS> 120) THEN NULL ELSE Log(AGE_IN_YRS)
END As Age_Log, SYS_CRT_TS AS REG_TS, 
CASE 
WHEN BRTH_TS < ''01/01/1900'' OR BRTH_TS > SYS_CRT_TS THEN NULL ELSE DATE_PART(''year'', SYS_CRT_TS) - DATE_PART(''year'', BRTH_TS)
END AS AGE_AT_REG,
CASE 
WHEN AVAIL_IND= 0 THEN ''NO'' WHEN AVAIL_IND= 1 THEN ''YES'' END AS AVAIL_IND
, CASE WHEN CARLN_EMP_HLTH_PLN_IND = 0 THEN ''NO'' WHEN CARLN_EMP_HLTH_PLN_IND= 1 THEN ''YES'' END AS CARLN_EMP_HLTH_PLN_IND, ACTIVE
FROM CUBESPRD.PTNT_DIM')
,(77,'PharmacyDim','PharmacyDim','PharmacyDim','SELECT PHRM_SK
       , SRC_PHRM_ID
       , PHRM_NM
       , SYS_TYPE_DESC
       , CASE WHEN PHY_TYPE_CDS < 0 THEN NULL ELSE PHY_TYPE_CDS END AS PHY_TYPE_CDS
       , NPI_NUM
       , DEA_NUM
       , NCPDP_NUM
       , CASE WHEN FCLT_SPRT_IND = 0 THEN ''No'' WHEN FCLT_SPRT_IND = 1 THEN ''Yes'' ELSE NULL END AS FCLT_SPRT_IND
	, CASE WHEN RX_SUP_IND = 0 THEN ''No'' WHEN RX_SUP_IND = 1 THEN ''Yes'' ELSE NULL END AS RX_SUP_IND
FROM EDW_PRD.CUBESPRD.PHRM_DIM')
,(78,'PharmacyPhysicalTypeDim','PharmacyPhysicalTypeDim','PharmacyPhysicalTypeDim','Select DISTINCT PHY_TYPE_CDS
       , PHY_TYPE_DESC from CUBESPRD.PHRM_DIM WHERE PHY_TYPE_CDS > 0')
,(41,'ProcedureCategoryDim','ProcedureCategoryDim','ProcedureCategoryDim','SELECT DISTINCT
         CASE WHEN PRCDR_CGY_ID < 0 THEN NULL ELSE CAST(PRCDR_CGY_ID AS INT) END AS PRCDR_CGY_ID
       , CASE WHEN PRCDR_CGY_ID=10 THEN ''DIAGNOSTIC IMAGING ORDERABLES'' WHEN PRCDR_CGY_ID=20 THEN ''FLUOROSCOPY ORDERABLES'' ELSE PRCDR_CGY_NM END AS PRCDR_CGY_NM
FROM CUBESPRD.PRCDR_DIM WHERE PRCDR_CGY_ID IS NOT NULL AND PRCDR_CGY_ID != ''NO_MATCH'' AND 
PRCDR_CGY_ID != ''UNKNOWN''')
,(40,'ProcedureDim','ProcedureDim','ProcedureDim','SELECT  PRCDR_CD_SK  
       ,PRCDR_CD_DESCR ||'' - '' ||MSTR_PRCDR_CD AS PRCDR_NM
       , SRC_PRCDR_CD_ID
       , PRCDR_CD
       , CASE WHEN /* CD_TYPE < 0 OR */ CD_TYPE = ''NO_MATCH'' OR 
CD_TYPE = ''UNKNOWN'' THEN NULL ELSE CAST(CD_TYPE AS INT) END AS CD_TYPE,CD_TYPE_NM
       , CASE WHEN /* PRCDR_CGY_ID < 0 OR */ PRCDR_CGY_ID = ''NO_MATCH'' OR 
PRCDR_CGY_ID = ''UNKNOWN'' THEN NULL ELSE CAST(PRCDR_CGY_ID AS INT) END AS PRCDR_CGY_ID
       , REV_CD
  FROM CUBESPRD.PRCDR_DIM')
,(49,'ProcedureOrderClassDim','ProcedureOrderClassDim','ProcedureOrderClassDim','SELECT DISTINCT
  ORDR_CLSS_CD,
  ORDR_CLSS_NM
    FROM CUBESPRD.PRCDR_ORDR_FACT WHERE ORDR_CLSS_CD IS NOT NULL')
,(44,'ProcedureOrderFact','ProcedureOrderFact','ProcedureOrderFact','SELECT   PRCDR_ORDR_FACT_SK
       , ENCNT_SK
       , PTNT_SK
       , PRCDR_CD_SK
       , ORDRD_BY_USR_SK
       , ORDRD_BY_PROVDR_SK
       , AUTH_BY_PROVDR_SK
       , ORDRD_DT
       , ORDRD_TS_SK
       , ORDR_TYP_CD
       , ORDR_CLSS_CD
       , ORDR_MODE_CD
       , ORDR_SRC_CD
       , ORDR_STS_CD
       , ORDR_PRTY_CD
       , STNDNG_STS_CD
       , ORDR_SET_CD
       , CPOE_IND
       , REQR_COSIG_IND
       , COSIG_IND
       , VRBL_SGN_IND
  FROM CUBESPRD.PRCDR_ORDR_FACT')
,(48,'ProcedureOrderModeDim','ProcedureOrderModeDim','ProcedureOrderModeDim','SELECT DISTINCT
  ORDR_MODE_CD,
  ORDR_MODE_NM
    FROM CUBESPRD.PRCDR_ORDR_FACT WHERE ORDR_MODE_CD IS NOT NULL')
,(45,'ProcedureOrderPriorityDim','ProcedureOrderPriorityDim','ProcedureOrderPriorityDim','SELECT DISTINCT
ORDR_PRTY_CD,
ORDR_PRTY_NM
FROM CUBESPRD.PRCDR_ORDR_FACT WHERE ORDR_PRTY_CD IS NOT NULL')
,(52,'ProcedureOrderSetDm','ProcedureOrderSetDm','ProcedureOrderSetDm','SELECT DISTINCT
ORDR_SET_CD,
ORDR_SET_NM
FROM CUBESPRD.PRCDR_ORDR_FACT WHERE ORDR_SET_CD IS NOT NULL')
,(47,'ProcedureOrderSourceDim','ProcedureOrderSourceDim','ProcedureOrderSourceDim','SELECT DISTINCT
  ORDR_SRC_CD,
  ORDR_SRC_NM
    FROM CUBESPRD.PRCDR_ORDR_FACT WHERE ORDR_SRC_CD IS NOT NULL')
,(51,'ProcedureOrderStandingStatusDim','ProcedureOrderStandingStatusDim','ProcedureOrderStandingStatusDim','SELECT DISTINCT
 STNDNG_STS_CD,
STNDNG_STS_NM
FROM CUBESPRD.PRCDR_ORDR_FACT')
,(46,'ProcedureOrderStatusDim','ProcedureOrderStatusDim','ProcedureOrderStatusDim','SELECT DISTINCT
  ORDR_STS_CD,
  ORDR_STS_NM
    FROM CUBESPRD.PRCDR_ORDR_FACT WHERE ORDR_STS_CD IS NOT NULL')
,(50,'ProcedureOrderTypeDim','ProcedureOrderTypeDim','ProcedureOrderTypeDim','SELECT DISTINCT
  ORDR_TYP_CD,
  ORDR_TYP_NM
    FROM CUBESPRD.PRCDR_ORDR_FACT WHERE ORDR_TYP_CD IS NOT NULL')
,(43,'ProcedureRevenueCodeDim','ProcedureRevenueCodeDim','ProcedureRevenueCodeDim','SELECT DISTINCT
           REV_CD
	, REV_CD_NM
FROM CUBESPRD.PRCDR_DIM WHERE REV_CD IS NOT NULL')
,(42,'ProcedureTypeDim','ProcedureTypeDim','ProcedureTypeDim','SELECT DISTINCT CAST (CD_TYPE AS INT) AS CD_TYPE
       	, CD_TYPE_NM
FROM CUBESPRD.PRCDR_DIM WHERE CD_TYPE IS NOT NULL AND CD_TYPE != ''NO_MATCH'' AND 
CD_TYPE != ''UNKNOWN''')
,(112,'qps_Dim_Program','ProgramDim','ProgramDim','SELECT     Program_ID, Program_Name, Start_Date, End_Date, Is_Active
FROM        qps.Dim_Program')
,(106,'ProviderAffiliationDim','ProviderAffiliationDim','ProviderAffiliationDim','SELECT DISTINCT INTN_EXT_CDS, INTN_EXT_DESC 
FROM CUBESPRD.PROVDR_DIM
WHERE INTN_EXT_CDS IS NOT NULL')
,(82,'ProviderClinicianTitleDim','ProviderClinicianTitleDim','ProviderClinicianTitleDim','SELECT DISTINCT 
CLNC_TITL_CDS, CLNC_TITL_DESC
FROM CUBESPRD.PROVDR_DIM
WHERE CLNC_TITL_CDS IS NOT NULL OR CLNC_TITL_CDS NOT IN (150,1790)')
,(81,'ProviderDim','ProviderDim','ProviderDim','SELECT     PROVDR_SK, PROVDR_NM_ID, PROVDR_TYPE_CDS, PRMY_SPCLY_CDS, PRMRY_DEPT_SK, PRMY_DEPT_CDS, NPI, DEA_NUM, UPIN, CLNC_TITL_CDS, MU_FLD_OF_PRACT_CDS, RPTNG_STRC_CDS, INTN_EXT_CDS, LDAP_USR, RSDNT_IND, HSPTLST_IND, 
                  PROVDR_ACTV_IND, Section_CDS, Section_Desc, PROVDR_TYPE_DESC, PRMY_SPCLY_DESC, PRMY_DEPT_NM, CLNC_TITL_DESC, MU_FLD_OF_PRACT_DESC, RPTNG_STRC_DESC, INTN_EXT_DESC
FROM        cubesprd.PROVDR_DIM')
,(83,'ProviderFieldOfPracticeDim','ProviderFieldOfPracticeDim','ProviderFieldOfPracticeDim','SELECT DISTINCT
	MU_FLD_OF_PRACT_CDS,
	MU_FLD_OF_PRACT_DESC
FROM CUBESPRD.PROVDR_DIM
WHERE MU_FLD_OF_PRACT_CDS IS NOT NULL')
,(84,'ProviderInternalExternalDim','ProviderInternalExternalDim','ProviderInternalExternalDim','SELECT DISTINCT 
INTN_EXT_CDS, 
INTN_EXT_DESC 
FROM CUBESPRD.PROVDR_DIM
WHERE INTN_EXT_CDS IS NOT NULL')
,(85,'ProviderPrimaryDepartmentDim','ProviderPrimaryDepartmentDim','ProviderPrimaryDepartmentDim','SELECT DISTINCT 
	PRMY_DEPT_CDS,
	PRMY_DEPT_NM
FROM CUBESPRD.PROVDR_DIM 
WHERE PRMY_DEPT_CDS IS NOT NULL')
,(107,'ProviderPrimarySpecialtyDim','ProviderPrimarySpecialtyDim','ProviderPrimarySpecialtyDim','SELECT DISTINCT 
        PRMY_SPCLY_CDS
       , PRMY_SPCLY_DESC
FROM CUBESPRD.PROVDR_DIM WHERE SUBSTR(PRMY_SPCLY_DESC,1,1) <> ''X''')
,(86,'ProviderReportingStructureDim','ProviderReportingStructureDim','ProviderReportingStructureDim','SELECT DISTINCT 
RPTNG_STRC_CDS, 
RPTNG_STRC_DESC
FROM CUBESPRD.PROVDR_DIM
WHERE RPTNG_STRC_CDS IS NOT NULL')
,(87,'ProviderTypeDim','ProviderTypeDim','ProviderTypeDim','SELECT DISTINCT 
       PROVDR_TYPE_CDS
     , PROVDR_TYPE_DESC
FROM CUBESPRD.PROVDR_DIM 
WHERE PROVDR_TYPE_CDS IS NOT NULL AND PROVDR_TYPE_CDS NOT IN (229,111,166)')
,(117,'SugicalProcedureEventWoundClassDim','SugicalProcedureEventWoundClassDim','SugicalProcedureEventWoundClassDim','SELECT DISTINCT 
WND_CLASS_CDS
       , WND_CLASS_DESC
FROM CUBESPRD.SRGCL_PRCDR_EV_FACT
WHERE WND_CLASS_CDS IS NOT NULL')
,(118,'SurgicalCaseClassDim','SurgicalCaseClassDim','SurgicalCaseClassDim','SELECT DISTINCT
         CL_CDS
       , CL_DESC
  FROM CUBESPRD.SRGCL_CASE_DIM 
WHERE CL_CDS IS NOT NULL')
,(119,'SurgicalCaseDim','SurgicalCaseDim','SurgicalCaseDim','SELECT  D.CASE_SK
       , PRMY_SRVC_CDS
       , PRCDR_LEVL_CDS
       , CL_CDS
       , SRG_PTNT_CLASS_CDS
       , PRMY_ANSTH_TYPE_CDS
       , RSN_NOT_PRFRM_CDS

  FROM CUBESPRD.SRGCL_CASE_DIM D')
,(120,'SurgicalCaseFact','SurgicalCaseFact','SurgicalCaseFact','SELECT SRGCL_CASE_FACT_SK
       , CF.CASE_SK
       , PTNT_SK
       , PRMY_PROVDR_SK
       , ANSTHGIST_PROVDR_SK
       , PRMY_PRCDR_CD_SK
       , DEPT_SK
       , DIAG_CD_SK
       , CASE WHEN CF.HSPTL_ENCNT_SK < 0 THEN NULL ELSE CF.HSPTL_ENCNT_SK END AS HSPTL_ENCNT_SK
       , SRG_ENCNT_SK
       , SRG_DT
       , CASE_RQST_DT
       , CASE_RQST_TM_SK
       , SCHED_SETUP_STRT_DT
       , SCHED_SETUP_STRT_TM_SK
       , SCHED_IN_RM_DT
       , SCHED_IN_RM_TM_SK
       , SCHED_OUT_OF_RM_DT
       , SCHED_OUT_OF_RM_TM_SK
       , SCHED_CLNUP_CMPLT_DT
       , SCHED_CLNUP_CMPLT_TM_SK
       , PTNT_IN_FCLT_DT
       , PTNT_IN_FCLT_TM_SK
       , PTNT_IN_PRE_PRCDR_DT
       , PTNT_IN_PRE_PRCDR_TM_SK
       , RM_SETUP_STRT_DT
       , RM_SETUP_STRT_TM_SK
       , RM_RDY_DT
       , RM_RDY_TM_SK
       , ANSTH_STRT_DT
       , ANSTH_STRT_TM_SK
       , PRE_PRCDR_CMPLT_DT
       , PRE_PRCDR_CMPLT_TM_SK
       , PTNT_IN_RM_DT
       , PTNT_IN_RM_TM_SK
       , ANSTH_RDY_DT
       , ANSTH_RDY_TM_SK
       , PRCDR_STRT_DT
       , PRCDR_STRT_TM_SK
       , PRCDR_CMPLT_DT
       , PRCDR_CMPLT_TM_SK
       , PTNT_OUT_OF_RM_DT
       , PTNT_OUT_OF_RM_TM_SK
       , RM_CLNUP_STRT_DT
       , RM_CLNUP_STRT_TM_SK
       , RM_CLNUP_CMPLT_DT
       , RM_CLNUP_CMPLT_TM_SK
       , PTNT_IN_PACU_DT
       , PTNT_IN_PACU_TM_SK
       , ANSTH_STOP_DT
       , ANSTH_STOP_TM_SK
       , PACU_CARE_CMPLT_DT
       , PACU_CARE_CMPLT_TM_SK
       , PTNT_OUT_OF_PACU_DT
       , PTNT_OUT_OF_PACU_TM_SK
       , PTNT_POST_OP_DT
       , PTNT_POST_OP_TM_SK
       , POST_OP_CARE_CMPLT_DT
       , POST_OP_CARE_CMPLT_TM_SK
       , PTNT_OUT_OF_POST_OP_DT
       , PTNT_OUT_OF_POST_OP_TM_SK
       , CNCL_IND
       , ADD_ON_IND
       , CNFD_IND
  FROM CUBESPRD.SRGCL_CASE_FACT CF INNER JOIN CUBESPRD.SRGCL_CASE_DIM CD ON CF.CASE_SK=CD.CASE_SK INNER JOIN CUBESPRD.ENCNT_DIM ED ON CF.SRG_ENCNT_SK=ED.ENCNT_SK')
,(121,'SurgicalCasePatientClassDim','SurgicalCasePatientClassDim','SurgicalCasePatientClassDim','SELECT DISTINCT
        SRG_PTNT_CLASS_CDS
       , SRG_PTNT_CLASS_DESC
  FROM CUBESPRD.SRGCL_CASE_DIM 
WHERE SRG_PTNT_CLASS_CDS IS NOT NULL')
,(122,'SurgicalCasePrimaryAnesthesiaTypeDim','SurgicalCasePrimaryAnesthesiaTypeDim','SurgicalCasePrimaryAnesthesiaTypeDim','SELECT DISTINCT
         PRMY_ANSTH_TYPE_CDS
       , PRMY_ANSTH_TYPE_DESC
  FROM CUBESPRD.SRGCL_CASE_DIM 
WHERE PRMY_ANSTH_TYPE_CDS IS NOT NULL')
,(123,'SurgicalCasePrimaryServiceDim','SurgicalCasePrimaryServiceDim','SurgicalCasePrimaryServiceDim','SELECT DISTINCT
         PRMY_SRVC_CDS
       , PRMY_SRVC_DESC
  FROM CUBESPRD.SRGCL_CASE_DIM 
WHERE PRMY_SRVC_CDS IS NOT NULL')
,(124,'SurgicalCaseProcedureLevelDim','SurgicalCaseProcedureLevelDim','SurgicalCaseProcedureLevelDim','SELECT DISTINCT
         PRCDR_LEVL_CDS
       , PRCDR_LEVL_DESC
  FROM CUBESPRD.SRGCL_CASE_DIM 
WHERE PRCDR_LEVL_CDS IS NOT NULL')
,(125,'SurgicalCaseReasonNotPerformedDim','SurgicalCaseReasonNotPerformedDim','SurgicalCaseReasonNotPerformedDim','SELECT DISTINCT
         RSN_NOT_PRFRM_CDS
       , RSN_NOT_PRFRM_DESC
  FROM CUBESPRD.SRGCL_CASE_DIM 
WHERE RSN_NOT_PRFRM_CDS IS NOT NULL')
,(126,'SurgicalProcedureEventAnesthesiaTypeDim','SurgicalProcedureEventAnesthesiaTypeDim','SurgicalProcedureEventAnesthesiaTypeDim','SELECT DISTINCT 
 ANSTH_TYPE_CDS
       , ANSTH_TYPE_DESC
FROM CUBESPRD.SRGCL_PRCDR_EV_FACT
WHERE ANSTH_TYPE_CDS IS NOT NULL')
,(127,'SurgicalProcedureEventFact','SurgicalProcedureEventFact','SurgicalProcedureEventFact','SELECT SRG_PRCDR_EV_FACT_SK
       , SPE.PTNT_SK
       , SPE.CASE_SK
       , PRCDR_CD_SK
       , PRMY_PROVDR_SURGEON_SK
       , SCND_PROVDR_SURGEON_SK
       , THRD_PROVDR_SURGEON_SK
       , SCF.SRG_DT
       , SPE.HSPTL_ENCNT_SK
       , SPE.SRG_ENCNT_SK
       , CASE WHEN SPE.DEPT_SK < 0 THEN NULL ELSE SPE.DEPT_SK END AS DEPT_SK
       , SRVC_CDS
       , PRCDR_SITE_CDS
       , LTRLTY_CDS
       , ANSTH_TYPE_CDS
       , WND_CLASS_CDS
       , SCHED_IND
       , PRFRM_IND
       , PSSBL_IND
  FROM CUBESPRD.SRGCL_PRCDR_EV_FACT SPE INNER JOIN CUBESPRD.SRGCL_CASE_FACT SCF ON SPE.CASE_SK=SCF.CASE_SK')
,(128,'SurgicalProcedureEventLateralityDim','SurgicalProcedureEventLateralityDim','SurgicalProcedureEventLateralityDim','SELECT DISTINCT
LTRLTY_CDS
       , CASE WHEN LTRLTY_DESC=''N/A'' THEN ''Not Applicable'' ELSE LTRLTY_DESC END AS LTRLTY_DESC
FROM CUBESPRD.SRGCL_PRCDR_EV_FACT
WHERE LTRLTY_CDS IS NOT NULL')
,(129,'SurgicalProcedureEventProcedureSiteDim','SurgicalProcedureEventProcedureSiteDim','SurgicalProcedureEventProcedureSiteDim','SELECT DISTINCT
PRCDR_SITE_CDS
       , PRCDR_SITE_DESC
FROM CUBESPRD.SRGCL_PRCDR_EV_FACT
WHERE PRCDR_SITE_CDS IS NOT NULL')
,(130,'SurgicalProcedureEventServiceDim','SurgicalProcedureEventServiceDim','SurgicalProcedureEventServiceDim','SELECT DISTINCT 
 SRVC_CDS
       , SRVC_DESC
FROM CUBESPRD.SRGCL_PRCDR_EV_FACT
WHERE SRVC_CDS IS NOT NULL')
,(131,'SurgicalSupplyDim','SurgicalSupplyDim','SurgicalSupplyDim','SELECT SPPLY_SK
       , SPPLY_NM || '' (''  ||SRC_SPPLY_ID||'')''       AS SPPLY_NM
       , SPPLY_TYPE_CDS
       , MNFCTR_CDS
       , MNFCTR_CTLG_NBR
       , VND_CDS
       , VND_CTLG_NBR
       , CASE WHEN IMPLNT_IND = 1 THEN ''Yes'' WHEN IMPLNT_IND = 0 THEN ''No'' ELSE NULL END AS IMPLNT_IND
  FROM CUBESPRD.SRGCL_SPPLY_DIM')
,(132,'SurgicalSupplyManufacturerDim','SurgicalSupplyManufacturerDim','SurgicalSupplyManufacturerDim','SELECT DISTINCT 
         MNFCTR_CDS
       , MNFCTR_DESC
FROM CUBESPRD.SRGCL_SPPLY_DIM
WHERE MNFCTR_CDS IS NOT NULL')
,(133,'SurgicalSupplyUseFact','SurgicalSupplyUseFact','SurgicalSupplyUseFact','SELECT  SRGCL_SPPLY_USE_FACT_SK
       , SRC_SRGCL_SPPLY_ID
       , PTNT_SK
       , CASE_SK
       , SPPLY_SK
       , DEPT_SK
       , SRG_DT
       , HSPTL_ENCNT_SK
       , SRG_ENCNT_SK
       , PRMY_PROVDR_SK
       , PRCDR_CD_SK
       , LOG_STS_CDS
       , OR_SRVC_CDS
       , NBR_USE
       , NBR_WSTD
       , NBR_OPEN
       , NBR_PRN
       , UNT_COST
       , CRGBL_IND
  FROM CUBESPRD.SRGCL_SPPLY_USE_FACT')
,(134,'SurgicalSupplyUseLogStatusDim','SurgicalSupplyUseLogStatusDim','SurgicalSupplyUseLogStatusDim','SELECT DISTINCT 
  LOG_STS_CDS,
  LOG_STS_DESC
FROM CUBESPRD.MV_SRGCL_SPPLY_USE_FACT
WHERE LOG_STS_CDS IS NOT NULL')
,(135,'SurgicalSupplyUseORServiceDim','SurgicalSupplyUseORServiceDim','SurgicalSupplyUseORServiceDim','SELECT DISTINCT 
  OR_SRVC_CDS,
  OR_SRVC_DESC
FROM CUBESPRD.MV_SRGCL_SPPLY_USE_FACT
WHERE OR_SRVC_CDS IS NOT NULL')
,(136,'SurgicalSupplyVendorDim','SurgicalSupplyVendorDim','SurgicalSupplyVendorDim','SELECT DISTINCT 
  VND_CDS
       , VND_DESC
FROM CUBESPRD.SRGCL_SPPLY_DIM
WHERE VND_CDS IS NOT NULL')
,(17,'DW_TM_OF_DY_DIM','TimeDim','TimeDim','SELECT TM_OF_DY_SK
       , TM_OF_DY
       , HR_OF_DY
       , MN_OF_DY
       , SCND_OF_DY

  FROM EDW_PRD.DW.TM_OF_DY_DIM')
,(88,'UserDim','UserDim','UserDim','SELECT CAST(USR_SK AS BIGINT) USR_SK
       , NM||'' [''||SRC_USR_ID||'']'' USER_NAME
       , SRC_TYPE
       , LDAP_USR
       , SEX_CDS
FROM CUBESPRD.USR_DIM')
,(89,'UserGenderDim','UserGenderDim','UserGenderDim','SELECT DISTINCT
SEX_CDS,
SEX_DESC
FROM CUBESPRD.USR_DIM
WHERE SEX_CDS IS NOT NULL')
