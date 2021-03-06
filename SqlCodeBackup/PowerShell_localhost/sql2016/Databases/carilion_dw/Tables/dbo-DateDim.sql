SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DateDim](
	[CLNDR_DT] [datetime] NOT NULL,
	[CLNDR_SK] [bigint] NOT NULL,
	[CLNDR_DT_EPOCH] [varchar](30) NULL,
	[CLNDR_DT_FL_NM] [varchar](30) NULL,
	[CLNDR_DT_ABBR] [varchar](150) NULL,
	[CLNDR_CACHE_DT] [int] NULL,
	[YR_NUM] [int] NULL,
	[MTH_OF_YR_NUM] [smallint] NULL,
	[MTH_OF_YR_ABBR] [varchar](150) NULL,
	[MTH_OF_YR_NM] [varchar](30) NULL,
	[YR_AND_MTH_NUM] [int] NULL,
	[YR_AND_MTH_ABBR] [varchar](150) NULL,
	[YR_AND_MTH_NM] [varchar](30) NULL,
	[QTR_OF_YR_NUM] [smallint] NULL,
	[QTR_OF_YR_ABBR] [varchar](150) NULL,
	[YR_AND_QTR_NUM] [int] NULL,
	[YR_AND_QTR_ABBR] [varchar](150) NULL,
	[DY_OF_YR_NUM] [smallint] NULL,
	[DY_OF_MTH_NUM] [smallint] NULL,
	[DY_OF_WK_NUM] [smallint] NULL,
	[DY_OF_WK_ABBR] [varchar](150) NULL,
	[DY_OF_WK_NM] [varchar](30) NULL,
	[WK_OF_YR_NUM] [smallint] NULL,
	[PR_YR_NUM] [int] NULL,
	[PR_MTH_OF_YR_NUM] [smallint] NULL,
	[PR_MTH_OF_YR_ABBR] [varchar](150) NULL,
	[PR_MTH_OF_YR_NM] [varchar](30) NULL,
	[PR_YR_AND_MTH_NUM] [int] NULL,
	[PR_YR_AND_MTH_ABBR] [varchar](150) NULL,
	[PR_YR_AND_MTH_NM] [varchar](30) NULL,
	[PR_QTR_OF_YR_NUM] [smallint] NULL,
	[PR_QTR_OF_YR_ABBR] [varchar](150) NULL,
	[PR_YR_AND_QTR_NUM] [int] NULL,
	[PR_YR_AND_QTR_ABBR] [varchar](150) NULL,
	[FSCL_YR_NUM] [int] NULL,
	[FSCL_YR_BGN_DT] [datetime] NULL,
	[FSCL_YR_END_DT] [datetime] NULL,
	[FSCL_QTR_NUM] [smallint] NULL,
	[FSCL_QTR_ABBR] [varchar](150) NULL,
	[FSCL_QTR_BGN_DT] [datetime] NULL,
	[FSCL_QTR_END_DT] [datetime] NULL,
	[FSCL_MTH_NUM] [smallint] NULL,
 CONSTRAINT [PK_DateDim_CLNDR_DT] PRIMARY KEY CLUSTERED 
(
	[CLNDR_DT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
