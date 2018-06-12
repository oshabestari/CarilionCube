SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DepartmentDim](
	[DEPT_SK] [bigint] IDENTITY(1,1) NOT NULL,
	[SRC_DEPT_ID] [varchar](255) NULL,
	[DEPT_NM] [varchar](250) NULL,
	[DEPT_ABBR] [varchar](20) NULL,
	[ADDR] [varchar](100) NULL,
	[CITY] [varchar](30) NULL,
	[ST_PRV_CDS] [int] NULL,
	[ST_PRV_NM] [varchar](255) NULL,
	[ST_PRV_ABBR] [varchar](50) NULL,
	[PSTL_CDS] [varchar](5) NULL,
	[PH_NUM] [varchar](80) NULL,
	[RSTCT_IND] [varchar](3) NULL,
	[SPCLY_CDS] [int] NULL,
	[SPCLY_NM] [varchar](255) NULL,
	[PRFSNL_BILLNG_CL_CDS] [int] NULL,
	[PRFSNL_BILLNG_CL_NM] [varchar](255) NULL,
	[LO_CDS] [int] NULL,
	[LO_NM] [varchar](255) NULL,
	[SRVC_AREA_CDS] [int] NULL,
	[SRVC_AREA_NM] [varchar](255) NULL,
	[ALT_SRVC_AREA_CDS] [int] NULL,
	[ALT_SRVC_AREA_NM] [varchar](255) NULL,
	[ICU_DEPT_IND] [varchar](3) NULL,
	[PCU_DEPT_IND] [varchar](3) NULL,
	[FCM_Region_ID] [int] NULL,
	[FCM_Region_Name] [varchar](100) NULL,
	[LOC_TYPE_CDS] [int] NULL,
	[LOC_TYPE_DESC] [varchar](255) NULL,
 CONSTRAINT [PK_DepartmentDim_DEPT_SK] PRIMARY KEY CLUSTERED 
(
	[DEPT_SK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
