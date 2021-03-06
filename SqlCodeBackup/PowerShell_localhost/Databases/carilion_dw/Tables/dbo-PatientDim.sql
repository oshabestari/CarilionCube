SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PatientDim](
	[MPI_NUM] [varchar](80) NULL,
	[BRTH_TS] [datetime] NULL,
	[MRTL_STS_CDS] [int] NULL,
	[MRTL_STS_DESC] [varchar](255) NULL,
	[CITY] [varchar](30) NULL,
	[CNTY_CDS] [int] NULL,
	[CNTY_DESC] [varchar](255) NULL,
	[ST_PRV_CDS] [varchar](50) NULL,
	[ST_PRV_NM] [varchar](255) NULL,
	[PSTL_CDS] [varchar](5) NULL,
	[CNTRY_CDS] [int] NULL,
	[CNTRY_NM] [varchar](50) NULL,
	[HME_PH_AREA_CDS] [varchar](8) NULL,
	[HME_PH_EXCHNG_CDS] [varchar](3) NULL,
	[WRK_PH_AREA_CDS] [varchar](8) NULL,
	[WRK_PH_EXCHNG_CDS] [varchar](3) NULL,
	[LIV_STS_DESC] [varchar](254) NULL,
	[DTH_TS] [datetime] NULL,
	[SEX_CDS] [int] NULL,
	[SEX_DESC] [varchar](254) NULL,
	[PRMY_LANG_CDS] [int] NULL,
	[PRMY_LANG_DESC] [varchar](254) NULL,
	[PRMY_RACE_CDS] [int] NULL,
	[PRMY_RACE_DESC] [varchar](254) NULL,
	[SCND_RACE_CDS] [int] NULL,
	[SCND_RACE_DESC] [varchar](255) NULL,
	[THRD_RACE_CDS] [int] NULL,
	[THRD_RACE_DESC] [varchar](255) NULL,
	[FOURTH_RACE_CDS] [int] NULL,
	[FOURTH_RACE_DESC] [varchar](255) NULL,
	[FIFTH_RACE_CDS] [int] NULL,
	[FIFTH_RACE_DESC] [varchar](255) NULL,
	[ETHNCTY_CDS] [int] NULL,
	[ETHNCTY_DESC] [varchar](255) NULL,
	[RELG_CDS] [int] NULL,
	[RELG_DESC] [varchar](255) NULL,
	[SMKE_STS_CDS] [int] NULL,
	[SMKE_STS_DESC] [varchar](255) NULL,
	[HI_LEVL_OF_EDU_CDS] [int] NULL,
	[HI_LEVL_OF_EDU_DESC] [varchar](255) NULL,
	[PRMY_PAYOR_NM] [varchar](254) NULL,
	[PRMY_FNCL_CLASS_CDS] [int] NULL,
	[PRMY_FNCL_CLASS_DESC] [varchar](255) NULL,
	[MTHR_PTNT_BABY_NUM] [varchar](80) NULL,
	[AGE] [int] NULL,
	[REG_TS] [datetime] NULL,
	[AGE_LOG] [float] NULL,
	[AVAIL_IND] [varchar](3) NULL,
	[AGE_FACT] [int] NULL,
	[PRMY_PAYOR_CDS] [int] NULL,
	[PTNT_SK] [bigint] IDENTITY(1,1) NOT NULL,
	[SRC_PTNT_ID] [varchar](255) NULL,
	[AGE_AT_REG] [bigint] NULL,
	[MULTI_RACIAL] [varchar](3) NULL,
	[CRNT_PCP_PROVDR_SK] [bigint] NULL,
	[CARLN_EMP_HLTH_PLN_IND] [varchar](3) NULL,
	[LIV_STS_CDS] [int] NULL,
	[ACTIVE] [varchar](3) NULL,
 CONSTRAINT [PK_PatientDim_PTNT_SK] PRIMARY KEY CLUSTERED 
(
	[PTNT_SK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PatientDim]  WITH CHECK ADD  CONSTRAINT [PatientDim-ProviderDim] FOREIGN KEY([CRNT_PCP_PROVDR_SK])
REFERENCES [dbo].[ProviderDim] ([PROVDR_SK])
GO
ALTER TABLE [dbo].[PatientDim] CHECK CONSTRAINT [PatientDim-ProviderDim]
GO
ALTER TABLE [dbo].[PatientDim]  WITH CHECK ADD  CONSTRAINT [PersonDim-DateDim] FOREIGN KEY([BRTH_TS])
REFERENCES [dbo].[DateDim] ([CLNDR_DT])
GO
ALTER TABLE [dbo].[PatientDim] CHECK CONSTRAINT [PersonDim-DateDim]
GO
ALTER TABLE [dbo].[PatientDim]  WITH CHECK ADD  CONSTRAINT [PersonDim-DateDim2] FOREIGN KEY([REG_TS])
REFERENCES [dbo].[DateDim] ([CLNDR_DT])
GO
ALTER TABLE [dbo].[PatientDim] CHECK CONSTRAINT [PersonDim-DateDim2]
GO
