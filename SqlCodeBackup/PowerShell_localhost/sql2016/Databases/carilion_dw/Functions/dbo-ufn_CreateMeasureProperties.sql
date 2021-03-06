SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE function [dbo].[ufn_CreateMeasureProperties](
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

declare @txt varchar(max) = ''

set @txt = @txt + iif(@VISIBLE is null, '', concat(', VISIBLE=', @VISIBLE))
set @txt = @txt + iif(@DISPLAY_FOLDER is null, '', concat(', DISPLAY_FOLDER=''', @DISPLAY_FOLDER, ''''))
set @txt = @txt + iif(@FORMAT_STRING is null, '', concat(', FORMAT_STRING=''', @FORMAT_STRING, ''''))
set @txt = @txt + iif(@ASSOCIATED_MEASURE_GROUP is null, '', concat(', ASSOCIATED_MEASURE_GROUP=''', @ASSOCIATED_MEASURE_GROUP, ''''))
set @txt = @txt + iif(@CAPTION is null, '', concat(', CAPTION=''', @CAPTION, ''''))
set @txt = @txt + iif(@SOLVE_ORDER is null, '', concat(', SOLVE_ORDER=', @SOLVE_ORDER))

if LEN(@txt) > 0
    set @txt = STUFF(@txt, 1, 2, '')

return @txt

end

/*


select [dbo].[ufn_CreateMeasureProperties](
     /* @VISIBLE                  */ 1
    ,/* @DISPLAY_FOLDER           */ null
    ,/* @FORMAT_STRING            */ null
    ,/* @ASSOCIATED_MEASURE_GROUP */ 'test'
    ,/* @CAPTION                  */ null
    ,/* @SOLVE_ORDER              */ null
    )

select [dbo].[ufn_CreateMeasureProperties](
     /* @VISIBLE                  */ 1
    ,/* @DISPLAY_FOLDER           */ 'disp'
    ,/* @FORMAT_STRING            */ 'fmt'
    ,/* @ASSOCIATED_MEASURE_GROUP */ 'mg'
    ,/* @CAPTION                  */ 'cap'
    ,/* @SOLVE_ORDER              */ 2
    )


*/
GO
