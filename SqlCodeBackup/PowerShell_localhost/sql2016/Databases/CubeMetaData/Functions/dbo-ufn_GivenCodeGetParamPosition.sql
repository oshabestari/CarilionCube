SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE FUNCTION [dbo].[ufn_GivenCodeGetParamPosition](
    @code nchar
    )
RETURNS int
WITH SCHEMABINDING
AS
BEGIN
    -- X  Y  Z  A  B  C  ...  U  V  W
    -- 0  1  2  3  4  5       23 24 25
    return (ascii(upper(@code)) + 16) % 26
END
GO
