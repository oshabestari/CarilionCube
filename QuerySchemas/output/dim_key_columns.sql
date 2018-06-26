truncate table [dbo].[tblVS_dim_key_columns]
insert into [dbo].[tblVS_dim_key_columns]([dim_column_id], [sort_order], [DataType], [TableId], [ColumnID]) values
(1,1,'Integer','','Binary_CD')
,(2,1,'Integer','','GEO_AREA_SK')
,(3,1,'WChar','','GEO_AREA_TYPE')
,(4,1,'Integer','','MSR_TYPE_SK')
,(5,1,'Integer','','SRC_SK')
,(6,1,'WChar','','SRC_YR')
,(7,1,'WChar','','SRC_ESTMTE_IN_YRS')
,(8,1,'Integer','','PRTY_SQNC')
,(9,1,'WChar','','DRG_TYPE_CD')
,(10,1,'Integer','','DRG_CD_SK')
,(11,1,'Integer','','MDC_CD')
,(12,1,'WChar','','DRG_CLASS')
,(13,1,'WChar','','DRG_NM')
,(14,1,'Integer','','SVL_CD')
,(15,1,'Date','','CLNDR_DT')
,(16,1,'Integer','','YR_NUM')
,(17,1,'Integer','','YR_AND_MTH_NUM')
,(18,1,'Integer','','YR_AND_QTR_NUM')
,(19,1,'Integer','','FSCL_YR_NUM')
,(20,1,'SmallInt','','FSCL_QTR_NUM')
,(20,2,'Integer','','FSCL_YR_NUM')
,(21,1,'SmallInt','','FSCL_MTH_NUM')
,(21,2,'Integer','','FSCL_YR_NUM')
,(22,1,'SmallInt','','DY_OF_WK_NUM')
,(23,1,'BigInt','','DEPT_SK')
,(24,1,'WChar','','CITY')
,(25,1,'Integer','','ST_PRV_CDS')
,(26,1,'WChar','','PSTL_CDS')
,(27,1,'Integer','','SPCLY_CDS')
,(28,1,'Integer','','PRFSNL_BILLNG_CL_CDS')
,(29,1,'Integer','','LO_CDS')
,(30,1,'Integer','','SRVC_AREA_CDS')
,(31,1,'Integer','','ALT_SRVC_AREA_CDS')
,(32,1,'WChar','','ICU_DEPT_IND')
,(33,1,'WChar','','PCU_DEPT_IND')
,(34,1,'WChar','','RSTCT_IND')
,(35,1,'WChar','','SRC_DEPT_ID')
,(36,1,'Integer','','FCM_Region_ID')
,(37,1,'Integer','','LOC_TYPE_CDS')
,(38,1,'Integer','','PRSNT_ON_ADMT_CD')
,(39,1,'WChar','','SRC_TYPE')
,(40,1,'Integer','','DIAG_HIR_SK')
,(41,1,'Integer','','DIAG_PRN_SK')
,(42,1,'Integer','','DIAG_CD_SK')
,(43,1,'Integer','','DIAG_HIR_SK')
,(44,1,'BigInt','','EDPTNT_VST_SK')
,(45,1,'Integer','','MEANS_ARRVL_CDS')
,(46,1,'Integer','','ACTY_LVL_CDS')
,(47,1,'Integer','','VST_FNNCL_CLSS_CDS')
,(48,1,'Integer','','ED_DSPSTN_CDS')
,(49,1,'Integer','','ER_ANALYSIS_A2_CDS')
,(50,1,'Integer','','ER_ANALYSIS_A28_CDS')
,(51,1,'Integer','','ER_ANALYSIS_A3_CDS')
,(52,1,'Integer','','ER_ANALYSIS_A4_CDS')
,(53,1,'Integer','','ER_ANALYSIS_A5_CDS')
,(54,1,'Integer','','ER_ANALYSIS_A86_CDS')
,(55,1,'Integer','','ER_ANALYSIS_A87_CDS')
,(56,1,'Integer','','ER_ANALYSIS_B1_CDS')
,(57,1,'Integer','','ER_ANALYSIS_B3_CDS')
,(58,1,'Integer','','ER_ANALYSIS_B4_CDS')
,(59,1,'Integer','','ER_ANALYSIS_B5_CDS')
,(60,1,'Integer','','ER_ANALYSIS_B76_CDS')
,(61,1,'Integer','','ER_ANALYSIS_C1_CDS')
,(62,1,'Integer','','ER_ANALYSIS_C2_CDS')
,(63,1,'Integer','','ER_ANALYSIS_C4_CDS')
,(64,1,'Integer','','ER_ANALYSIS_C5_CDS')
,(65,1,'Integer','','ER_ANALYSIS_C7_CDS')
,(66,1,'Integer','','ER_ANALYSIS_C75_CDS')
,(67,1,'Integer','','ER_ANALYSIS_D2_CDS')
,(68,1,'Integer','','ER_ANALYSIS_D3_CDS')
,(69,1,'Integer','','ER_ANALYSIS_D4_CDS')
,(70,1,'Integer','','ER_ANALYSIS_D52_CDS')
,(71,1,'Integer','','ER_ANALYSIS_D65_CDS')
,(72,1,'Integer','','ER_ANALYSIS_E1_CDS')
,(73,1,'Integer','','ER_ANALYSIS_E2_CDS')
,(74,1,'Integer','','ER_ANALYSIS_E3_CDS')
,(75,1,'Integer','','ER_DEMOGRAPHICS_EDCP1_CDS')
,(76,1,'Integer','','ER_DEMOGRAPHICS_EDCP10_CDS')
,(77,1,'Integer','','ER_DEMOGRAPHICS_EDCP11_CDS')
,(78,1,'Integer','','ER_DEMOGRAPHICS_EDCP12_CDS')
,(79,1,'Integer','','ER_DEMOGRAPHICS_EDCP13_CDS')
,(80,1,'Integer','','ER_DEMOGRAPHICS_EDCP16_CDS')
,(81,1,'Integer','','ER_DEMOGRAPHICS_EDCP17_CDS')
,(82,1,'Integer','','ER_DEMOGRAPHICS_EDCP2_CDS')
,(83,1,'Integer','','ER_DEMOGRAPHICS_EDCP22_CDS')
,(84,1,'Integer','','ER_DEMOGRAPHICS_EDCP23_CDS')
,(85,1,'Integer','','ER_DEMOGRAPHICS_EDCP24_CDS')
,(86,1,'Integer','','ER_DEMOGRAPHICS_EDCP25_CDS')
,(87,1,'Integer','','ER_DEMOGRAPHICS_EDCP26_CDS')
,(88,1,'Integer','','ER_DEMOGRAPHICS_EDCP27_CDS')
,(89,1,'Integer','','ER_DEMOGRAPHICS_EDCP28_CDS')
,(90,1,'Integer','','ER_DEMOGRAPHICS_EDCP29_CDS')
,(91,1,'Integer','','ER_DEMOGRAPHICS_EDCP3_CDS')
,(92,1,'Integer','','ER_DEMOGRAPHICS_EDCP30_CDS')
,(93,1,'Integer','','ER_DEMOGRAPHICS_EDCP31_CDS')
,(94,1,'Integer','','ER_DEMOGRAPHICS_EDCP32_CDS')
,(95,1,'Integer','','ER_DEMOGRAPHICS_EDCP33_CDS')
,(96,1,'Integer','','ER_DEMOGRAPHICS_EDCP35_CDS')
,(97,1,'Integer','','ER_DEMOGRAPHICS_EDCP36_CDS')
,(98,1,'Integer','','ER_DEMOGRAPHICS_EDCP37_CDS')
,(99,1,'Integer','','ER_DEMOGRAPHICS_EDCP39_CDS')
,(100,1,'Integer','','ER_DEMOGRAPHICS_EDCP4_CDS')
,(101,1,'Integer','','ER_DEMOGRAPHICS_EDCP40_CDS')
,(102,1,'Integer','','ER_DEMOGRAPHICS_EDCP41_CDS')
,(103,1,'Integer','','ER_DEMOGRAPHICS_EDCP42_CDS')
,(104,1,'Integer','','ER_DEMOGRAPHICS_EDCP43_CDS')
,(105,1,'Integer','','ER_DEMOGRAPHICS_EDCP48_CDS')
,(106,1,'Integer','','ER_DEMOGRAPHICS_EDCP59_CDS')
,(107,1,'Integer','','ER_DEMOGRAPHICS_EDCP6_CDS')
,(108,1,'Integer','','ER_DEMOGRAPHICS_EDCP61_CDS')
,(109,1,'WChar','','ER_DEMOGRAPHICS_EDCP62_CDS')
,(110,1,'WChar','','ER_DEMOGRAPHICS_EDCP63_CDS')
,(111,1,'WChar','','ER_DEMOGRAPHICS_EDCP64_CDS')
,(112,1,'WChar','','ER_DEMOGRAPHICS_EDCP65_CDS')
,(113,1,'WChar','','ER_DEMOGRAPHICS_EDCP9_CDS')
,(114,1,'Integer','','ER_ANALYSIS_F1_CDS')
,(115,1,'Integer','','ER_ANALYSIS_F2_CDS')
,(116,1,'Integer','','ER_ANALYSIS_F4_CDS')
,(117,1,'Integer','','ER_ANALYSIS_F41_CDS')
,(118,1,'Integer','','ER_ANALYSIS_F68_CDS')
,(119,1,'Integer','','ER_ANALYSIS_Q11822_1_CDS')
,(120,1,'WChar','','PG_PE_SURVEYED')
,(121,1,'Integer','','PE_ANALYSIS_A2_CDS')
,(122,1,'Integer','','PE_ANALYSIS_A20_CDS')
,(123,1,'Integer','','PE_ANALYSIS_A24_CDS')
,(124,1,'Integer','','PE_ANALYSIS_A25_CDS')
,(125,1,'Integer','','PE_ANALYSIS_A3_CDS')
,(126,1,'Integer','','PE_ANALYSIS_A4_CDS')
,(127,1,'Integer','','PE_ANALYSIS_A5_CDS')
,(128,1,'Integer','','PE_ANALYSIS_A7_CDS')
,(129,1,'Integer','','PE_ANALYSIS_B1_CDS')
,(130,1,'Integer','','PE_ANALYSIS_B11_CDS')
,(131,1,'Integer','','PE_ANALYSIS_B3_CDS')
,(132,1,'Integer','','PE_ANALYSIS_B4_CDS')
,(133,1,'Integer','','PE_ANALYSIS_B5_CDS')
,(134,1,'Integer','','PE_ANALYSIS_C1_CDS')
,(135,1,'Integer','','PE_ANALYSIS_C2_CDS')
,(136,1,'Integer','','PE_ANALYSIS_C4_CDS')
,(137,1,'Integer','','PE_ANALYSIS_C5_CDS')
,(138,1,'Integer','','PE_ANALYSIS_C6_CDS')
,(139,1,'Integer','','PE_ANALYSIS_C9_CDS')
,(140,1,'Integer','','PE_ANALYSIS_D14_CDS')
,(141,1,'Integer','','PE_ANALYSIS_D15_CDS')
,(142,1,'Integer','','PE_ANALYSIS_D2_CDS')
,(143,1,'Integer','','PE_ANALYSIS_D3_CDS')
,(144,1,'Integer','','PE_ANALYSIS_D4_CDS')
,(145,1,'Integer','','PE_ANALYSIS_F1_CDS')
,(146,1,'Integer','','PE_ANALYSIS_F15_CDS')
,(147,1,'Integer','','PE_ANALYSIS_F2_CDS')
,(148,1,'Integer','','PE_ANALYSIS_F20_CDS')
,(149,1,'Integer','','PE_ANALYSIS_F4_CDS')
,(150,1,'WChar','','PG_ER_SURVEYED')
,(151,1,'BigInt','','ENCNT_SK')
,(152,1,'Integer','','PTNT_STS_CDS')
,(153,1,'Integer','','ENCNT_TYPE_CDS')
,(154,1,'Integer','','LEVL_OF_CARE_CDS')
,(155,1,'Integer','','PTNT_BSE_CLSS_CDS')
,(156,1,'WChar','','TRAUMA_IND')
,(157,1,'Integer','','AGE_YRS_AT_ENCNT')
,(158,1,'Integer','','AGE_MNTHS_AT_ENCNT')
,(159,1,'Integer','','AGE_DYS_AT_ENCNT')
,(160,1,'Integer','','BILLING_CLASS_CDS')
,(161,1,'Integer','','DEPT_CDS')
,(162,1,'Integer','','PRD_LINE_CDS')
,(163,1,'BigInt','','INPTNT_VST_SK')
,(164,1,'Integer','','AGE_YRS_AT_CLNC_INPTNT_ADMT')
,(165,1,'Integer','','AGE_MNTHS_AT_CLNC_INPTNT_ADMT')
,(166,1,'Integer','','AGE_DYS_AT_CLNC_INPTNT_ADMT')
,(167,1,'BigInt','','LOS_DYS_CLNC_INPTNT')
,(168,1,'Integer','','LOS_HRS_CLNC_INPTNT')
,(169,1,'Integer','','ADMT_TYPE_CDS')
,(170,1,'Integer','','DSCRG_DSPSTN_CDS')
,(171,1,'Integer','','DSCRG_DSTN_CDS')
,(172,1,'Integer','','ADMT_SRC_CDS')
,(173,1,'Integer','','PTNT_CL_CDS')
,(174,1,'WChar','','AMI_1')
,(175,1,'WChar','','AMI_2')
,(176,1,'WChar','','AMI_3')
,(177,1,'WChar','','AMI_5')
,(178,1,'WChar','','AMI_7')
,(179,1,'WChar','','AMI_7A')
,(180,1,'WChar','','AMI_8')
,(181,1,'WChar','','AMI_8A')
,(182,1,'WChar','','CMS_1')
,(183,1,'WChar','','CMS_2')
,(184,1,'WChar','','CMS_3')
,(185,1,'WChar','','CMS_4')
,(186,1,'WChar','','CMS_5')
,(187,1,'WChar','','CMS_6')
,(188,1,'WChar','','CMS_9')
,(189,1,'WChar','','CMS_10')
,(190,1,'WChar','','CMS_11')
,(191,1,'WChar','','CMS_12')
,(192,1,'WChar','','CMS_13')
,(193,1,'WChar','','CMS_14')
,(194,1,'WChar','','CMS_15')
,(195,1,'WChar','','CMS_16')
,(196,1,'WChar','','CMS_17')
,(197,1,'WChar','','CMS_18')
,(198,1,'WChar','','CMS_159')
,(199,1,'WChar','','AMI_10')
,(200,1,'WChar','','HF_1')
,(201,1,'WChar','','HF_2')
,(202,1,'WChar','','HF_3')
,(203,1,'WChar','','IMM_1A')
,(204,1,'WChar','','IMM_1B')
,(205,1,'WChar','','IMM_1C')
,(206,1,'WChar','','PN_3A')
,(207,1,'WChar','','PN_3B')
,(208,1,'WChar','','PN_6')
,(209,1,'WChar','','PN_6A')
,(210,1,'WChar','','PN_6B')
,(211,1,'WChar','','ED_1A')
,(212,1,'WChar','','ED_1C')
,(213,1,'WChar','','ED_2A')
,(214,1,'WChar','','ED_2B')
,(215,1,'WChar','','ED_2C')
,(216,1,'WChar','','IQI1_ESOPHAGEAL_RESECTION_VOL')
,(217,1,'WChar','','IQI2_PANCREATIC_RESECTION_VOL')
,(218,1,'WChar','','IQI4_AAA_REPAIR_VOL')
,(219,1,'WChar','','IQI5_CABG_VOL')
,(220,1,'WChar','','IQI6_PTCA_VOL')
,(221,1,'WChar','','IQI7_CAROTID_ENDARTERECTOMY_VOL')
,(222,1,'WChar','','IQI8_ESOPHAGEAL_RESECTION_MORT')
,(223,1,'WChar','','IQI9_PANCREATIC_RESECTION_MORT')
,(224,1,'WChar','','IQI11_AAA_REPAIR_MORT')
,(225,1,'WChar','','IQI12_CABG_MORT')
,(226,1,'WChar','','IQI13_CRANIOTOMY_MORT')
,(227,1,'WChar','','IQI14_HIP_REPLACEMENT_MORT')
,(228,1,'WChar','','IQI15_AMI_MORT')
,(229,1,'WChar','','IQI16_CHF_MORT')
,(230,1,'WChar','','IQI17_ACUTE_STROKE_MORT')
,(231,1,'WChar','','IQI18_GASTROINTESTINAL_HEM_MORT')
,(232,1,'WChar','','IQI19_HIP_FRACTURE_MORT')
,(233,1,'WChar','','IQI20_PNEUMONIA_MORT')
,(234,1,'WChar','','IQI21_CESAREAN_DELIVERY')
,(235,1,'WChar','','IQI22_VBAC_UNCOMP')
,(236,1,'WChar','','IQI23_LAPAROSCOPIC_CHOLECYSTECTOMY')
,(237,1,'WChar','','IQI24_INCIDENTAL_APPENDECTOMY_ELDERLY')
,(238,1,'WChar','','IQI25_BILATERAL_CARDIAC_CATH')
,(239,1,'WChar','','IQI30_PTCA_MORT')
,(240,1,'WChar','','IQI31_CAROTID_ENDARTERECTOMY_MORT')
,(241,1,'WChar','','IQI32_AMI_MORT_RATE_WO_TRANSFER')
,(242,1,'WChar','','IQI33_PRI_CESAREAN_DELIVERY')
,(243,1,'WChar','','IQI34_VBAC_ALL')
,(244,1,'WChar','','SCIP_VTE_2')
,(245,1,'WChar','','SCIP_INF_10')
,(246,1,'WChar','','SCIP_INF_9')
,(247,1,'WChar','','SCIP_INF_6')
,(248,1,'WChar','','SCIP_CARD_2')
,(249,1,'WChar','','SCIP_INF_1A')
,(250,1,'WChar','','SCIP_INF_1B')
,(251,1,'WChar','','SCIP_INF_1C')
,(252,1,'WChar','','SCIP_INF_1D')
,(253,1,'WChar','','SCIP_INF_1E')
,(254,1,'WChar','','SCIP_INF_1G')
,(255,1,'WChar','','SCIP_INF_1H')
,(256,1,'WChar','','SCIP_INF_2A')
,(257,1,'WChar','','SCIP_INF_2B')
,(258,1,'WChar','','SCIP_INF_2C')
,(259,1,'WChar','','SCIP_INF_2D')
,(260,1,'WChar','','SCIP_INF_2E')
,(261,1,'WChar','','SCIP_INF_2F')
,(262,1,'WChar','','SCIP_INF_2G')
,(263,1,'WChar','','SCIP_INF_3B')
,(264,1,'WChar','','SCIP_INF_3C')
,(265,1,'WChar','','SCIP_INF_3D')
,(266,1,'WChar','','SCIP_INF_3E')
,(267,1,'WChar','','SCIP_INF_3F')
,(268,1,'WChar','','SCIP_INF_3G')
,(269,1,'WChar','','SCIP_INF_3H')
,(270,1,'WChar','','SCIP_INF_4')
,(271,1,'WChar','','SCIP_INF_1F')
,(272,1,'WChar','','STK_1')
,(273,1,'WChar','','STK_2')
,(274,1,'WChar','','STK_3')
,(275,1,'WChar','','STK_4')
,(276,1,'WChar','','STK_5')
,(277,1,'WChar','','STK_6')
,(278,1,'WChar','','STK_8')
,(279,1,'WChar','','STK_10')
,(280,1,'WChar','','ANES_COMP')
,(281,1,'WChar','','ASPIR_PNEUMONIA')
,(282,1,'WChar','','BIRTH_TRAUMA')
,(283,1,'WChar','','CABG_AFTER_PTCA')
,(284,1,'WChar','','DEATH_LOW_MORT_DRG')
,(285,1,'WChar','','DECUB_ULCER_RISK_PAT')
,(286,1,'WChar','','DECUBITUS_ULCER')
,(287,1,'WChar','','FAIL_RESCUE_A')
,(288,1,'WChar','','FAIL_RESCUE_B')
,(289,1,'WChar','','FAIL_RESCUE_C')
,(290,1,'WChar','','FAIL_RESCUE_D')
,(291,1,'WChar','','FAIL_RESCUE_E')
,(292,1,'WChar','','FOREIGN_BODY_LEFT')
,(293,1,'WChar','','IN_HOSP_FRAC')
,(294,1,'WChar','','INFECTION_MED_CARE')
,(295,1,'WChar','','INTRAOP_NERVE_COMP')
,(296,1,'WChar','','LATRO_PNEUMOTHORAX')
,(297,1,'WChar','','MALIG_HYPERTHERMIA')
,(298,1,'WChar','','OB_LACERATIONS')
,(299,1,'WChar','','OB_TRA_CSECT')
,(300,1,'WChar','','OB_TRA_VAG_W_INSTR')
,(301,1,'WChar','','OB_TRA_VAG_WO_INSTR')
,(302,1,'WChar','','OB_WOUND_CSECT')
,(303,1,'WChar','','OB_WOUND_VAG')
,(304,1,'WChar','','OTHER_OB_COMP_DEL')
,(305,1,'WChar','','POST_PART_URIN_INFECT')
,(306,1,'WChar','','POSTOP_AMI')
,(307,1,'WChar','','POSTOP_DERANGEMNTS')
,(308,1,'WChar','','POSTOP_HEM')
,(309,1,'WChar','','POSTOP_HIP_FRAC')
,(310,1,'WChar','','POSTOP_IATRO_CARD')
,(311,1,'WChar','','POSTOP_IATRO_NERV')
,(312,1,'WChar','','POSTOP_PUL_EMB')
,(313,1,'WChar','','POSTOP_RESP_FAILURE')
,(314,1,'WChar','','POSTOP_SEPSIS')
,(315,1,'WChar','','POSTOP_WOUND_DEHIS')
,(316,1,'WChar','','REOPEN_SURG_SITE')
,(317,1,'Integer','','SUTURE_LACERATION')
,(318,1,'WChar','','TECH_DIFF_PROC')
,(319,1,'WChar','','TRANSF_REACTION')
,(320,1,'WChar','','UTERINE_RUPTURE')
,(321,1,'WChar','','VTE_1')
,(322,1,'WChar','','VTE_2')
,(323,1,'WChar','','VTE_3')
,(324,1,'WChar','','VTE_4')
,(325,1,'WChar','','VTE_5')
,(326,1,'WChar','','VTE_6')
,(327,1,'WChar','','SCIP_INF_3A')
,(328,1,'WChar','','ED_1B')
,(329,1,'WChar','','CMS_7')
,(330,1,'WChar','','CMS_8')
,(331,1,'WChar','','FAIL_RESCUE')
,(332,1,'WChar','','SCIP_INF_2H')
,(333,1,'Integer','','IN_CAHPS_CMS_1_CDS')
,(334,1,'Integer','','IN_CAHPS_CMS_10_CDS')
,(335,1,'Integer','','IN_CAHPS_CMS_11_CDS')
,(336,1,'Integer','','IN_CAHPS_CMS_12_CDS')
,(337,1,'Integer','','IN_CAHPS_CMS_13CL_CDS')
,(338,1,'Integer','','IN_CAHPS_CMS_14_CDS')
,(339,1,'Integer','','IN_CAHPS_CMS_15CL_CDS')
,(340,1,'Integer','','IN_CAHPS_CMS_16CL_CDS')
,(341,1,'Integer','','IN_CAHPS_CMS_18_CDS')
,(342,1,'Integer','','IN_CAHPS_CMS_19CL_CDS')
,(343,1,'Integer','','IN_CAHPS_CMS_2_CDS')
,(344,1,'Integer','','IN_CAHPS_CMS_20_CDS')
,(345,1,'Integer','','IN_CAHPS_CMS_21CL_CDS')
,(346,1,'Integer','','IN_CAHPS_CMS_22CL_CDS')
,(347,1,'Integer','','IN_CAHPS_CMS_23_CDS')
,(348,1,'Integer','','IN_CAHPS_CMS_24_CDS')
,(349,1,'Integer','','IN_CAHPS_CMS_25_CDS')
,(350,1,'Integer','','IN_CAHPS_CMS_26_CDS')
,(351,1,'Integer','','IN_CAHPS_CMS_27_CDS')
,(352,1,'Integer','','IN_CAHPS_CMS_28_CDS')
,(353,1,'Integer','','IN_CAHPS_CMS_29A_CDS')
,(354,1,'Integer','','IN_CAHPS_CMS_29B_CDS')
,(355,1,'Integer','','IN_CAHPS_CMS_29C_CDS')
,(356,1,'Integer','','IN_CAHPS_CMS_29D_CDS')
,(357,1,'Integer','','IN_CAHPS_CMS_29E_CDS')
,(358,1,'Integer','','IN_CAHPS_CMS_3_CDS')
,(359,1,'Integer','','IN_CAHPS_CMS_30_CDS')
,(360,1,'Integer','','IN_CAHPS_CMS_33CL_CDS')
,(361,1,'Integer','','IN_CAHPS_CMS_34_CDS')
,(362,1,'Integer','','IN_CAHPS_CMS_37CL_CDS')
,(363,1,'Integer','','IN_CAHPS_CMS_38_CDS')
,(364,1,'Integer','','IN_CAHPS_CMS_39_CDS')
,(365,1,'Integer','','IN_CAHPS_CMS_40_CDS')
,(366,1,'Integer','','IN_CAHPS_CMS_41_CDS')
,(367,1,'Integer','','IN_CAHPS_CMS_6_CDS')
,(368,1,'Integer','','IN_CAHPS_CMS_7_CDS')
,(369,1,'Integer','','IN_CAHPS_CMS_8_CDS')
,(370,1,'Integer','','IN_ANALYSIS_A1_CDS')
,(371,1,'Integer','','IN_ANALYSIS_A2_CDS')
,(372,1,'Integer','','IN_ANALYSIS_D1_CDS')
,(373,1,'Integer','','IN_ANALYSIS_D2_CDS')
,(374,1,'Integer','','IN_ANALYSIS_D3_CDS')
,(375,1,'Integer','','IN_ANALYSIS_E1_CDS')
,(376,1,'Integer','','IN_ANALYSIS_E2_CDS')
,(377,1,'Integer','','IN_ANALYSIS_E4_CDS')
,(378,1,'Integer','','IN_ANALYSIS_E7_CDS')
,(379,1,'Integer','','IN_ANALYSIS_I1_CDS')
,(380,1,'Integer','','IN_ANALYSIS_I3_CDS')
,(381,1,'Integer','','IN_ANALYSIS_I4_CDS')
,(382,1,'Integer','','IN_ANALYSIS_I5_CDS')
,(383,1,'Integer','','IN_ANALYSIS_I6_CDS')
,(384,1,'Integer','','IN_ANALYSIS_L2_CDS')
,(385,1,'Integer','','IN_ANALYSIS_L3_CDS')
,(386,1,'Integer','','IN_ANALYSIS_L5_CDS')
,(387,1,'Integer','','IN_ANALYSIS_L6_CDS')
,(388,1,'Integer','','IN_ANALYSIS_L8_CDS')
,(389,1,'Integer','','IN_ANALYSIS_M2_CDS')
,(390,1,'Integer','','IN_ANALYSIS_M3_CDS')
,(391,1,'Integer','','IN_ANALYSIS_M4_CDS')
,(392,1,'Integer','','IN_ANALYSIS_N1_CDS')
,(393,1,'Integer','','IN_ANALYSIS_N2_CDS')
,(394,1,'Integer','','IN_ANALYSIS_N3_CDS')
,(395,1,'Integer','','IN_ANALYSIS_N4_CDS')
,(396,1,'Integer','','IN_ANALYSIS_N5_CDS')
,(397,1,'Integer','','IN_ANALYSIS_N6_CDS')
,(398,1,'Integer','','IN_ANALYSIS_O2_CDS')
,(399,1,'Integer','','IN_ANALYSIS_O3_CDS')
,(400,1,'Integer','','IN_ANALYSIS_O4_CDS')
,(401,1,'Integer','','IN_ANALYSIS_P1_CDS')
,(402,1,'Integer','','IN_ANALYSIS_P2_CDS')
,(403,1,'Integer','','IN_ANALYSIS_P3_CDS')
,(404,1,'Integer','','IN_ANALYSIS_P4_CDS')
,(405,1,'Integer','','IN_ANALYSIS_P5_CDS')
,(406,1,'Integer','','IN_ANALYSIS_Q11822_1_CDS')
,(407,1,'Integer','','IN_ANALYSIS_R1_CDS')
,(408,1,'Integer','','IN_ANALYSIS_R2_CDS')
,(409,1,'Integer','','IN_ANALYSIS_R3_CDS')
,(410,1,'Integer','','IN_ANALYSIS_R4_CDS')
,(411,1,'Integer','','IN_ANALYSIS_R5_CDS')
,(412,1,'Integer','','IN_ANALYSIS_T1_CDS')
,(413,1,'Integer','','IN_ANALYSIS_T3_CDS')
,(414,1,'Integer','','IN_ANALYSIS_T5_CDS')
,(415,1,'Integer','','IN_ANALYSIS_T7_CDS')
,(416,1,'Integer','','IN_ANALYSIS_V2_CDS')
,(417,1,'Integer','','IN_ANALYSIS_V3_CDS')
,(418,1,'WChar','','READMISSION_INDX_ADMSN_IND')
,(419,1,'WChar','','READMISSION_READMSN_IND')
,(420,1,'WChar','','READMISSION_PLN_UNPLN')
,(421,1,'WChar','','PX_IND')
,(422,1,'WChar','','READMISSION_AMI_IND')
,(423,1,'WChar','','READMISSION_HF_IND')
,(424,1,'WChar','','READMISSION_COPD_IND')
,(425,1,'WChar','','READMISSION_PNEU_IND')
,(426,1,'WChar','','READMISSION_CABG_IND')
,(427,1,'WChar','','READMISSION_THATKA_IND')
,(428,1,'WChar','','READMISSION_SEPSIS_IND')
,(429,1,'BigInt','','LAB_STS_CD_SK')
,(430,1,'BigInt','','RSLT_FLG_CD_SK')
,(431,1,'BigInt','','CMPNT_SK')
,(432,1,'WChar','','COMP_NAME')
,(433,1,'Integer','','CMPNT_TYPE_CDS')
,(434,1,'BigInt','','LAB_TST_SK')
,(435,1,'Integer','','ORDR_PRTY_CDS')
,(436,1,'Integer','','ORDR_SRC_TYPE_CDS')
,(437,1,'Integer','','CNCL_RSN_CDS')
,(438,1,'WChar','','ABNRML_IND')
,(439,1,'WChar','','CRTCL_IND')
,(440,1,'WChar','','CORR_IND')
,(441,1,'WChar','','HI_PRTY_IND')
,(442,1,'Integer','','SPCMN_SRC_CDS')
,(443,1,'Integer','','SPCMN_TYPE_CDS')
,(444,1,'Integer','','VRFCTN_STS_CDS')
,(445,1,'BigInt','','TST_CDS')
,(446,1,'Integer','','ORDR_TYPE_CDS')
,(447,1,'BigInt','','LAB_SK')
,(448,1,'WChar','','LAB_NAME')
,(449,1,'WChar','','LAB_CITY')
,(450,1,'WChar','','LAB_PSTL_CDS')
,(451,1,'WChar','','LAB_ST_ABBR')
,(452,1,'Integer','','Measure_Dim_ID')
,(453,1,'Integer','','Source_ID')
,(454,1,'Integer','','ADMN_ACTN_CDS_SK')
,(455,1,'BigInt','','MDCTN_ORDR_SK')
,(456,1,'WChar','','FREQ_DESC')
,(457,1,'Integer','','RT_CDS')
,(458,1,'Integer','','QTY_UNT_CDS')
,(459,1,'Integer','','DOSE_UNT_CDS')
,(460,1,'Integer','','CLCLTD_DOSE_UNT_CDS')
,(461,1,'Integer','','ORDR_SRC_CDS')
,(462,1,'Integer','','ORDR_CLASS_CDS')
,(463,1,'Integer','','ORDR_MODE_CDS')
,(464,1,'Integer','','ORDR_PRTY_CDS')
,(465,1,'BigInt','','ORDR_SET_SRC_CDS')
,(466,1,'WChar','','PRN_RSN_1')
,(467,1,'WChar','','INDC_FOR_USE_1')
,(468,1,'WChar','','CPOE_IND')
,(469,1,'WChar','','DSPNS_AS_WRTN_IND')
,(470,1,'WChar','','ORDRD_AS_NONFORM_IND')
,(471,1,'WChar','','VRFD_AS_NONFORM_IND')
,(472,1,'WChar','','AUTOMAT_VRFD_IND')
,(473,1,'WChar','','VRBL_IND')
,(474,1,'WChar','','REQR_COSIG_IND')
,(475,1,'WChar','','COSIG_IND')
,(476,1,'WChar','','VRBL_SGN_IND')
,(477,1,'BigInt','','MDCTN_SK')
,(478,1,'WChar','','GNRC_NM')
,(479,1,'Integer','','THRPC_CLASS_CDS')
,(480,1,'Integer','','PHARM_CLASS_CDS')
,(481,1,'Integer','','PHARM_SUBCLS_CDS')
,(482,1,'Integer','','MDCTN_FORM_CDS')
,(483,1,'Integer','','ADMN_RT_CDS')
,(484,1,'Integer','','DEA_CLASS_CDS')
,(485,1,'WChar','','CNTLD_SUBSTN_IND')
,(486,1,'BigInt','','MDCTN_ORDR_SK')
,(487,1,'WChar','','FREQ_CDS')
,(488,1,'WChar','','RT_CDS')
,(489,1,'WChar','','CLCLTD_DOSE_UNT_CDS')
,(490,1,'WChar','','ORDR_SRC_CDS')
,(491,1,'WChar','','ORDR_CLASS_CDS')
,(492,1,'WChar','','ORDR_MODE_CDS')
,(493,1,'WChar','','ORDR_PRTY_CDS')
,(494,1,'WChar','','ORDR_SET_SRC_CDS')
,(495,1,'WChar','','QTY_UNT_CDS')
,(496,1,'WChar','','DOSE_UNT_CDS')
,(497,1,'Integer','','CPOE_IND')
,(498,1,'Integer','','DSPNS_AS_WRTN_IND')
,(499,1,'Integer','','ORDRD_AS_NONFORM_IND')
,(500,1,'Integer','','VRFD_AS_NONFORM_IND')
,(501,1,'Integer','','AUTOMAT_VRFD_IND')
,(502,1,'Integer','','VRBL_IND')
,(503,1,'Integer','','REQR_COSIG_IND')
,(504,1,'Integer','','COSIG_IND')
,(505,1,'BigInt','','ENCNT_SK')
,(506,1,'Integer','','APPT_CNF_STT_CDS')
,(507,1,'Integer','','APPT_STTS_CDS')
,(508,1,'Integer','','ADMT_CNF_STT_CDS')
,(509,1,'Integer','','VST_FNNCL_CLSS_CDS')
,(510,1,'Integer','','CNCL_RSN_CDS')
,(511,1,'Integer','','AGE_DYS_AT_ENCNT')
,(512,1,'Integer','','AGE_MNTHS_AT_ENCNT')
,(513,1,'Integer','','AGE_YRS_AT_ENCNT')
,(514,1,'WChar','','MDCTN_RVWD_IND')
,(515,1,'WChar','','PRBLM_LST_RVWD')
,(516,1,'WChar','','AVS_PRNTD_IND')
,(517,1,'WChar','','ALLRG_RVWD_IND')
,(518,1,'WChar','','CLSD_IND')
,(519,1,'WChar','','APPT_CMPLT_IND')
,(520,1,'WChar','','WLKN_IND')
,(521,1,'WChar','','RFRRL_RQRD_IND')
,(522,1,'Integer','','AS_ANALYSIS_C185_CDS')
,(523,1,'Integer','','AS_ANALYSIS_C186_CDS')
,(524,1,'Integer','','AS_ANALYSIS_C3_CDS')
,(525,1,'Integer','','AS_ANALYSIS_D2_CDS')
,(526,1,'Integer','','AS_ANALYSIS_D3_CDS')
,(527,1,'Integer','','AS_ANALYSIS_D98_CDS')
,(528,1,'Integer','','AS_ANALYSIS_D99_CDS')
,(529,1,'WChar','','AS_ANALYSIS_Q11822_1')
,(530,1,'Integer','','AS_CAHPS_OSC_1_CDS')
,(531,1,'Integer','','AS_CAHPS_OSC_10_CDS')
,(532,1,'Integer','','AS_CAHPS_OSC_11CL_CDS')
,(533,1,'Integer','','AS_CAHPS_OSC_12CL_CDS')
,(534,1,'Integer','','AS_CAHPS_OSC_13_CDS')
,(535,1,'Integer','','AS_CAHPS_OSC_14_CDS')
,(536,1,'Integer','','AS_CAHPS_OSC_15_CDS')
,(537,1,'Integer','','AS_CAHPS_OSC_16_CDS')
,(538,1,'Integer','','AS_CAHPS_OSC_17_CDS')
,(539,1,'Integer','','AS_CAHPS_OSC_18_CDS')
,(540,1,'Integer','','AS_CAHPS_OSC_19_CDS')
,(541,1,'Integer','','AS_CAHPS_OSC_2_CDS')
,(542,1,'Integer','','AS_CAHPS_OSC_20_CDS')
,(543,1,'Integer','','AS_CAHPS_OSC_21_CDS')
,(544,1,'Integer','','AS_CAHPS_OSC_22_CDS')
,(545,1,'Integer','','AS_CAHPS_OSC_23_CDS')
,(546,1,'Integer','','AS_CAHPS_OSC_24_CDS')
,(547,1,'Integer','','AS_CAHPS_OSC_3_CDS')
,(548,1,'Integer','','AS_CAHPS_OSC_4_CDS')
,(549,1,'Integer','','AS_CAHPS_OSC_5_CDS')
,(550,1,'Integer','','AS_CAHPS_OSC_6_CDS')
,(551,1,'Integer','','AS_CAHPS_OSC_7_CDS')
,(552,1,'Integer','','AS_CAHPS_OSC_8_CDS')
,(553,1,'Integer','','AS_CAHPS_OSC_9_CDS')
,(554,1,'Integer','','OU_ANALYSIS_A4_CDS')
,(555,1,'Integer','','OU_ANALYSIS_A48_CDS')
,(556,1,'Integer','','OU_ANALYSIS_A6_CDS')
,(557,1,'Integer','','OU_ANALYSIS_A7_CDS')
,(558,1,'Integer','','OU_ANALYSIS_C121_CDS')
,(559,1,'Integer','','OU_ANALYSIS_C2_CDS')
,(560,1,'Integer','','OU_ANALYSIS_C6_CDS')
,(561,1,'Integer','','OU_ANALYSIS_C7_CDS')
,(562,1,'Integer','','OU_ANALYSIS_C8_CDS')
,(563,1,'Integer','','OU_ANALYSIS_D2_CDS')
,(564,1,'Integer','','OU_ANALYSIS_D3_CDS')
,(565,1,'Integer','','OU_ANALYSIS_E1_CDS')
,(566,1,'Integer','','OU_ANALYSIS_E101_CDS')
,(567,1,'Integer','','OU_ANALYSIS_E102_CDS')
,(568,1,'Integer','','OU_ANALYSIS_E14_CDS')
,(569,1,'Integer','','OU_ANALYSIS_E38_CDS')
,(570,1,'Integer','','OU_ANALYSIS_E4_CDS')
,(571,1,'Integer','','OU_ANALYSIS_Q11822_1_CDS')
,(572,1,'Integer','','UC_ANALYSIS_A2_CDS')
,(573,1,'Integer','','UC_ANALYSIS_A28_CDS')
,(574,1,'Integer','','UC_ANALYSIS_A3_CDS')
,(575,1,'Integer','','UC_ANALYSIS_A4_CDS')
,(576,1,'Integer','','UC_ANALYSIS_A5_CDS')
,(577,1,'Integer','','UC_ANALYSIS_B1_CDS')
,(578,1,'Integer','','UC_ANALYSIS_B3_CDS')
,(579,1,'Integer','','UC_ANALYSIS_B4_CDS')
,(580,1,'Integer','','UC_ANALYSIS_B5_CDS')
,(581,1,'Integer','','UC_ANALYSIS_B61_CDS')
,(582,1,'Integer','','UC_ANALYSIS_C1_CDS')
,(583,1,'Integer','','UC_ANALYSIS_C2_CDS')
,(584,1,'Integer','','UC_ANALYSIS_C34_CDS')
,(585,1,'Integer','','UC_ANALYSIS_C4_CDS')
,(586,1,'Integer','','UC_ANALYSIS_C5_CDS')
,(587,1,'Integer','','UC_ANALYSIS_C60_CDS')
,(588,1,'Integer','','UC_ANALYSIS_C7_CDS')
,(589,1,'Integer','','UC_ANALYSIS_D2_CDS')
,(590,1,'Integer','','UC_ANALYSIS_D3_CDS')
,(591,1,'Integer','','UC_ANALYSIS_D4_CDS')
,(592,1,'Integer','','UC_ANALYSIS_D58_CDS')
,(593,1,'Integer','','UC_ANALYSIS_D59_CDS')
,(594,1,'Integer','','UC_ANALYSIS_E1_CDS')
,(595,1,'Integer','','UC_ANALYSIS_E2_CDS')
,(596,1,'Integer','','UC_ANALYSIS_E3_CDS')
,(597,1,'Integer','','UC_ANALYSIS_F1_CDS')
,(598,1,'Integer','','UC_ANALYSIS_F120_CDS')
,(599,1,'Integer','','UC_ANALYSIS_F2_CDS')
,(600,1,'Integer','','UC_ANALYSIS_F4_CDS')
,(601,1,'Integer','','UC_ANALYSIS_F41_CDS')
,(602,1,'Integer','','UC_ANALYSIS_Q11822_1_CDS')
,(603,1,'Integer','','MD_ANALYSIS_A1_CDS')
,(604,1,'Integer','','MD_ANALYSIS_A14_CDS')
,(605,1,'Integer','','MD_ANALYSIS_CP1_CDS')
,(606,1,'Integer','','MD_ANALYSIS_CP10_CDS')
,(607,1,'Integer','','MD_ANALYSIS_CP2_CDS')
,(608,1,'Integer','','MD_ANALYSIS_CP3_CDS')
,(609,1,'Integer','','MD_ANALYSIS_CP4_CDS')
,(610,1,'Integer','','MD_ANALYSIS_CP5_CDS')
,(611,1,'Integer','','MD_ANALYSIS_CP6_CDS')
,(612,1,'Integer','','MD_ANALYSIS_CP7_CDS')
,(613,1,'Integer','','MD_ANALYSIS_CP8_CDS')
,(614,1,'Integer','','MD_ANALYSIS_CP9_CDS')
,(615,1,'Integer','','MD_ANALYSIS_I1_CDS')
,(616,1,'Integer','','MD_ANALYSIS_I2_CDS')
,(617,1,'Integer','','MD_ANALYSIS_I3_CDS')
,(618,1,'Integer','','MD_ANALYSIS_I60_CDS')
,(619,1,'Integer','','MD_ANALYSIS_N1_CDS')
,(620,1,'Integer','','MD_ANALYSIS_N2_CDS')
,(621,1,'Integer','','MD_ANALYSIS_O15_CDS')
,(622,1,'Integer','','MD_ANALYSIS_O2_CDS')
,(623,1,'Integer','','MD_ANALYSIS_O4_CDS')
,(624,1,'Integer','','MD_ANALYSIS_Q11822_1_CDS')
,(625,1,'Integer','','MD_ANALYSIS_V2_CDS')
,(626,1,'Integer','','MD_ANALYSIS_V60_CDS')
,(627,1,'Integer','','MD_ANALYSIS_V7_CDS')
,(628,1,'Integer','','MD_CAHPS_ACO_01C_CDS')
,(629,1,'Integer','','MD_CAHPS_ACO_02C_CDS')
,(630,1,'Integer','','MD_CAHPS_ACO_03C_CDS')
,(631,1,'Integer','','MD_CAHPS_ACO_04C_CDS')
,(632,1,'Integer','','MD_CAHPS_ACO_05C_CDS')
,(633,1,'Integer','','MD_CAHPS_ACO_06C_CDS')
,(634,1,'Integer','','MD_CAHPS_ACO_07C_CDS')
,(635,1,'Integer','','MD_CAHPS_ACO_08C_CDS')
,(636,1,'Integer','','MD_CAHPS_ACO_09C_CDS')
,(637,1,'Integer','','MD_CAHPS_ACO_12C_CDS')
,(638,1,'Integer','','MD_CAHPS_ACO_13C_CDS')
,(639,1,'Integer','','MD_CAHPS_ACO_14C_CDS')
,(640,1,'Integer','','MD_CAHPS_ACO_38C_CDS')
,(641,1,'Integer','','MD_CAHPS_ACO_39C_CDS')
,(642,1,'Integer','','MD_CAHPS_CG_1_CDS')
,(643,1,'Integer','','MD_CAHPS_CG_2CL_CDS')
,(644,1,'Integer','','MD_CAHPS_CG_18CL_CDS')
,(645,1,'Integer','','MD_CAHPS_CG_19CL_CDS')
,(646,1,'Integer','','MD_CAHPS_CG_20CL_CDS')
,(647,1,'Integer','','MD_CAHPS_CG_21CL_CDS')
,(648,1,'Integer','','MD_CAHPS_CG_22CL_CDS')
,(649,1,'Integer','','MD_CAHPS_CG_23CL_CDS')
,(650,1,'Integer','','MD_CAHPS_CG_24CL_CDS')
,(651,1,'Integer','','MD_CAHPS_CG_25CL_CDS')
,(652,1,'Integer','','MD_CAHPS_CG_26CL_CDS')
,(653,1,'Integer','','MD_CAHPS_CG_27CL_CDS')
,(654,1,'Integer','','MD_CAHPS_CG_28CL_CDS')
,(655,1,'Integer','','MD_CAHPS_CG_29CL_CDS')
,(656,1,'Integer','','MD_CAHPS_CG_34CL_CDS')
,(657,1,'Integer','','MD_CAHPS_CG_35CL_CDS')
,(658,1,'Integer','','MD_CAHPS_CG_37CL_CDS')
,(659,1,'Integer','','MD_CAHPS_CG_57CL_CDS')
,(660,1,'WChar','','SURVEY_TYPE')
,(661,1,'Integer','','COMBINED_COMFORT_CDS')
,(662,1,'Integer','','COMBINED_RATING_CDS')
,(663,1,'Integer','','COMBINED_TEAMWORK_CDS')
,(664,1,'Integer','','COMBINED_PRIVACY_CDS')
,(665,1,'Integer','','COMBINED_SENSITVITY_CDS')
,(666,1,'Integer','','LIV_STS_CDS')
,(667,1,'Integer','','ETHNCTY_CDS')
,(668,1,'Integer','','FIFTH_RACE_CDS')
,(669,1,'Integer','','PRMY_LANG_CDS')
,(670,1,'Integer','','PRMY_RACE_CDS')
,(671,1,'Integer','','SCND_RACE_CDS')
,(672,1,'Integer','','THRD_RACE_CDS')
,(673,1,'Integer','','FOURTH_RACE_CDS')
,(674,1,'Integer','','HI_LEVL_OF_EDU_CDS')
,(675,1,'Integer','','MRTL_STS_CDS')
,(676,1,'WChar','','MULTI_RACIAL')
,(677,1,'Integer','','PRMY_FNCL_CLASS_CDS')
,(678,1,'Integer','','RELG_CDS')
,(679,1,'Integer','','SEX_CDS')
,(680,1,'Integer','','SMKE_STS_CDS')
,(681,1,'Integer','','PRMY_PAYOR_CDS')
,(682,1,'BigInt','','AGE')
,(683,1,'WChar','','PSTL_CDS')
,(684,1,'WChar','','AVAIL_IND')
,(685,1,'BigInt','','PTNT_SK')
,(686,1,'BigInt','','AGE_AT_REG')
,(687,1,'WChar','','CARLN_EMP_HLTH_PLN_IND')
,(688,1,'WChar','','ACTIVE')
,(689,1,'BigInt','','PHRM_SK')
,(690,1,'WChar','','SYS_TYPE_DESC')
,(691,1,'Integer','','PHY_TYPE_CDS')
,(692,1,'WChar','','NPI_NUM')
,(693,1,'WChar','','DEA_NUM')
,(694,1,'WChar','','NCPDP_NUM')
,(695,1,'WChar','','FCLT_SPRT_IND')
,(696,1,'WChar','','RX_SUP_IND')
,(697,1,'BigInt','','ORDR_CLSS_CD')
,(698,1,'BigInt','','ORDR_MODE_CD')
,(699,1,'BigInt','','ORDR_PRTY_CD')
,(700,1,'BigInt','','ORDR_SET_CD')
,(701,1,'BigInt','','ORDR_SRC_CD')
,(702,1,'WChar','','STNDNG_STS_CD')
,(703,1,'BigInt','','ORDR_STS_CD')
,(704,1,'BigInt','','ORDR_TYP_CD')
,(705,1,'BigInt','','PRCDR_CD_SK')
,(706,1,'Integer','','PRCDR_CGY_ID')
,(707,1,'Integer','','REV_CD')
,(708,1,'WChar','','CD_TYPE_NM')
,(709,1,'Integer','','Program_ID')
,(710,1,'BigInt','','PROVDR_SK')
,(711,1,'Integer','','PROVDR_TYPE_CDS')
,(712,1,'Integer','','PRMY_DEPT_CDS')
,(713,1,'Integer','','MU_FLD_OF_PRACT_CDS')
,(714,1,'Integer','','RPTNG_STRC_CDS')
,(715,1,'WChar','','HSPTLST_IND')
,(716,1,'WChar','','CLNC_TITL_CDS')
,(717,1,'WChar','','RSDNT_IND')
,(718,1,'Integer','','PRMY_SPCLY_CDS')
,(719,1,'Integer','','INTN_EXT_CDS')
,(720,1,'WChar','','LDAP_USR')
,(721,1,'WChar','','PROVDR_ACTV_IND')
,(722,1,'Integer','','Section_CDS')
,(723,1,'BigInt','','CASE_SK')
,(724,1,'Integer','','PRMY_SRVC_CDS')
,(725,1,'Integer','','PRCDR_LEVL_CDS')
,(726,1,'Integer','','CL_CDS')
,(727,1,'Integer','','SRG_PTNT_CLASS_CDS')
,(728,1,'Integer','','PRMY_ANSTH_TYPE_CDS')
,(729,1,'Integer','','ANSTH_TYPE_CDS')
,(730,1,'Integer','','LTRLTY_CDS')
,(731,1,'Integer','','PRCDR_SITE_CDS')
,(732,1,'Integer','','SRVC_CDS')
,(733,1,'Integer','','WND_CLASS_CDS')
,(734,1,'Integer','','LOG_STS_CDS')
,(735,1,'Integer','','OR_SRVC_CDS')
,(736,1,'BigInt','','SPPLY_SK')
,(737,1,'WChar','','MNFCTR_CDS')
,(738,1,'Integer','','VND_CDS')
,(739,1,'WChar','','VND_CTLG_NBR')
,(740,1,'WChar','','IMPLNT_IND')
,(741,1,'BigInt','','TM_OF_DY_SK')
,(742,1,'Integer','','HR_OF_DY')
,(743,1,'Integer','','MN_OF_DY')
,(744,1,'Integer','','SCND_OF_DY')
,(745,1,'BigInt','','USR_SK')
,(746,1,'Integer','','SEX_CDS')
,(747,1,'WChar','','USER_NAME')
