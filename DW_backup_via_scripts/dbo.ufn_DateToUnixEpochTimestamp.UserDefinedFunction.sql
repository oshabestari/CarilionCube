USE [carilion_dw]
GO
set nocount on
GO

GO
/****** Object:  UserDefinedFunction [dbo].[ufn_DateToUnixEpochTimestamp]    Script Date: 6/21/2018 11:44:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ufn_DateToUnixEpochTimestamp]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE function [dbo].[ufn_DateToUnixEpochTimestamp](
    @dt DATETIME
    )
returns bigint
as
BEGIN
-- from https://www.epochconverter.com/
-- expected value: 915148800
--  SELECT [dbo].[date_to_unix_epoch_timestamp](''January 1, 1999 12:00:00 AM'')
-- expected value: 3472675200
--  SELECT [dbo].[date_to_unix_epoch_timestamp](''1/17/2080 0:00 AM'')

    RETURN convert(bigint, DATEDIFF_BIG(ss,  ''01-01-1970 00:00:00'', @dt))
END



' 
END
GO
