SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [dbo].[usp_MeasureGenerator_DifferenceFromSamePeriodPreviousYear_UsingScope]
AS

SET NOCOUNT ON

--********************************************************************
--********************************************************************
-- Keep in sync with usp_MeasureGenerator_GrowthFromSamePeriodPreviousYear_UsingScope
--********************************************************************
--********************************************************************


DECLARE @template_measures NVARCHAR(MAX) = 
N'
CREATE MEMBER CURRENTCUBE.[Measures].[<<measure_name>> - Difference from Same Period Previous Year]
 AS NULL
,<<MEASURE_PROPERTIES>>;
'


DECLARE @template_scope NVARCHAR(MAX) = 
N'
scope([Measures].[<<measure_name>> - Difference from Same Period Previous Year], DESCENDANTS(<<hierarchy_unique_name>>,,AFTER));
this = <<measure_unique_name>> - (PARALLELPERIOD(<<hierarchy_unique_name>>.[<<level_caption>>], 1, <<hierarchy_unique_name>>.CurrentMember), (<<measure_unique_name>>));
end scope;
'

-- change for each unique measure
-- used to delete old measures generated by this sproc
declare @guid uniqueidentifier = '5050222E-2DF5-40ED-A1AB-A2BF1E5512B2'


delete from dbo.tblGeneratedMeasures
where GroupingGuid = @guid


DROP TABLE IF EXISTS #t


select distinct
     MeasureName                = CONCAT(u.measure_name, ' - Difference from Same Period Previous Year')
    ,MeasureUniqueName          = CONCAT('[', u.measure_name, ' - Difference from Same Period Previous Year]')
    ,MeasureDefinition          = q.MeasureDefinition
    ,HashCodeMeasureDefinition  = null
    ,IsScoped                   = 1
    ,Scoped_IsCreateMeasure     = q.Scoped_IsCreateMeasure
    ,Scoped_IsSubcubeExpression = q.Scoped_IsSubcubeExpression
    ,GeneratedBy                = 'usp_MeasureGenerator_DifferenceFromSamePeriodPreviousYear_UsingScope'
    ,GroupingName               = 'DifferenceFromSamePeriodPreviousYear'
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
    ,DISPLAY_FOLDER             = 'Difference'
    ,FORMAT_STRING              = isnull(u.default_format_string, '#,##0;-#,##0')
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
            ,1 as Scoped_IsCreateMeasure
            ,0 as Scoped_IsSubcubeExpression
        union
        select 
            REPLACE(replace(REPLACE(replace(REPLACE(replace(REPLACE(replace(REPLACE(replace(REPLACE(
                @template_scope
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
            ,0 as Scoped_IsCreateMeasure
            ,1 as Scoped_IsSubcubeExpression
    ) q
where
    u.dimension_unique_name LIKE '\[date%' ESCAPE '\'
    and u.level_caption like '%Year%'
    and u.level_number = 1
    AND (
        u.measure_is_visible = 1
        and u.measure_name NOT LIKE '% - Percentage Of Total'
        AND u.measure_name not LIKE '% - Difference from Same Period Previous Year'
        AND u.measure_name not LIKE '% - Min'
        AND u.measure_name not LIKE '% - Max'
    )
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
    MeasureName,MeasureUniqueName,MeasureDefinition,IsScoped,Scoped_IsCreateMeasure
    ,Scoped_IsSubcubeExpression,GeneratedBy,GroupingName,GroupingGuid,dimension_name
    ,dimension_unique_name,dimension_master_name,hierarchy_name,hierarchy_unique_name
    ,level_caption,level_name,level_unique_name,measure_name,measure_unique_name
    ,measuregroup_name,VISIBLE,DISPLAY_FOLDER,FORMAT_STRING,ASSOCIATED_MEASURE_GROUP
    ,CAPTION,SOLVE_ORDER)
select 
    MeasureName,MeasureUniqueName,MeasureDefinition,IsScoped,Scoped_IsCreateMeasure
    ,Scoped_IsSubcubeExpression,GeneratedBy,GroupingName,GroupingGuid,dimension_name
    ,dimension_unique_name,dimension_master_name,hierarchy_name,hierarchy_unique_name
    ,level_caption,level_name,level_unique_name,measure_name,measure_unique_name
    ,measuregroup_name,VISIBLE,DISPLAY_FOLDER,FORMAT_STRING,ASSOCIATED_MEASURE_GROUP
    ,CAPTION,SOLVE_ORDER
from
    #t



GO
