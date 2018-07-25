set nocount on



declare @guid uniqueidentifier = '0217188E-FB7F-49CD-8A43-8DCFC30B58A6'
select MeasureDefinition from dbo.tblGeneratedMeasures
where GroupingGuid = @guid
and measure_name = 'Diagnosis - Encounter - Unique Count'




declare @guid uniqueidentifier = '0217188E-FB7F-49CD-8A43-8DCFC30B58A6'
select MeasureDefinition as [--Measure definition] from dbo.tblGeneratedMeasures
where GroupingGuid = @guid
and measure_name like '%diag%'
order by 1



declare @guid uniqueidentifier = '8456583C-3777-4C21-A2B1-7F8B1AB5BCD1'
select MeasureDefinition as [--Measure definition] from dbo.tblGeneratedMeasures where GroupingGuid = @guid
and MeasureDefinition like '%encounter%'


declare @guid uniqueidentifier = '1BAA3ED8-28AD-43D5-95DC-44FF873B2030'
select MeasureDefinition as [--Measure definition] from dbo.tblGeneratedMeasures where GroupingGuid = @guid
and MeasureDefinition like '%opioid%'
and MeasureDefinition like '%date - enco%'



-- truncate table dbo.tblGeneratedMeasures


