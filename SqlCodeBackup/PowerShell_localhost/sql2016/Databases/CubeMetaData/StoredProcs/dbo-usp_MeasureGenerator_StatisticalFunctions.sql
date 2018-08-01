SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[usp_MeasureGenerator_StatisticalFunctions](
	@func_name varchar(50) = null
    -- NULL = generate all
    -- NOT NULL =  must be the name of a function 
	)
AS
/*

exec [dbo].[usp_MeasureGenerator_StatisticalFunctions] 
	@func_name = 'stddev'
	,@convert_null_to_zero = 1

*/
SET NOCOUNT ON


declare @msg nvarchar(4000)
declare @param_letters nvarchar(26) = 'XYZA'

--*************************************************************************************************
--*************************************************************************************************
--*************************************************************************************************
--*************************************************************************************************
drop table if exists #measure_position

create table #measure_position(
	code char(2) not null,
	offset int not null,
    CONSTRAINT [PK_measure_position_code] PRIMARY KEY CLUSTERED (code ASC),
)

insert into #measure_position(code, offset) values('LO', -1), ('FP', 0), ('RO', 1)


--*************************************************************************************************
--*************************************************************************************************
--*************************************************************************************************
--*************************************************************************************************
drop table if exists #null_treatment

create table #null_treatment(
	code char(1) not null,
	convert_null_to_zero bit not null,
    CONSTRAINT [PK_null_treatment_code] PRIMARY KEY CLUSTERED (code ASC),
)

insert into #null_treatment(code, convert_null_to_zero) values('N', 0), ('0', 1)


--*************************************************************************************************
--*************************************************************************************************
--*************************************************************************************************
--*************************************************************************************************
drop table if exists #param_permutations

create table #param_permutations(
    num_params int not null,
	code nvarchar(26) not null,
    CONSTRAINT UC_param_permutations_code UNIQUE(code),
)

insert into #param_permutations(code, code) values(1, 'X'), (2, 'XY'), (2, 'YX'), (3, 'XYZ')


--*************************************************************************************************
--*************************************************************************************************
--*************************************************************************************************
--*************************************************************************************************
drop table if exists #functions

create table #functions(
	_func_name varchar(200) not null,
	_GroupingGuid uniqueidentifier not null,
	_FriendlyName varchar(200) not null,
	_DISPLAY_FOLDER varchar(200) not null,
	_FORMAT_STRING varchar(200) not null,
	_NumParams tinyint not null,
    _Formula nvarchar(max) null,
    CONSTRAINT [PK_functions_func_name] PRIMARY KEY CLUSTERED (_func_name ASC),
    CONSTRAINT UC_functions_GroupingGuid UNIQUE(_GroupingGuid) 
)

insert into #functions(
 _func_name,            _GroupingGuid,                          _FriendlyName,      _DISPLAY_FOLDER, _FORMAT_STRING, _NumParams, _Formula) values
 ('Avg',                '1BCC4F42-C700-44D2-A477-44C8D4F55017', 'Average',          'Statistical',  '#,##0.0000',       1, null)
