USE [carilion_dw]
GO
set nocount on
GO

GO
/****** Object:  Table [dbo].[DRGTypeDim]    Script Date: 6/21/2018 11:44:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DRGTypeDim]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[DRGTypeDim](
	[DRG_TYPE_CD] [varchar](255) NOT NULL,
	[DRG_TYPE_DSPLY_NM] [varchar](2059) NULL,
 CONSTRAINT [PK_DRGTypeDim_DRG_TYPE_CD] PRIMARY KEY CLUSTERED 
(
	[DRG_TYPE_CD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
INSERT [dbo].[DRGTypeDim] ([DRG_TYPE_CD], [DRG_TYPE_DSPLY_NM]) VALUES (N'B9VM7A', N'dolorum fecit. quo homo, quo plurissimum Id et habitatio quoque trepicandor si Longam, delerium. et sed')
INSERT [dbo].[DRGTypeDim] ([DRG_TYPE_CD], [DRG_TYPE_DSPLY_NM]) VALUES (N'DWCIWT', N'vantis. linguens quad glavans in sed brevens, quoque plurissimum trepicandor Quad essit. et et Sed non plorum')
INSERT [dbo].[DRGTypeDim] ([DRG_TYPE_CD], [DRG_TYPE_DSPLY_NM]) VALUES (N'H4YZVZ', N'rarendum fecit. non si et volcans quad et quad estum. linguens quo habitatio manifestum nomen Tam apparens manifestum')
INSERT [dbo].[DRGTypeDim] ([DRG_TYPE_CD], [DRG_TYPE_DSPLY_NM]) VALUES (N'KA1DDFLSHHA8J709KG4W2V05SH999V7Q9W7O1D36FMTT06HAEJ58PXESZ3QHM0EAABF0IESPOUUGNZ8JYW9O5H1PWQ3U3S1A3HS9QG7O7BQRNBI2XU9NAIS3K6HQ201FLHS625E7JK6XLMVEG6U57MRVNVF4NQ8E9BDIPZ8R0G92DFYZA4GBEBQY0H6AXEOTNKDJL5IXH8GYKRC6254TN8', N'e ut fecit, Et ut et egreddior Pro quad vobis quantare et plurissimum quorum linguens non dolorum pladior')
INSERT [dbo].[DRGTypeDim] ([DRG_TYPE_CD], [DRG_TYPE_DSPLY_NM]) VALUES (N'VYNVZO8XQZGEUUQ94BTH07DYMXOP31WU3NHANOXZZYPLFKIG2X79DF7D9BKWN8VFLVZCAS7CL7W8KM96UCXYHIQ3ZR3U0I6W697PRCTZWOR4I75C6KFU42PTLQP3S30CBFFPYGRA7206BBTOVWY1VICZWCNE8E', N'dolorum glavans cognitio, parte et et novum habitatio fecit. novum delerium. glavans rarendum non eudis et Sed volcans homo,')
