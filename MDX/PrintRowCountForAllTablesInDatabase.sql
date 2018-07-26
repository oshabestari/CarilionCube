

declare @txt nvarchar(max) =
'declare @cnt int = (select count(*) from ?)

print concat(''table: '', ''?'', '' cnt: '', @cnt)
'

exec sp_MSforeachtable @txt

