SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO














CREATE PROCEDURE [dbo].[usp_MeasureGenerator_PercentageOfTotal_stj]
as

SET NOCOUNT on


DECLARE @template_measures NVARCHAR(MAX) = 
N'
CREATE MEMBER CURRENTCUBE.[Measures].[<<measure_name>> - Percentage Of Total]
 AS 
IIF(([Measures].[<<measure_name>>], Axis(1).Item(0).Item(Axis(1).Item(0).Count - 1).Hierarchy.CurrentMember.Parent) = 0, 
     null,
     [Measures].[<<measure_name>>]/([Measures].[<<measure_name>>], Axis(1).Item(0).Item(Axis(1).Item(0).Count - 1).Hierarchy.CurrentMember.Parent)
    )
,<<MEASURE_PROPERTIES>>;
'

-- change for each unique measure
-- used to delete old measures generated by this sproc
-- select newid()
declare @guid uniqueidentifier = '0217188E-FB7F-49CD-8A43-8DCFC30B58A6'


delete from dbo.tblGeneratedMeasures
where GroupingGuid = @guid


DROP TABLE IF EXISTS #t


select distinct
     MeasureName                = CONCAT(u.measure_name, ' - Percentage Of Total')
    ,MeasureUniqueName          = CONCAT('[', u.measure_name, ' - Percentage Of Total]')
    ,MeasureDefinition          = q.MeasureDefinition
    ,HashCodeMeasureDefinition  = null
    ,IsDimensionAgnostic        = 1
    ,IsScoped                   = q.IsScoped
    ,Scoped_IsCreateMeasure     = q.Scoped_IsCreateMeasure
    ,Scoped_IsSubcubeExpression = q.Scoped_IsSubcubeExpression
    ,GeneratedBy                = 'usp_MeasureGenerator_PercentageOfTotal'
    ,GroupingName               = 'Percentage Of Total'
    ,GroupingGuid               = @guid
    ,dimension_name             = u.dimension_name
    ,dimension_unique_name      = u.dimension_unique_name       
    ,dimension_master_name      = u.dimension_master_name       
    ,hierarchy_name             = u.hierarchy_name              
    ,hierarchy_unique_name      = u.hierarchy_unique_name       
    ,level_caption              = u.level_caption               
    ,level_name                 = u.level_name                  
    ,level_unique_name          = u.level_unique_name           
    ,measure_name               = u.measure_name                
    ,measure_unique_name        = u.measure_unique_name         
    ,measuregroup_name          = u.measuregroup_name           
    ,VISIBLE                    = 1
    ,DISPLAY_FOLDER             = null          --'Percentage Of Total'
    ,FORMAT_STRING              = '"#,##0.####' --isnull(u.default_format_string, 'Percent')
    ,ASSOCIATED_MEASURE_GROUP   = u.measuregroup_name
    ,CAPTION                    = null
    ,SOLVE_ORDER                = null
into #t
from
    dbo.tblCube_Usage_Between_Dimensions_And_Facts u
    cross apply (
        select 
            REPLACE(replace(REPLACE(replace(REPLACE(replace(REPLACE(replace(REPLACE(replace(REPLACE(
                @template_measures
                ,'<<dimension_name>>'        ,u.dimension_name)        
                ,'<<dimension_unique_name>>' ,u.dimension_unique_name)
                ,'<<dimension_master_name>>' ,u.dimension_master_name) 
                ,'<<hierarchy_name>>'        ,u.hierarchy_name)        
                ,'<<hierarchy_unique_name>>' ,u.hierarchy_unique_name) 
                ,'<<level_caption>>'         ,u.level_caption)         
                ,'<<level_name>>'            ,u.level_name)            
                ,'<<level_unique_name>>'     ,u.level_unique_name)     
                ,'<<measure_name>>'          ,u.measure_name)          
                ,'<<measure_unique_name>>'   ,u.measure_unique_name)   
                ,'<<measuregroup_name>>'     ,u.measuregroup_name)     
                as MeasureDefinition
            ,0 as IsScoped
            ,0 as Scoped_IsCreateMeasure
            ,0 as Scoped_IsSubcubeExpression
    ) q
where
    
       (u.measure_name LIKE '% - Count'
	    OR u.measure_name LIKE '% - Unique Count'
	    OR u.measure_name LIKE '% - Sum')
		AND u.measure_name not LIKE 'Census %'
		AND u.measure_name not LIKE '% Log - Sum'
	    AND u.measure_name not LIKE '% to %'
	    AND u.measure_name not LIKE '% Glasgow Coma Scale %'
	    AND u.measure_name not LIKE '% LOS in %'
	    AND u.measure_name not LIKE '% Age in Years %'
		AND u.measure_is_visible = 1
ORDER BY 
     measuregroup_name
    ,measure_name
    ,dimension_name


update #t
set
    MeasureDefinition = REPLACE(MeasureDefinition, '<<MEASURE_PROPERTIES>>', 
        dbo.ufn_CreateMeasureProperties(VISIBLE, DISPLAY_FOLDER, FORMAT_STRING, ASSOCIATED_MEASURE_GROUP, CAPTION, SOLVE_ORDER))

update #t
set
    HashCodeMeasureDefinition = hashbytes('SHA2_512', upper(MeasureDefinition))


-- Delete duplicates
;with cte as 
(
    select 
        HashCodeMeasureDefinition
        ,ROW_NUMBER() over(partition by HashCodeMeasureDefinition order by MeasureName) as rownum
    from
        #t
)
delete from cte
where rownum > 1

--    select * from #t order by 1,2,3,4


insert into [dbo].[tblGeneratedMeasures](
    MeasureName,MeasureUniqueName,MeasureDefinition,IsDimensionAgnostic,IsScoped,Scoped_IsCreateMeasure
    ,Scoped_IsSubcubeExpression,GeneratedBy,GroupingName,GroupingGuid,dimension_name
    ,dimension_unique_name,dimension_master_name,hierarchy_name,hierarchy_unique_name
    ,level_caption,level_name,level_unique_name,measure_name,measure_unique_name
    ,measuregroup_name,VISIBLE,DISPLAY_FOLDER,FORMAT_STRING,ASSOCIATED_MEASURE_GROUP
    ,CAPTION,SOLVE_ORDER)
select 
    MeasureName,MeasureUniqueName,MeasureDefinition,IsDimensionAgnostic,IsScoped,Scoped_IsCreateMeasure
    ,Scoped_IsSubcubeExpression,GeneratedBy,GroupingName,GroupingGuid,dimension_name
    ,dimension_unique_name,dimension_master_name,hierarchy_name,hierarchy_unique_name
    ,level_caption,level_name,level_unique_name,measure_name,measure_unique_name
    ,measuregroup_name,VISIBLE,DISPLAY_FOLDER,FORMAT_STRING,ASSOCIATED_MEASURE_GROUP
    ,CAPTION,SOLVE_ORDER
from
    #t









GO
