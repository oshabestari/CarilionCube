SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LDAP_Dim](
	[LDAP_USR] [varchar](50) NOT NULL,
 CONSTRAINT [PK_LDAP_Dim] PRIMARY KEY CLUSTERED 
(
	[LDAP_USR] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
