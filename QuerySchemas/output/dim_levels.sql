truncate table [dbo].[tblVS_dim_levels]

insert into [dbo].[tblVS_dim_levels]([dim_hierarchy_id], [sort_order], [ID], [Name], [ColumnName]) values
(1,1,'Year','Year','YR NUM')
,(1,1,'Quarter','Quarter','YR AND QTR NUM')
,(1,1,'Month - Year','Month','YR AND MTH NUM')
,(1,1,'Date','Date','CLNDR DT')
,(2,1,'Fiscal Year','Fiscal Year','FSCL YR NUM')
,(2,1,'Fiscal Quarter','Fiscal Quarter','FSCL QTR NUM')
,(2,1,'Fiscal Month','Fiscal Month','FSCL MTH NUM')
,(2,1,'Date','Date','CLNDR DT')
,(3,1,'State-Province','State-Province','ST PRV CDS')
,(3,1,'City','City','CITY')
,(3,1,'Department - Name','Department','DEPT SK')
