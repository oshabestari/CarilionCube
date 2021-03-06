SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc util.usp_CreateTriggerOn_tblGeneratedMeasures
as


declare @sql nvarchar(max) = 
'create trigger trig_tblGeneratedMeasures_RefreshModifiedDate on dbo.tblGeneratedMeasures
after update
as
begin
    set nocount on
    update t
    set 
        ModifiedDate = GETDATE()
    from
        dbo.tblGeneratedMeasures t
        join inserted i
            on i.MeasuresId = t.MeasuresId
end'


IF NOT EXISTS (SELECT * FROM sys.objects WHERE type = 'TR' AND name = 'trig_tblGeneratedMeasures_RefreshModifiedDate')
begin
    exec sp_executesql @sql
end

GO
