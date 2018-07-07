SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE proc [dbo].[usp_MeasureGenerator__WriteToFile]
as

set nocount on


drop table if exists #t


SELECT distinct
    MeasureName
    ,IsScoped
    ,Scoped_IsCreateMeasure
    ,Scoped_IsSubcubeExpression
    ,MeasureDefinition
into #t
FROM 
    [dbo].[tblGeneratedMeasures] gm 
where
    gm.IsDimensionAgnostic = 1

union

SELECT distinct
    MeasureName
    ,IsScoped
    ,Scoped_IsCreateMeasure
    ,Scoped_IsSubcubeExpression
    ,MeasureDefinition
FROM 
    [dbo].[tblGeneratedMeasures] gm 
    join dbo.tblGeneratedMeasures_Select_DimensionByMeasureGroup s
        on s.dimension_unique_name = gm.dimension_unique_name
            and s.measuregroup_name = gm.measuregroup_name
where
    gm.IsDimensionAgnostic = 0
    and gm.hierarchy_name like '%fiscal%'
    -- choose between the SCOPED version or the normal version
    and (
        (
            gm.GroupingName not in ('Difference From Same Period Previous Year', 'Growth from Same Period Previous Year')
        )
        or (
            gm.GroupingName in ('Difference From Same Period Previous Year', 'Growth from Same Period Previous Year')
            and gm.IsScoped = 0
        )
    )

-- add in any missing scoped measure declarations
insert into #t(MeasureName, IsScoped, Scoped_IsCreateMeasure, Scoped_IsSubcubeExpression, MeasureDefinition)
select
     gm.MeasureName
    ,gm.IsScoped 
    ,gm.Scoped_IsCreateMeasure
    ,gm.Scoped_IsSubcubeExpression
    ,gm.MeasureDefinition
from
    [dbo].[tblGeneratedMeasures] gm 
    join (
        select distinct 
            t.MeasureName
        from    
            #t t
        where
            t.IsScoped = 1
    ) mn
        on gm.MeasureName = mn.MeasureName
    left join (
        select distinct 
            t.MeasureName
        from    
            #t t
        where
            t.IsScoped = 1
            and t.Scoped_IsCreateMeasure = 1
    ) missing
        on gm.MeasureName = missing.MeasureName

where   
    gm.IsScoped = 1
    and gm.Scoped_IsCreateMeasure = 1
    and missing.MeasureName is null





select
    MeasureDefinition as [-- Start procedurally generated measures]
    --,MeasureName
    --,IsScoped 
    --,Scoped_IsCreateMeasure -- make sure the measure definition comes first
    --,Scoped_IsSubcubeExpression
from
    #t
order by
    MeasureName
    ,IsScoped 
    ,Scoped_IsCreateMeasure desc -- make sure the measure definition comes first
    ,Scoped_IsSubcubeExpression
    ,MeasureDefinition




GO
