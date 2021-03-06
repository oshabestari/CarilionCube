USE [carilion_dw]
GO
set nocount on
GO

GO
/****** Object:  UserDefinedFunction [dbo].[ufn_BOMONTH]    Script Date: 6/21/2018 11:44:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ufn_BOMONTH]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[ufn_BOMONTH](@dt DATETIME)
returns datetime
as
BEGIN
    return DATEADD(dd, -DAY(@dt) + 1, @dt)
end


' 
END
GO
