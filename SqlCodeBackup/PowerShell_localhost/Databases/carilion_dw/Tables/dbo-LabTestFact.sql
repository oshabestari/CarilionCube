SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LabTestFact](
	[LAB_TST_FACT_SK] [bigint] NOT NULL,
	[SRC_TST_ID] [varchar](255) NULL,
	[LAB_TST_SK] [bigint] NULL,
	[PTNT_SK] [bigint] NULL,
	[AUTH_PROVDR_SK] [bigint] NULL,
	[PRCDR_CD_SK] [bigint] NULL,
	[ENCNT_SK] [bigint] NULL,
	[RSULT_LAB_SK] [bigint] NULL,
	[ORDRD_DT] [datetime] NULL,
	[ORDRD_TS_SK] [bigint] NULL,
	[CLCT_USR_SK] [bigint] NULL,
	[CLCT_DEPT_SK] [bigint] NULL,
	[CLCT_DT] [datetime] NULL,
	[CLCT_TS_SK] [bigint] NULL,
	[SCHED_CLCT_DT] [datetime] NULL,
	[SCHED_CLCT_TS_SK] [bigint] NULL,
	[FRST_FNL_VRFY_DT] [datetime] NULL,
	[FRST_FNL_VRFY_USR_SK] [bigint] NULL,
	[FRST_VRFY_DT] [datetime] NULL,
	[FRST_VRFY_USR_SK] [bigint] NULL,
	[LST_FNL_VRFY_DT] [datetime] NULL,
	[LST_FNL_VRFY_USR_SK] [bigint] NULL,
	[LST_VRFY_DT] [datetime] NULL,
	[FRST_CORR_DT] [datetime] NULL,
	[FRST_CORR_USR_SK] [bigint] NULL,
	[LST_CORR_DT] [datetime] NULL,
	[LST_CORR_USR_SK] [bigint] NULL,
	[COLL_TM_MNT] [numeric](18, 2) NULL,
 CONSTRAINT [PK_LabTestFact] PRIMARY KEY CLUSTERED 
(
	[LAB_TST_FACT_SK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
