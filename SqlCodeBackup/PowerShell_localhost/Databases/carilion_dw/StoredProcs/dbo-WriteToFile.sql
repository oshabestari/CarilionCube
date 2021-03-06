SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[WriteToFile]
    @File                           NVARCHAR(max),
    @Text                           NVARCHAR(max),
    @iomode                         int = 2, -- (1)=ForReading, (2)=ForWriting (8)=ForAppending
    @Create_TRUE_or_Append_FALSE    bit = 1, -- (TRUE)=create file  (FALSE)=append file
    @format                         int = 0  -- (-2)=system default. (-1)=Unicode. (0)=ASCII.
AS 
BEGIN 
/*

exec dbo.WriteToFile 'c:\_car\test.txt', 'foo'

*/

/*
-- enable OLE automation
sp_configure 'show advanced options', 1;  
GO  
RECONFIGURE;  
GO  
sp_configure 'Ole Automation Procedures', 1;  
GO  
RECONFIGURE;  
GO
*/

/*
https://msdn.microsoft.com/en-us/vba/language-reference-vba/articles/opentextfile-method?f=255&MSPPError=-2147217396

Settings The iomode argument can have either of the following settings:
Constant	    Value	Description
ForReading	    1	    Open a file for reading only. You can't write to this file.
ForWriting      2       Open a file and overwrite content.
ForAppending	8	    Open a file and append text.

The format argument can have any of the following settings:
Constant	        Value	Description
TristateUseDefault	-2	    Opens the file using the system default.
TristateTrue	    -1	    Opens the file as Unicode.
TristateFalse	    0	    Opens the file as ASCII.
*/

if @iomode not in (1, 2, 8) raiserror('@iomode must be in (1,2,8)', 18, 0)
if @format not in (0, -1, -2) raiserror('format must be (0,-1,-2)', 18, 0)


DECLARE @OLE            INT 
DECLARE @FileID         INT 


EXECUTE sp_OACreate 'Scripting.FileSystemObject', @OLE OUT 
EXECUTE sp_OAMethod @OLE, 'OpenTextFile', @FileID OUT, @File, @iomode, @Create_TRUE_or_Append_FALSE, @format
EXECUTE sp_OAMethod @FileID, 'WriteLine', Null, @Text
EXECUTE sp_OADestroy @FileID 
EXECUTE sp_OADestroy @OLE 

 

END 
GO
