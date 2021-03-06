USE [carilion_dw]
GO
set nocount on
GO

GO
/****** Object:  UserDefinedFunction [dbo].[ufn_FindPrimaryKey]    Script Date: 6/21/2018 11:44:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ufn_FindPrimaryKey]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'

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
        ON TC.CONSTRAINT_TYPE = ''PRIMARY KEY'' AND
            TC.CONSTRAINT_NAME = KU.CONSTRAINT_NAME
WHERE
    KU.table_schema = @schema        
    AND KU.table_name = @tablename
)

END
' 
END
GO
