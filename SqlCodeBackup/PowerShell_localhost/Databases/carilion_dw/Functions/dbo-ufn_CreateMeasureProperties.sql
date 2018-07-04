SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create function dbo.ufn_CreateMeasureProperties(
     @VISIBLE                  bit       
    ,@DISPLAY_FOLDER           varchar(max)
    ,@FORMAT_STRING            varchar(max)
    ,@ASSOCIATED_MEASURE_GROUP varchar(max)
    ,@CAPTION                  varchar(max)
    ,@SOLVE_ORDER              int
    )
returns varchar(max)
as
begin

return concat(', ', 
    concat('VISIBLE=', @VISIBLE),
    'DISPLAY_FOLDER=' + @DISPLAY_FOLDER,
    'FORMAT_STRING=' + @FORMAT_STRING,
    'ASSOCIATED_MEASURE_GROUP=' + @ASSOCIATED_MEASURE_GROUP,
    'CAPTION=' + @CAPTION,
    'SOLVE_ORDER' + cast(@SOLVE_ORDER as varchar(10)) 
    )

end
GO
