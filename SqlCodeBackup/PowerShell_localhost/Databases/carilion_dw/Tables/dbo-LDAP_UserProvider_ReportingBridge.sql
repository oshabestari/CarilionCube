SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LDAP_UserProvider_ReportingBridge](
	[LDAP_USR_PARENT] [varchar](50) NOT NULL,
	[LDAP_USR_CHILD] [varchar](50) NOT NULL,
 CONSTRAINT [PK_LDAP_UserProvider_ReportingBridge] PRIMARY KEY CLUSTERED 
(
	[LDAP_USR_PARENT] ASC,
	[LDAP_USR_CHILD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
