EXEC master.dbo.sp_addlinkedserver @server = N'SSAS_LH_ANALYTICS', @srvproduct=N'', @provider=N'MSOLAP', @datasrc=N'localhost\SSAS_DIM', @catalog=N'Analytics'
 /* For security reasons the linked server remote logins password is changed with ######## */
EXEC master.dbo.sp_addlinkedsrvlogin @rmtsrvname=N'SSAS_LH_ANALYTICS',@useself=N'True',@locallogin=NULL,@rmtuser=NULL,@rmtpassword=NULL
GO
EXEC master.dbo.sp_serveroption @server=N'SSAS_LH_ANALYTICS', @optname=N'collation compatible', @optvalue=N'false'
GO
EXEC master.dbo.sp_serveroption @server=N'SSAS_LH_ANALYTICS', @optname=N'data access', @optvalue=N'true'
GO
EXEC master.dbo.sp_serveroption @server=N'SSAS_LH_ANALYTICS', @optname=N'dist', @optvalue=N'false'
GO
EXEC master.dbo.sp_serveroption @server=N'SSAS_LH_ANALYTICS', @optname=N'pub', @optvalue=N'false'
GO
EXEC master.dbo.sp_serveroption @server=N'SSAS_LH_ANALYTICS', @optname=N'rpc', @optvalue=N'false'
GO
EXEC master.dbo.sp_serveroption @server=N'SSAS_LH_ANALYTICS', @optname=N'rpc out', @optvalue=N'false'
GO
EXEC master.dbo.sp_serveroption @server=N'SSAS_LH_ANALYTICS', @optname=N'sub', @optvalue=N'false'
GO
EXEC master.dbo.sp_serveroption @server=N'SSAS_LH_ANALYTICS', @optname=N'connect timeout', @optvalue=N'0'
GO
EXEC master.dbo.sp_serveroption @server=N'SSAS_LH_ANALYTICS', @optname=N'collation name', @optvalue=null
GO
EXEC master.dbo.sp_serveroption @server=N'SSAS_LH_ANALYTICS', @optname=N'lazy schema validation', @optvalue=N'false'
GO
EXEC master.dbo.sp_serveroption @server=N'SSAS_LH_ANALYTICS', @optname=N'query timeout', @optvalue=N'0'
GO
EXEC master.dbo.sp_serveroption @server=N'SSAS_LH_ANALYTICS', @optname=N'use remote collation', @optvalue=N'true'
GO
EXEC master.dbo.sp_serveroption @server=N'SSAS_LH_ANALYTICS', @optname=N'remote proc transaction promotion', @optvalue=N'true'
GO
