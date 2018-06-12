SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InpatientDischargeDestinationDim](
	[DSCRG_DSTN_CDS] [int] IDENTITY(1,1) NOT NULL,
	[DSCRG_DSTN_DESC] [varchar](255) NULL,
 CONSTRAINT [PK_InpatientDischargeDestinationDim_DSCRG_DSTN_CDS] PRIMARY KEY CLUSTERED 
(
	[DSCRG_DSTN_CDS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
