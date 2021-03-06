SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE proc [dbo].[usp_MeasureGenerator__WriteToFile]
as

set nocount on


drop table if exists #t


SELECT
     MeasuresId
    ,MeasureName
    ,IsScoped
    ,Scoped_IsCreateMeasure
    ,Scoped_IsSubcubeExpression
    ,MeasureDefinition
into #t
FROM 
    dbo.tblGeneratedMeasures gm 
where
    gm.IsDimensionAgnostic = 1
    and gm.GroupingName not in ('Rank')

union

SELECT
     MeasuresId
    ,MeasureName
    ,IsScoped
    ,Scoped_IsCreateMeasure
    ,Scoped_IsSubcubeExpression
    ,MeasureDefinition
FROM 
    dbo.tblGeneratedMeasures gm 
    join dbo.tblGeneratedMeasures_Select_DimensionByMeasureGroup s
        on s.dimension_unique_name = gm.dimension_unique_name
            and s.measuregroup_name = gm.measuregroup_name
where
    gm.IsDimensionAgnostic = 0
    and gm.hierarchy_name like '%fiscal%'
    -- choose between the SCOPED version or the normal version by using IsScoped
    -- "Difference" and "Growth" have SCOPED and normal versions.
    and (
        (
            gm.GroupingName not in ('Difference From Same Period Previous Year', 'Growth from Same Period Previous Year')
        )
        or (
            gm.GroupingName in ('Difference From Same Period Previous Year', 'Growth from Same Period Previous Year')
            --and gm.IsScoped = 1 -- Select the SCOPED versions
            and gm.IsScoped = 0 -- Select the normal versions
        )
    )
    and gm.GroupingName not in ('Rank')



-- add in any missing scoped measure declarations
insert into #t(MeasuresId, MeasureName, IsScoped, Scoped_IsCreateMeasure, Scoped_IsSubcubeExpression, MeasureDefinition)
select
     gm.MeasuresId
    ,gm.MeasureName
    ,gm.IsScoped 
    ,gm.Scoped_IsCreateMeasure
    ,gm.Scoped_IsSubcubeExpression
    ,gm.MeasureDefinition
from
    dbo.tblGeneratedMeasures gm 
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


declare @txt varchar(max) = ''

select
    @txt = concat(@txt, char(13), MeasureDefinition)
from
    #t
order by
    MeasureName
    ,IsScoped 
    ,Scoped_IsCreateMeasure desc -- make sure the measure definition comes first
    ,Scoped_IsSubcubeExpression
    ,MeasureDefinition

exec dbo.WriteToFile 'C:\_car\CarilionCube\MDX\Analytics_calculations_NewMeasures.mdx', @txt




set @txt = ''

select
    @txt = concat(@txt, char(13), gm.MeasureDefinition)
from
    dbo.tblGeneratedMeasures gm 
    left join #t t
        on gm.MeasuresId = t.MeasuresId
where
    t.MeasuresId is null
order by
     gm.MeasureName
    ,gm.IsScoped 
    ,gm.Scoped_IsCreateMeasure desc -- make sure the measure definition comes first
    ,gm.Scoped_IsSubcubeExpression
    ,gm.MeasureDefinition

exec dbo.WriteToFile 'C:\_car\CarilionCube\MDX\Analytics_calculations_UnusedMeasures.mdx', @txt



-- usp_MeasureGenerator_DifferenceFromSamePeriodPreviousYear
set @txt = ''

select 
    @txt = concat(@txt, char(13), gm.MeasureDefinition)
from dbo.tblGeneratedMeasures gm
where GroupingGuid = '150AE19A-30D6-4100-9DAC-492FFB3A08E0'
order by gm.MeasureName, gm.IsScoped, gm.Scoped_IsCreateMeasure desc, gm.Scoped_IsSubcubeExpression, gm.MeasureDefinition

exec dbo.WriteToFile 'C:\_car\CarilionCube\MDX\Calc_DifferenceFromSamePeriodPreviousYear.mdx', @txt


