SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[ufn_StringToArray]
(	
	@txt nvarchar(max)
)
RETURNS TABLE 
WITH SCHEMABINDING
AS
RETURN 
(
select
    t.N as pos
    ,substring(@txt, t.N, 1) as _char
from
    util.Tally t
where
    t.N between 1 and len(@txt)
)
GO
