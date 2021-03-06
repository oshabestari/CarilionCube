SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE FUNCTION [dbo].[ufn_FindPrimaryKey](
    @schema sysname
    ,@tablename sysname
    )
RETURNs sysname
AS 
begin

RETURN (
SELECT 
    --KU.table_name as TABLENAME
    KU.column_name as PRIMARYKEYCOLUMN
FROM 
    INFORMATION_SCHEMA.TABLE_CONSTRAINTS AS TC
    INNER JOIN INFORMATION_SCHEMA.KEY_COLUMN_USAGE AS KU
        ON TC.CONSTRAINT_TYPE = 'PRIMARY KEY' AND
            TC.CONSTRAINT_NAME = KU.CONSTRAINT_NAME
WHERE
    KU.table_schema = @schema        
    AND KU.table_name = @tablename
)

END
GO