,('Sum',                'D376D55D-B5F1-4115-880B-ED4FAB63C693', 'Sum',              'Statistical',  '#,##0.0000',       1, null)
,('Median',             '7FFF3EA8-5E77-4EDC-A1C9-E6A211C9C9E1', 'Median',           'Statistical',  '#,##0.0000',       1, null)
,('StdDev',             '94AB6DA6-BE54-460F-BD5E-8627E1C22790', 'StdDev',           'Statistical',  '#,##0.0000',       1, null)
,('StdDevp',            'A874F391-DFF0-4639-BE37-D937BD99A91F', 'StdDevP',          'Statistical',  '#,##0.0000',       1, null)
,('Var',                'E78C7908-6146-4043-AE47-C24DF94E5A80', 'Variance',         'Statistical',  '#,##0.0000',       1, null)
,('VarP',               '183772C8-FE98-4E88-A4BE-9E5ABF11C1BC', 'Variance P',       'Statistical',  '#,##0.0000',       1, null)
,('Correlation',        '3806B6B3-0F97-4D48-A292-A597FA242E68', 'Correlation',      'Statistical',  '#,##0.0000',       2, null)
,('Covariance',         'ECDEFB36-39D9-45EB-B411-B9DA532497FF', 'Covariance',       'Statistical',  '#,##0.0000',       2, null)
,('CovarianceN',        'C18AE0A9-A76C-4AD8-ABF9-4C4DF6B9C7B8', 'CovarianceN',      'Statistical',  '#,##0.0000',       2, null)
,('LinRegIntercept',    '8EE62D62-1B4C-49BA-BFDD-473FE16B2D7A', 'LinRegIntercept',  'Statistical',  '#,##0.0000',       2, null)
,('LinRegPoint',        '32AFBFA0-5F0B-4882-BC27-0C947D07B67A', 'LinRegPoint',      'Statistical',  '#,##0.0000',       3, null)
,('LinRegR2',           '965E0970-7B1E-4C3B-A84C-95C1C6E7A331', 'LinRegR2',         'Statistical',  '#,##0.0000',       2, null)
,('LinRegSlope',        'A49B1157-FD9A-442D-BAB7-62D3AB4C0375', 'LinRegSlope',      'Statistical',  '#,##0.0000',       2, null)
,('LinRegVariance',     '7D4176DD-D96A-4D54-A093-842FFA380AAB', 'LinRegVariance',   'Statistical',  '#,##0.0000',       2, null)
,('Min',                'B1173155-13BC-4B81-A9DC-511173F132E7', 'Min',              'Statistical',  '#,##0.0000',       2, null)
,('Max',                '41523CA5-D1B4-4C3B-B19E-C929EDC97AC2', 'Max',              'Statistical',  '#,##0.0000',       2, null)
,('Rank',               '14255EE3-CF30-4AD0-B555-6477A2942751', 'Rank',             'Statistical',  '#,##0.0000',       2, null)
,('RowNum',             '1324F644-2689-4045-8C02-8C7EB6A90789', 'RowNum',           'Statistical',  '#,##0.0000',       2, null)
,('+',                  '0E30A859-54D4-4811-9485-F42E7E8DA5F7', 'Add',              'Statistical',  '#,##0.0000',       2, null)
,('-',                  'B5347DE3-732D-41F4-A1B5-D71DE4F1B6CD', 'Subtract',         'Statistical',  '#,##0.0000',       2, null)
,('Divide',             'EE4CD7C4-C00C-4415-979E-CC1E2D6FA033', 'Divide',           'Statistical',  '#,##0.0000',       2, null)
,('Divide',             '32BC3EF0-165A-41AC-977A-780FE7895B54', 'Percent',          'Statistical',  'Percent',          2, null)
,('*',                  '1D560B67-3B9C-4D72-A036-7A693065057E', 'Multiply',         'Statistical',  '#,##0.0000',       2, null)


-- select newid()

