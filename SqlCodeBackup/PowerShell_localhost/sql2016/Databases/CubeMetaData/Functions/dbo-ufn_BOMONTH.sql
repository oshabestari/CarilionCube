SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[ufn_BOMONTH](@dt DATETIME)
returns datetime
WITH SCHEMABINDING
as
BEGIN
    return DATEADD(dd, -DAY(@dt) + 1, @dt)
end
GO