-- usp_MeasureGenerator_GrowthFromSamePeriodPreviousYear
set @txt = ''

select 
    @txt = concat(@txt, char(13), gm.MeasureDefinition)
from dbo.tblGeneratedMeasures gm
where GroupingGuid = '1BAA3ED8-28AD-43D5-95DC-44FF873B2030'
order by gm.MeasureName, gm.IsScoped, gm.Scoped_IsCreateMeasure desc, gm.Scoped_IsSubcubeExpression, gm.MeasureDefinition

exec dbo.WriteToFile 'C:\_car\CarilionCube\MDX\Calc_GrowthFromSamePeriodPreviousYear.mdx', @txt

-- usp_MeasureGenerator_DifferenceFromSamePeriodPreviousYear_UsingScope
set @txt = ''

select 
    @txt = concat(@txt, char(13), gm.MeasureDefinition)
from dbo.tblGeneratedMeasures gm
where GroupingGuid = '5050222E-2DF5-40ED-A1AB-A2BF1E5512B2'
order by gm.MeasureName, gm.IsScoped, gm.Scoped_IsCreateMeasure desc, gm.Scoped_IsSubcubeExpression, gm.MeasureDefinition

exec dbo.WriteToFile 'C:\_car\CarilionCube\MDX\Calc_DifferenceFromSamePeriodPreviousYear_UsingScope.mdx', @txt

-- usp_MeasureGenerator_GrowthFromSamePeriodPreviousYear_UsingScope
set @txt = ''

select 
    @txt = concat(@txt, char(13), gm.MeasureDefinition)
from dbo.tblGeneratedMeasures gm
where GroupingGuid = '9E98B267-5339-408E-9357-545F79422BB2'
order by gm.MeasureName, gm.IsScoped, gm.Scoped_IsCreateMeasure desc, gm.Scoped_IsSubcubeExpression, gm.MeasureDefinition

exec dbo.WriteToFile 'C:\_car\CarilionCube\MDX\Calc_GrowthFromSamePeriodPreviousYear_UsingScope.mdx', @txt

-- usp_MeasureGenerator_PercentageOfTotal
set @txt = ''

select 
    @txt = concat(@txt, char(13), gm.MeasureDefinition)
from dbo.tblGeneratedMeasures gm
where GroupingGuid = '0217188E-FB7F-49CD-8A43-8DCFC30B58A6'
order by gm.MeasureName, gm.IsScoped, gm.Scoped_IsCreateMeasure desc, gm.Scoped_IsSubcubeExpression, gm.MeasureDefinition

exec dbo.WriteToFile 'C:\_car\CarilionCube\MDX\Calc_PercentageOfTotal.mdx', @txt

-- usp_MeasureGenerator_PercentRank
set @txt = ''

select 
    @txt = concat(@txt, char(13), gm.MeasureDefinition)
from dbo.tblGeneratedMeasures gm
where GroupingGuid = '5C9E8033-A944-4201-AA1F-E9B0BCD2ADD9'
order by gm.MeasureName, gm.IsScoped, gm.Scoped_IsCreateMeasure desc, gm.Scoped_IsSubcubeExpression, gm.MeasureDefinition

exec dbo.WriteToFile 'C:\_car\CarilionCube\MDX\Calc_PercentRank.mdx', @txt

-- usp_MeasureGenerator_Rank
set @txt = ''

select 
    @txt = concat(@txt, char(13), gm.MeasureDefinition)
from dbo.tblGeneratedMeasures gm
where GroupingGuid = 'B06FB037-83D3-4FDD-A2F3-EAFCAA53DA62'
order by gm.MeasureName, gm.IsScoped, gm.Scoped_IsCreateMeasure desc, gm.Scoped_IsSubcubeExpression, gm.MeasureDefinition

exec dbo.WriteToFile 'C:\_car\CarilionCube\MDX\Calc_Rank.mdx', @txt








GO