if @func_name is not null
begin
    if not exists(select top 1 1 from #functions where _func_name = @func_name)
    begin
	    set @msg = concat('@func_name = [', @func_name, '] not found in list of supported functions')
	    raiserror(@msg, 18, 0)
    end
end



--********************************************************************
--********************************************************************
--********************************************************************
--********************************************************************
declare @MeasureDefinitionName nvarchar(max) = N'DSTAT_<<_FriendlyName>>_<<MeasurePosition>>_<<NullTreatment>>_<<ParamOrder>><<ExtBehavior>>'

declare @ColumnPosition nvarchar(max) = N',
axis(0).item(<<ColPosZeroBased>>)'

declare @CurrentMeasureColumnPosition nvarchar(max) = 
N'Rank(StrToTuple("( "+Generate(Head(Axis(0), Axis(0).Item(0).Count ) AS RN,"Axis(0).Item(0).Item("+CStr(RN.CurrentOrdinal-1)+").Hierarchy.CurrentMember",", ")+" )"),Axis(0))'

DECLARE @template_def NVARCHAR(MAX) = 
N'
CREATE MEMBER CURRENTCUBE.[Measures].[<<MeasureDefinitionName>>] AS 
<<_func_name>>(Axis(1),
    <<FuncParams>>
    )
,<<MEASURE_PROPERTIES>>;
'

DECLARE @template_formula NVARCHAR(MAX) = 
N'
CREATE MEMBER CURRENTCUBE.[Measures].[DSTAT_<<_FriendlyName>>_<<MeasurePosition>>_<<NullTreatment>>_<<ParamOrder>><<ExtBehavior>>] AS 
<<formula>>
,<<MEASURE_PROPERTIES>>;
'


--********************************************************************
--********************************************************************
--********************************************************************
--********************************************************************
delete from gm
from 
    dbo.tblGeneratedMeasures gm
    join #functions f
        on gm.GroupingGuid = f._GroupingGuid
where 
    @func_name is null
    or @func_name = f._func_name


DROP TABLE IF EXISTS #t


--********************************************************************
--********************************************************************
--********************************************************************
--********************************************************************
select distinct
    -- MeasureName                = CONCAT(f.measure_name, ' - <<lag>> Day <<_FriendlyName>> - By - ', f.dimension_name)
    --,MeasureUniqueName          = CONCAT('[', f.measure_name, ' - <<lag>> Day <<_FriendlyName>> - By - ', f.dimension_name, ']')
    --,MeasureDefinition          = q.MeasureDefinition
    --,HashCodeMeasureDefinition  = null
    --,IsDimensionAgnostic        = 1
    --,IsScoped                   = 0
    --,Scoped_IsCreateMeasure     = 0
    --,Scoped_IsSubcubeExpression = 0
    --,GeneratedBy                = 'usp_MeasureGenerator_StatisticalFunctions'
    --,GroupingName               = f._FriendlyName
    --,GroupingGuid               = f._GroupingGuid
    --,dimension_name             = null
    --,dimension_unique_name      = null    
    --,dimension_master_name      = null    
    --,hierarchy_name             = null    
    --,hierarchy_unique_name      = null    
    --,level_caption              = null    
    --,level_name                 = null    
    --,level_unique_name          = null    
    --,measure_name               = null    
    --,measure_unique_name        = null    
    --,measuregroup_name          = null    
    --,VISIBLE                    = 1
    --,DISPLAY_FOLDER             = f._DISPLAY_FOLDER
    --,FORMAT_STRING              = f._FORMAT_STRING
    --,ASSOCIATED_MEASURE_GROUP   = NULL
    --,CAPTION                    = null
    --,SOLVE_ORDER                = null
    *
--into #t
from
    #functions f
    cross join #measure_position mp
    cross join #null_treatment
    cross join #param_permutations
    --cross apply (
    --    select 
    --        REPLACE(replace(REPLACE(replace(REPLACE(replace(REPLACE(replace(REPLACE(replace(REPLACE(REPLACE(REPLACE(
    --            iif(@convert_null_to_zero = 1, @template_null_to_zero, @template_def)
    --            ,'<<dimension_name>>'        ,f.dimension_name)        
    --            ,'<<dimension_unique_name>>' ,f.dimension_unique_name)
    --            ,'<<dimension_master_name>>' ,f.dimension_master_name) 
    --            ,'<<hierarchy_name>>'        ,f.hierarchy_name)        
    --            ,'<<hierarchy_unique_name>>' ,f.hierarchy_unique_name) 
    --            ,'<<level_caption>>'         ,f.level_caption)         
    --            ,'<<level_name>>'            ,f.level_name)            
    --            ,'<<level_unique_name>>'     ,f.level_unique_name)     
    --            ,'<<measure_name>>'          ,f.measure_name)          
    --            ,'<<measure_unique_name>>'   ,f.measure_unique_name)   
    --            ,'<<measuregroup_name>>'     ,f.measuregroup_name)     
    --            ,'<<_func_name>>'			 ,@_func_name)
    --            ,'<<_FriendlyName>>'		 ,@_FriendlyName)
    --            as MeasureDefinition
    --        ,0 as IsScoped
    --        ,0 as Scoped_IsCreateMeasure
    --        ,0 as Scoped_IsSubcubeExpression
    --) q
--ORDER BY 
--     measuregroup_name
--    ,measure_name
--    ,dimension_name

return


--update #t
--set
--    MeasureDefinition = REPLACE(MeasureDefinition, '<<MEASURE_PROPERTIES>>', 
--        dbo.ufn_CreateMeasureProperties(VISIBLE, DISPLAY_FOLDER, FORMAT_STRING, ASSOCIATED_MEASURE_GROUP, CAPTION, SOLVE_ORDER))

--update #t
--set
--    HashCodeMeasureDefinition = hashbytes('SHA2_512', upper(MeasureDefinition))


---- Delete duplicates
--;with cte as 
--(
--    select 
--        HashCodeMeasureDefinition
--        ,ROW_NUMBER() over(partition by HashCodeMeasureDefinition order by MeasureName) as rownum
--    from
--        #t
--)
--delete from cte
--where rownum > 1

----    select * from #t order by 1,2,3,4


--insert into [dbo].[tblGeneratedMeasures](
--    MeasureName,MeasureUniqueName,MeasureDefinition,IsDimensionAgnostic,IsScoped,Scoped_IsCreateMeasure
--    ,Scoped_IsSubcubeExpression,GeneratedBy,GroupingName,GroupingGuid,dimension_name
--    ,dimension_unique_name,dimension_master_name,hierarchy_name,hierarchy_unique_name
--    ,level_caption,level_name,level_unique_name,measure_name,measure_unique_name
--    ,measuregroup_name,VISIBLE,DISPLAY_FOLDER,FORMAT_STRING,ASSOCIATED_MEASURE_GROUP
--    ,CAPTION,SOLVE_ORDER)
--select 
--    MeasureName,MeasureUniqueName,MeasureDefinition,IsDimensionAgnostic,IsScoped,Scoped_IsCreateMeasure
--    ,Scoped_IsSubcubeExpression,GeneratedBy,GroupingName,GroupingGuid,dimension_name
--    ,dimension_unique_name,dimension_master_name,hierarchy_name,hierarchy_unique_name
--    ,level_caption,level_name,level_unique_name,measure_name,measure_unique_name
--    ,measuregroup_name,VISIBLE,DISPLAY_FOLDER,FORMAT_STRING,ASSOCIATED_MEASURE_GROUP
--    ,CAPTION,SOLVE_ORDER
--from
--    #t



--print concat('select * from dbo.tblGeneratedMeasures where GroupingGuid = ''', @guid, '''')
--print concat('select MeasureDefinition from dbo.tblGeneratedMeasures where GroupingGuid = ''', @guid, '''')

GO
