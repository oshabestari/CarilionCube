SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



create PROCEDURE [dbo].[usp_MeasureGenerator_FunctionOverDays](
	@func_name varchar(50), 
	@lag_in_days int,
	@convert_null_to_zero bit 
	-- 1 = Nulls are converted to zero. 
	-- 0 = Nulls are NOT converted and function treats nulls according to default behavior.
	)
AS
/*

exec [dbo].[usp_MeasureGenerator_FunctionOverDays] 
	@func_name = 'stddev'
	,@lag_in_days = 20
	,@convert_null_to_zero = 1

*/
SET NOCOUNT ON


declare @msg nvarchar(4000)


create table #helper(
	_func_name varchar(200) not null,
	_GroupingGuid uniqueidentifier not null,
	_GroupingName varchar(200) not null,
	_DISPLAY_FOLDER varchar(200) not null,
	_FORMAT_STRING varchar(200) not null
)

insert into #helper(_func_name, _GroupingGuid, _GroupingName, _DISPLAY_FOLDER, _FORMAT_STRING) values
 ('stddev',		'6CBA87C0-F362-4120-9904-50DFA3C68ECD', 'Std Deviation',		'Statistical',	'#,##0.0000')
,('avg',		'1BCC4F42-C700-44D2-A477-44C8D4F55017', 'Average',				'Statistical',	'#,##0.0000')
,('median',		'7FFF3EA8-5E77-4EDC-A1C9-E6A211C9C9E1', 'Median',				'Statistical',	'#,##0.0000')
,('stddev',		'94AB6DA6-BE54-460F-BD5E-8627E1C22790', 'Standard Deviation',	'Statistical',	'#,##0.0000')
,('stddevp',	'A874F391-DFF0-4639-BE37-D937BD99A91F', 'Standard Deviation P', 'Statistical',	'#,##0.0000')
,('var',		'E78C7908-6146-4043-AE47-C24DF94E5A80', 'Variance',				'Statistical',	'#,##0.0000')
,('varp',		'183772C8-FE98-4E88-A4BE-9E5ABF11C1BC', 'Variance P',			'Statistical',	'#,##0.0000')


if not exists(select top 1 1 from #helper where _func_name = @func_name)
begin
	set @msg = concat('@func_name = [', @func_name, '] not found in list of supported functions')
	raiserror(@msg, 18, 0)
end



--********************************************************************
--********************************************************************
-- Keep in sync with usp_MeasureGenerator_DifferenceFromSamePeriodPreviousYear
--********************************************************************
--********************************************************************


DECLARE @template_null_to_zero NVARCHAR(MAX) = 
N'
CREATE MEMBER CURRENTCUBE.[Measures].[<<measure_name>> - <<lag>> Day <<_GroupingName>> - By - <<dimension_name>>] AS 
<<_func_name>>(
	<<dimension_unique_name>>.[Date].CurrentMember.Lag(<<lag>>):<<dimension_unique_name>>.[Date],
	iif(isempty(<<measure_unique_name>>), 0, <<measure_unique_name>>)
)
,<<MEASURE_PROPERTIES>>;
'

DECLARE @template_def NVARCHAR(MAX) = 
N'
CREATE MEMBER CURRENTCUBE.[Measures].[<<measure_name>> - <<lag>> Day <<_GroupingName>> - By - <<dimension_name>>] AS 
<<_func_name>>(
	<<dimension_unique_name>>.[Date].CurrentMember.Lag(<<lag>>):<<dimension_unique_name>>.[Date],
	<<measure_unique_name>>
)
,<<MEASURE_PROPERTIES>>;
'

-- change for each unique measure
-- used to delete old measures generated by this sproc
-- select newid()
declare @guid uniqueidentifier
-- select * from dbo.tblGeneratedMeasures where GroupingGuid = @guid
-- select MeasureDefinition from dbo.tblGeneratedMeasures where GroupingGuid = @guid
declare @_func_name varchar(200)
declare @_GroupingName varchar(200)
declare @_DISPLAY_FOLDER varchar(200)
declare @_FORMAT_STRING varchar(200)

select top 1
	@guid = h._GroupingGuid
	,@_func_name = h._func_name
	,@_GroupingName = h._GroupingName
	,@_DISPLAY_FOLDER = h._DISPLAY_FOLDER
	,@_FORMAT_STRING = h._FORMAT_STRING
from 
	#helper h
where 
	h._func_name = @func_name

delete from dbo.tblGeneratedMeasures
where GroupingGuid = @guid


DROP TABLE IF EXISTS #t


select distinct
     MeasureName                = CONCAT(u.measure_name, ' - <<lag>> Day <<_GroupingName>> - By - ', u.dimension_name)
    ,MeasureUniqueName          = CONCAT('[', u.measure_name, ' - <<lag>> Day <<_GroupingName>> - By - ', u.dimension_name, ']')
    ,MeasureDefinition          = q.MeasureDefinition
    ,HashCodeMeasureDefinition  = null
    ,IsDimensionAgnostic        = 0
    ,IsScoped                   = q.IsScoped
    ,Scoped_IsCreateMeasure     = q.Scoped_IsCreateMeasure
    ,Scoped_IsSubcubeExpression = q.Scoped_IsSubcubeExpression
    ,GeneratedBy                = 'usp_MeasureGenerator_FunctionOverDays'
    ,GroupingName               = @_GroupingName
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
    ,DISPLAY_FOLDER             = @_DISPLAY_FOLDER
    ,FORMAT_STRING              = @_FORMAT_STRING
    ,ASSOCIATED_MEASURE_GROUP   = u.measuregroup_name
    ,CAPTION                    = null
    ,SOLVE_ORDER                = null
into #t
from
    dbo.tblCube_Usage_Between_Dimensions_And_Facts u
    cross apply (
        select 
            REPLACE(REPLACE(replace(REPLACE(replace(REPLACE(replace(REPLACE(replace(REPLACE(replace(REPLACE(REPLACE(REPLACE(
                iif(@convert_null_to_zero = 1, @template_null_to_zero, @template_def)
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
                ,'<<lag>>'					 ,@lag_in_days)
                ,'<<_func_name>>'			 ,@_func_name)
                ,'<<_GroupingName>>'		 ,@_GroupingName)
                as MeasureDefinition
            ,0 as IsScoped
            ,0 as Scoped_IsCreateMeasure
            ,0 as Scoped_IsSubcubeExpression
    ) q
where
    (
        u.measure_name NOT LIKE '% - Percentage Of Total'
        AND u.measure_name not LIKE '% - Difference from Same Period Previous Year'
        AND u.measure_name not LIKE '% - Min'
        AND u.measure_name not LIKE '% - Max'
    )
   -- and hierarchy_unique_name in ('[Date - Diagnosis - Start].[Fiscal Year - Quarter - Month - Date]', '[Date - Diagnosis - Start].[Year - Quarter - Month - Date]')
    and hierarchy_name = 'Date'
	and level_name = 'Date'

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



print concat('select * from dbo.tblGeneratedMeasures where GroupingGuid = ''', @guid, '''')
print concat('select MeasureDefinition from dbo.tblGeneratedMeasures where GroupingGuid = ''', @guid, '''')

GO
