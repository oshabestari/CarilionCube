SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[ufn_DateToUnixEpochTimestamp](
    @dt DATETIME
    )
returns bigint
as
BEGIN
-- from https://www.epochconverter.com/
-- expected value: 915148800
--  SELECT [dbo].[date_to_unix_epoch_timestamp]('January 1, 1999 12:00:00 AM')
-- expected value: 3472675200
--  SELECT [dbo].[date_to_unix_epoch_timestamp]('1/17/2080 0:00 AM')

    RETURN convert(bigint, DATEDIFF_BIG(ss,  '01-01-1970 00:00:00', @dt))
END



GO
