USE [carilion_dw]
GO
set nocount on
GO

GO
/****** Object:  StoredProcedure [dbo].[WriteToFile]    Script Date: 6/21/2018 11:44:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WriteToFile]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[WriteToFile] AS' 
END
GO


ALTER PROCEDURE [dbo].[WriteToFile]
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
