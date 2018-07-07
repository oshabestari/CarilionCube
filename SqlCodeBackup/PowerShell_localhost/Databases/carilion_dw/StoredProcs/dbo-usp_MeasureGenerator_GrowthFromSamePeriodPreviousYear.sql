SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[usp_MeasureGenerator_GrowthFromSamePeriodPreviousYear]
AS

SET NOCOUNT ON

--********************************************************************
--********************************************************************
-- Keep in sync with usp_MeasureGenerator_DifferenceFromSamePeriodPreviousYear
--********************************************************************
--********************************************************************


DECLARE @template NVARCHAR(MAX) = 
N'
CREATE MEMBER CURRENTCUBE.[Measures].[<<measure_name>> - Growth from Same Period Previous Year - By - <<dimension_name>>]
 AS IIF ((PARALLELPERIOD(<<hierarchy_unique_name>>.[<<level_caption>>], 1, <<hierarchy_unique_name>>.[<<level_caption>>].CurrentMember) , (<<measure_unique_name>>)) = 0  , NULL,
    IIF (<<measure_unique_name>> = 0, NULL,
            (
            <<measure_unique_name>> - 
            (PARALLELPERIOD(<<hierarchy_unique_name>>.[<<level_caption>>], 1, <<hierarchy_unique_name>>.[<<level_caption>>].CurrentMember) , (<<measure_unique_name>>)
                            )
            )
            / (PARALLELPERIOD(<<hierarchy_unique_name>>.[<<level_caption>>], 1, <<hierarchy_unique_name>>.[<<level_caption>>].CurrentMember) , (<<measure_unique_name>>)
            )
        )
) 
,<<MEASURE_PROPERTIES>>;
'

-- change for each unique measure
-- used to delete old measures generated by this sproc
-- select newid()
declare @guid uniqueidentifier = '1BAA3ED8-28AD-43D5-95DC-44FF873B2030'


delete from dbo.tblGeneratedMeasures
where GroupingGuid = @guid


DROP TABLE IF EXISTS #t


select distinct
     MeasureName                = CONCAT(u.measure_name, ' - Growth from Same Period Previous Year - By - ', u.dimension_name)
    ,MeasureUniqueName          = CONCAT('[', u.measure_name, ' - Growth from Same Period Previous Year - By - ', u.dimension_name, ']')
    ,MeasureDefinition          = q.MeasureDefinition
    ,HashCodeMeasureDefinition  = null
    ,IsDimensionAgnostic        = 0
    ,IsScoped                   = q.IsScoped
    ,Scoped_IsCreateMeasure     = q.Scoped_IsCreateMeasure
    ,Scoped_IsSubcubeExpression = q.Scoped_IsSubcubeExpression
    ,GeneratedBy                = 'usp_MeasureGenerator_GrowthFromSamePeriodPreviousYear'
    ,GroupingName               = 'Growth from Same Period Previous Year'
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
    ,DISPLAY_FOLDER             = concat('Growth\', IIF(u.level_caption like '%fiscal%', 'Growth by Fiscal Year', 'Growth by Calendar Year'))
    ,FORMAT_STRING              = 'Percent' --isnull(u.default_format_string, 'Percent')
    ,ASSOCIATED_MEASURE_GROUP   = u.measuregroup_name
    ,CAPTION                    = null
    ,SOLVE_ORDER                = null
into #t
from
    dbo.tblCube_Usage_Between_Dimensions_And_Facts u
    cross apply (
        select 
            REPLACE(replace(REPLACE(replace(REPLACE(replace(REPLACE(replace(REPLACE(replace(REPLACE(
                @template
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
    (
        u.measure_is_visible = 1
        and u.measure_name NOT LIKE '% - Percentage Of Total'
        AND u.measure_name not LIKE '% - Difference from Same Period Previous Year'
        AND u.measure_name not LIKE '% - Min'
        AND u.measure_name not LIKE '% - Max'
    )
    and hierarchy_unique_name in ('[Date - Diagnosis - Start].[Fiscal Year - Quarter - Month - Date]', '[Date - Diagnosis - Start].[Year - Quarter - Month - Date]')
    and level_caption in ('Fiscal Year', 'Year')

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
