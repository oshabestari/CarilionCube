truncate table [dbo].[tblVS_dim_hierarchies]
insert into [dbo].[tblVS_dim_hierarchies]([dim_hierarchy_id], [dim_table_id], [sort_order], [ID], [Name]) values
(1,8,1,'Hierarchy','Year -  Quarter -  Month -   Date')
,(2,8,1,'Hierarchy 1','Fiscal Year - Quarter - Month - Date')
,(3,9,1,'Hierarchy','State - City - Department  Hierarchy')
