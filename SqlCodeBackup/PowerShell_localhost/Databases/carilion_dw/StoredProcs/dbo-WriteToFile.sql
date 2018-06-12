SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[WriteToFile]
            @File        NVARCHAR(max),
            @Text        NVARCHAR(max)
AS 
BEGIN 

DECLARE @OLE            INT 
DECLARE @FileID         INT 


EXECUTE sp_OACreate 'Scripting.FileSystemObject', @OLE OUT 
EXECUTE sp_OAMethod @OLE, 'OpenTextFile', @FileID OUT, @File, 8, 1 
EXECUTE sp_OAMethod @FileID, 'WriteLine', Null, @Text
EXECUTE sp_OADestroy @FileID 
EXECUTE sp_OADestroy @OLE 

 

END 
GO
