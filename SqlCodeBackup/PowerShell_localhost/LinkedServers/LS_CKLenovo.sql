EXEC master.dbo.sp_addlinkedserver @server = N'LS_CKLenovo', @srvproduct=N'', @provider=N'SQLNCLI', @datasrc=N'cklenovo'
 /* For security reasons the linked server remote logins password is changed with ######## */
EXEC master.dbo.sp_addlinkedsrvlogin @rmtsrvname=N'LS_CKLenovo',@useself=N'True',@locallogin=NULL,@rmtuser=NULL,@rmtpassword=NULL
GO
EXEC master.dbo.sp_serveroption @server=N'LS_CKLenovo', @optname=N'collation compatible', @optvalue=N'false'
GO
EXEC master.dbo.sp_serveroption @server=N'LS_CKLenovo', @optname=N'data access', @optvalue=N'true'
GO
EXEC master.dbo.sp_serveroption @server=N'LS_CKLenovo', @optname=N'dist', @optvalue=N'false'
GO
EXEC master.dbo.sp_serveroption @server=N'LS_CKLenovo', @optname=N'pub', @optvalue=N'false'
GO
EXEC master.dbo.sp_serveroption @server=N'LS_CKLenovo', @optname=N'rpc', @optvalue=N'false'
GO
EXEC master.dbo.sp_serveroption @server=N'LS_CKLenovo', @optname=N'rpc out', @optvalue=N'false'
GO
EXEC master.dbo.sp_serveroption @server=N'LS_CKLenovo', @optname=N'sub', @optvalue=N'false'
GO
EXEC master.dbo.sp_serveroption @server=N'LS_CKLenovo', @optname=N'connect timeout', @optvalue=N'0'
GO
EXEC master.dbo.sp_serveroption @server=N'LS_CKLenovo', @optname=N'collation name', @optvalue=null
GO
EXEC master.dbo.sp_serveroption @server=N'LS_CKLenovo', @optname=N'lazy schema validation', @optvalue=N'false'
GO
EXEC master.dbo.sp_serveroption @server=N'LS_CKLenovo', @optname=N'query timeout', @optvalue=N'0'
GO
EXEC master.dbo.sp_serveroption @server=N'LS_CKLenovo', @optname=N'use remote collation', @optvalue=N'true'
GO
EXEC master.dbo.sp_serveroption @server=N'LS_CKLenovo', @optname=N'remote proc transaction promotion', @optvalue=N'true'
GO
