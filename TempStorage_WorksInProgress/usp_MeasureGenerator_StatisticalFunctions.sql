USE [CubeMetaData]
GO
/****** Object:  StoredProcedure [dbo].[usp_MeasureGenerator_FunctionOverDays]    Script Date: 7/30/2018 20:11:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



alter PROCEDURE [dbo].[usp_MeasureGenerator_StatisticalFunctions](
	@func_name varchar(50) = null
    -- NULL = generate all
    -- NOT NULL =  must be the name of a function 
	)
AS
/*

exec [dbo].[usp_MeasureGenerator_StatisticalFunctions] 
	@func_name = 'stddev'


*/
SET NOCOUNT ON

if not exists(select top 1 1 from util.Tally)
begin
    raiserror('util.Tally is empty. Execute sproc dbo.usp_PopulateTally to populate.', 18, 0)
end

-- debug
--declare @func_name varchar(50) = null

declare @msg nvarchar(4000)
declare @param_letters nvarchar(26) = 'XYZA'

--*************************************************************************************************
--*************************************************************************************************
--*************************************************************************************************
--*************************************************************************************************
drop table if exists #measure_position

create table #measure_position(
    measure_position_id int identity(1, 1) not null,
	code char(2) not null,
	algo_measure_pos nvarchar(max) not null,
    CONSTRAINT [PK_measure_position_id] PRIMARY KEY CLUSTERED (measure_position_id),
    CONSTRAINT UC_measure_position_code UNIQUE(code),
)

insert into #measure_position(code, algo_measure_pos) values
 ('FP', N'')
,('LP', N'count(axis(0))')
,('LO', N'Rank(StrToTuple("( "+Generate(Head(Axis(0), Axis(0).Item(0).Count ) AS RN,"Axis(0).Item(0).Item("+CStr(RN.CurrentOrdinal-1)+").Hierarchy.CurrentMember",", ")+" )"),Axis(0))')
,('RO', N'Rank(StrToTuple("( "+Generate(Head(Axis(0), Axis(0).Item(0).Count ) AS RN,"Axis(0).Item(0).Item("+CStr(RN.CurrentOrdinal-1)+").Hierarchy.CurrentMember",", ")+" )"),Axis(0))')


--*************************************************************************************************
--*************************************************************************************************
--*************************************************************************************************
--*************************************************************************************************
drop table if exists #null_treatment

create table #null_treatment(
    null_treatment_id int identity(1,1) not null,
	code char(1) not null,
	convert_null_to_zero bit not null,
    CONSTRAINT [PK_null_treatment_id] PRIMARY KEY CLUSTERED (null_treatment_id),
    CONSTRAINT UC_null_treatment_code UNIQUE(code),
)

insert into #null_treatment(code, convert_null_to_zero) values('N', 0), ('0', 1)


--*************************************************************************************************
--*************************************************************************************************
--*************************************************************************************************
--*************************************************************************************************
drop table if exists #param_permutations

create table #param_permutations(
    param_permutations_id int identity(1,1) not null,
    num_params int not null,
	code nvarchar(26) not null,
    is_permutation bit not null,
    CONSTRAINT [PK_param_permutations_id] PRIMARY KEY CLUSTERED (param_permutations_id),
    CONSTRAINT UC_param_permutations_code UNIQUE(code),
)

insert into #param_permutations(num_params, code, is_permutation) values
 (1, 'X',   0)
,(2, 'XY',  0)
,(2, 'YX',  1)
,(3, 'XYZ', 0)
--,(3, 'XYX', 0)
--,(3, 'YXY', 0)


--*************************************************************************************************
--*************************************************************************************************
--*************************************************************************************************
--*************************************************************************************************
drop table if exists #param_permutations_helper

create table #param_permutations_helper(
    param_permutations_helper_id int identity(1,1) not null,
    param_permutations_id int not null,
    caller_pos int not null,
	measure_pos int not null,
    offset_first_pos int not null,
    offset_last_pos int not null,
    offset_left_pos int not null,
    offset_right_pos int not null,
    CONSTRAINT [PK_param_permutations_helper_id] PRIMARY KEY CLUSTERED (param_permutations_helper_id),
)

insert into #param_permutations_helper(param_permutations_id, caller_pos, measure_pos, offset_first_pos, offset_last_pos, offset_left_pos, offset_right_pos) 
select
    pp.param_permutations_id
    ,sa.pos -1
    ,dbo.ufn_GivenCodeGetParamPosition(sa._char) as measure_pos
    ,dbo.ufn_GivenCodeGetParamPosition(sa._char) as offset_first_pos
    ,dbo.ufn_GivenCodeGetParamPosition(sa._char) - pp.num_params as offset_last_pos
    ,dbo.ufn_GivenCodeGetParamPosition(sa._char) - pp.num_params -1 as offset_left_pos
    ,dbo.ufn_GivenCodeGetParamPosition(sa._char) as offset_right_pos
from
    #param_permutations pp
    cross apply dbo.ufn_StringToArray(pp.code) sa

--select * from #param_permutations pp join #param_permutations_helper pph on pp.param_permutations_id = pph.param_permutations_id

--*************************************************************************************************
--*************************************************************************************************
--*************************************************************************************************
--*************************************************************************************************
drop table if exists #extended_behaviors

create table #extended_behaviors(
    extended_behaviors_id int identity(1,1) not null,
    _func_name nvarchar(max) not null,
	MeasureNameSuffix nvarchar(max) null,
	OptionalParam nvarchar(max) null,
    CONSTRAINT [PK_extended_behaviors_id] PRIMARY KEY CLUSTERED (extended_behaviors_id),
)

insert into #extended_behaviors(_func_name, MeasureNameSuffix, OptionalParam) values
 ('Divide',     null,           null)
,('Divide',     '_Def_NegOne',  '-1')
,('Divide',     '_Def_Zero',    '0')
,('Divide',     '_Def_One',     '1')
,('Percent',    null,           null)
,('Percent',    '_Def_NegOne',  '-1')
,('Percent',    '_Def_Zero',    '0')
,('Percent',    '_Def_One',     '1')


--*************************************************************************************************
--*************************************************************************************************
--*************************************************************************************************
--*************************************************************************************************
declare @formula_add nvarchar(max) = N'<<NullToZero_Start>>axis(0).item(<<P0>>)<<NullToZero_End>> + <<NullToZero_Start>>axis(0).item(<<P1>>)<<NullToZero_End>>'
declare @formula_subtract nvarchar(max) = N'<<NullToZero_Start>>axis(0).item(<<P0>>)<<NullToZero_End>> - <<NullToZero_Start>>axis(0).item(<<P1>>)<<NullToZero_End>>'
declare @formula_multiplay nvarchar(max) = N'<<NullToZero_Start>>axis(0).item(<<P0>>)<<NullToZero_End>> * <<NullToZero_Start>>axis(0).item(<<P1>>)<<NullToZero_End>>'


--*************************************************************************************************
--*************************************************************************************************
--*************************************************************************************************
--*************************************************************************************************
drop table if exists #functions

create table #functions(
    functions_id int identity(1,1) not null,
	_func_name varchar(200) not null,
	_GroupingGuid uniqueidentifier not null,
	_FriendlyName varchar(200) not null,
	_DISPLAY_FOLDER varchar(200) not null,
	_FORMAT_STRING varchar(200) not null,
    _SupportsPermutations bit not null,
	_NumParams tinyint not null,
    _FunctNeedsSet bit not null,
    _Formula nvarchar(max) null,
    CONSTRAINT [PK_functions_id] PRIMARY KEY CLUSTERED (functions_id),
    CONSTRAINT UC_functions_func_name UNIQUE(_func_name, _FriendlyName) ,
    CONSTRAINT UC_functions_GroupingGuid UNIQUE(_GroupingGuid), 
)

insert into #functions(
 _func_name,            _GroupingGuid,                          _FriendlyName,      _DISPLAY_FOLDER,                _FORMAT_STRING, _SupportsPermutations, _NumParams, _FunctNeedsSet, _Formula) values
 ('Avg',                '1BCC4F42-C700-44D2-A477-44C8D4F55017', 'Average',          'Statistical\Average',          '#,##0.0000',      0,                    1,         1,              null)
,('Sum',                'D376D55D-B5F1-4115-880B-ED4FAB63C693', 'Sum',              'Statistical\Sum',              '#,##0.0000',      0,                    1,         1,              null)
,('Median',             '7FFF3EA8-5E77-4EDC-A1C9-E6A211C9C9E1', 'Median',           'Statistical\Median',           '#,##0.0000',      0,                    1,         1,              null)
,('StdDev',             '94AB6DA6-BE54-460F-BD5E-8627E1C22790', 'StdDev',           'Statistical\StdDev',           '#,##0.0000',      0,                    1,         1,              null)
,('StdDevp',            'A874F391-DFF0-4639-BE37-D937BD99A91F', 'StdDevP',          'Statistical\StdDevP',          '#,##0.0000',      0,                    1,         1,              null)
,('Var',                'E78C7908-6146-4043-AE47-C24DF94E5A80', 'Variance',         'Statistical\Variance',         '#,##0.0000',      0,                    1,         1,              null)
,('VarP',               '183772C8-FE98-4E88-A4BE-9E5ABF11C1BC', 'VarianceP',        'Statistical\VarianceP',        '#,##0.0000',      0,                    1,         1,              null)
,('Correlation',        '3806B6B3-0F97-4D48-A292-A597FA242E68', 'Correlation',      'Statistical\Correlation',      '#,##0.0000',      0,                    2,         1,              null)
,('Covariance',         'ECDEFB36-39D9-45EB-B411-B9DA532497FF', 'Covariance',       'Statistical\Covariance',       '#,##0.0000',      0,                    2,         1,              null)
,('CovarianceN',        'C18AE0A9-A76C-4AD8-ABF9-4C4DF6B9C7B8', 'CovarianceN',      'Statistical\CovarianceN',      '#,##0.0000',      0,                    2,         1,              null)
,('LinRegIntercept',    '8EE62D62-1B4C-49BA-BFDD-473FE16B2D7A', 'LinRegIntercept',  'Statistical\LinRegIntercept',  '#,##0.0000',      1,                    2,         1,              null)
,('LinRegPoint',        '32AFBFA0-5F0B-4882-BC27-0C947D07B67A', 'LinRegPoint',      'Statistical\LinRegPoint',      '#,##0.0000',      1,                    3,         1,              null)
,('LinRegR2',           '965E0970-7B1E-4C3B-A84C-95C1C6E7A331', 'LinRegR2',         'Statistical\LinRegR2',         '#,##0.0000',      1,                    2,         1,              null)
,('LinRegSlope',        'A49B1157-FD9A-442D-BAB7-62D3AB4C0375', 'LinRegSlope',      'Statistical\LinRegSlope',      '#,##0.0000',      1,                    2,         1,              null)
,('LinRegVariance',     '7D4176DD-D96A-4D54-A093-842FFA380AAB', 'LinRegVariance',   'Statistical\LinRegVariance',   '#,##0.0000',      1,                    2,         1,              null)
,('Min',                'B1173155-13BC-4B81-A9DC-511173F132E7', 'Min',              'Statistical\Min',              '#,##0.0000',      1,                    1,         1,              null)
,('Max',                '41523CA5-D1B4-4C3B-B19E-C929EDC97AC2', 'Max',              'Statistical\Max',              '#,##0.0000',      1,                    1,         1,              null)
,('PercentileLo2Hi',    '4DFE6181-2F8E-4CDC-B1E5-8E2FB68CB90E', 'PercentileLo2Hi',  'Statistical\PercentileLo2Hi',  'Percent',         0,                    1,         1,              null)
,('PercentileHi2Lo',    '14255EE3-CF30-4AD0-B555-6477A2942751', 'PercentileHi2Lo',  'Statistical\PercentileHi2Lo',  'Percent',         0,                    1,         1,              null)
--,('RowNum',           '1324F644-2689-4045-8C02-8C7EB6A90789', 'RowNum',           'Statistical\RowNum',           '#,##0.0000',      1,                    2,         1,              null)
,('+',                  '0E30A859-54D4-4811-9485-F42E7E8DA5F7', 'Add',              'Statistical\Add',              '#,##0.0000',      0,                    2,         0,              @formula_add)
,('-',                  'B5347DE3-732D-41F4-A1B5-D71DE4F1B6CD', 'Subtract',         'Statistical\Subtract',         '#,##0.0000',      1,                    2,         0,              @formula_subtract)
,('Divide',             'EE4CD7C4-C00C-4415-979E-CC1E2D6FA033', 'Divide',           'Statistical\Divide',           '#,##0.0000',      1,                    2,         0,              null)
,('Divide',             '32BC3EF0-165A-41AC-977A-780FE7895B54', 'Percent',          'Statistical\Percent',          'Percent',         1,                    2,         0,              null)
,('*',                  '1D560B67-3B9C-4D72-A036-7A693065057E', 'Multiply',         'Statistical\Multiply',         '#,##0.0000',      0,                    2,         0,              @formula_multiplay)
,('Quartile1st',        '2A151C3C-D549-4E64-83B0-D838EC7D5659', '1st Quartile',     'Statistical\Quartile',         '#,##0.0000',      0,                    2,         0,              @formula_multiplay)
,('Quartile3rd',        '945FAF99-0180-4AB2-B68F-E8801FD086B8', '3rd Quartile',     'Statistical\Quartile',         '#,##0.0000',      0,                    2,         0,              @formula_multiplay)


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
delete from gm
from 
    dbo.tblGeneratedMeasures gm
    join #functions f
        on gm.GroupingGuid = f._GroupingGuid
where 
    @func_name is null
    or @func_name = f._func_name


--********************************************************************
--********************************************************************
--********************************************************************
--********************************************************************
declare @MeasureDefinitionName nvarchar(max) = N'DStat_<<_FriendlyName>>_<<MeasurePosition>>_<<NullTreatment>>_<<ParamOrder>><<ExtBehavior>>'

declare @FuncParams_X NVARCHAR(MAX) = N'    <<NullToZero_Start>>axis(0).item(<<P0>>)<<NullToZero_End>>'

declare @FuncParams_X_ExtB NVARCHAR(MAX) = N'    <<NullToZero_Start>>axis(0).item(<<P0>>)<<NullToZero_End>>,
    <<ExtBehavior>>'

declare @FuncParams_XY NVARCHAR(MAX) = N'    <<NullToZero_Start>>axis(0).item(<<P0>>)<<NullToZero_End>>,
    <<NullToZero_Start>>axis(0).item(<<P1>>)<<NullToZero_End>>'

declare @FuncParams_XY_ExtB NVARCHAR(MAX) = N'    <<NullToZero_Start>>axis(0).item(<<P0>>)<<NullToZero_End>>,
    <<NullToZero_Start>>axis(0).item(<<P1>>)<<NullToZero_End>>,
    <<ExtBehavior>>'

declare @FuncParams_XYZ NVARCHAR(MAX) = N'    <<NullToZero_Start>>axis(0).item(<<P0>>)<<NullToZero_End>>,
    <<NullToZero_Start>>axis(0).item(<<P1>>)<<NullToZero_End>>,
    <<NullToZero_Start>>axis(0).item(<<P2>>)<<NullToZero_End>>'

declare @FuncParams_XYZ_ExtB NVARCHAR(MAX) = N'    <<NullToZero_Start>>axis(0).item(<<P0>>)<<NullToZero_End>>,
    <<NullToZero_Start>>axis(0).item(<<P1>>)<<NullToZero_End>>,
    <<NullToZero_Start>>axis(0).item(<<P2>>)<<NullToZero_End>>,
    <<ExtBehavior>>'

DECLARE @template_def NVARCHAR(MAX) = N'
CREATE MEMBER CURRENTCUBE.[Measures].[<<MeasureDefinitionName>>] AS 
iif(
iserror(
<<_func_name>>(
<<FunctionParams>>
    )
),
null,
<<_func_name>>(
<<FunctionParams>>
    )
)
,<<MEASURE_PROPERTIES>>;
'

DECLARE @template_def_with_set NVARCHAR(MAX) = N'
CREATE MEMBER CURRENTCUBE.[Measures].[<<MeasureDefinitionName>>] AS 
iif(iserror(
<<_func_name>>(Axis(1).Item(0).Item(0).Hierarchy.CurrentMember.siblings,
<<FunctionParams>>
    )
)
or cstr(
<<_func_name>>(Axis(1).Item(0).Item(0).Hierarchy.CurrentMember.siblings,
<<FunctionParams>>
    )
) = "-nan(ind)",
null,
<<_func_name>>(Axis(1).Item(0).Item(0).Hierarchy.CurrentMember.siblings,
<<FunctionParams>>
    )
)
,<<MEASURE_PROPERTIES>>;
'


DECLARE @template_formula NVARCHAR(MAX) = 
N'
CREATE MEMBER CURRENTCUBE.[Measures].[<<MeasureDefinitionName>>] AS 
<<formula>>
,<<MEASURE_PROPERTIES>>;
'


DECLARE @template_percentile_exclude_nulls_unknown NVARCHAR(MAX) = 
N'
CREATE MEMBER CURRENTCUBE.[Measures].[<<MeasureDefinitionName>>] as
IIF(isempty(axis(0).item(<<P0>>))
	or (
		Axis(1).Item(0).Item(Axis(1).Item(0).Count - 1).Hierarchy.levels(0).name = "(All)"
		and Axis(1).Item(0).Item(Axis(1).Item(0).Count - 1).Hierarchy.CURRENTMEMBER.level.ordinal = 0
	)
	or Axis(1).Item(0).Item(Axis(1).Item(0).Count - 1).Hierarchy.CURRENTMEMBER is Axis(1).Item(0).Item(Axis(1).Item(0).Count - 1).Hierarchy.UNKNOWNMEMBER,
	NULL,
	<<FlipPercentile>>Divide(
		RANK(
			Axis(1).Item(0).Item(Axis(1).Item(0).Count - 1).Hierarchy.CURRENTMEMBER, 
			except(Axis(1).Item(0).Item(Axis(1).Item(0).Count - 1).Hierarchy.currentmember.siblings, Axis(1).Item(0).Item(Axis(1).Item(0).Count - 1).Hierarchy.UNKNOWNMEMBER), 
			axis(0).item(<<P0>>)
		) - 1.0
	    ,
		filter(
            except(Axis(1).Item(0).Item(Axis(1).Item(0).Count - 1).Hierarchy.currentmember.siblings, Axis(1).Item(0).Item(Axis(1).Item(0).Count - 1).Hierarchy.UNKNOWNMEMBER), 
            not isempty(axis(0).item(<<P0>>))
        ).count - 1.0
	)
)
,<<MEASURE_PROPERTIES>>;
'


DECLARE @template_percentile_include_nulls_unknown NVARCHAR(MAX) = 
N'
CREATE MEMBER CURRENTCUBE.[Measures].[<<MeasureDefinitionName>>] as
IIF((
		Axis(1).Item(0).Item(Axis(1).Item(0).Count - 1).Hierarchy.levels(0).name = "(All)"
		and Axis(1).Item(0).Item(Axis(1).Item(0).Count - 1).Hierarchy.CURRENTMEMBER.level.ordinal = 0
	),
	NULL,
	<<FlipPercentile>>Divide(
		RANK(
			Axis(1).Item(0).Item(Axis(1).Item(0).Count - 1).Hierarchy.CURRENTMEMBER, 
			Axis(1).Item(0).Item(Axis(1).Item(0).Count - 1).Hierarchy.currentmember.siblings, 
			axis(0).item(<<P0>>)
		) - 1.0
	    ,
		(
            Axis(1).Item(0).Item(Axis(1).Item(0).Count - 1).Hierarchy.currentmember.siblings,
            axis(0).item(<<P0>>)
        ).count - 1.0
	)
)
,<<MEASURE_PROPERTIES>>;
'

DECLARE @template_row_number NVARCHAR(MAX) = 
N'CREATE MEMBER CURRENTCUBE.[Measures].[DStat_RowNumber] AS
Rank(
	StrToTuple(
		"( " +
		Generate(
			Head(Axis(1), Axis(1).Item(0).Count ) AS RN,
			"Axis(1).Item(0).Item(" + CStr( RN.CurrentOrdinal - 1 ) + ").Hierarchy.CurrentMember",
			", "
		) +
		" )"
	),
	Axis(1)
)
,VISIBLE=1, DISPLAY_FOLDER=''Statistical\Row Number'', FORMAT_STRING=''#,##0'';
'


--********************************************************************
--********************************************************************
--********************************************************************
--********************************************************************
-- debug
--SET NOCOUNT Off


DROP TABLE IF EXISTS #t


select distinct
    MeasureDefinitionName = replace(replace(replace(replace(replace(
        @MeasureDefinitionName,
        '<<_FriendlyName>>',    f._FriendlyName),
        '<<MeasurePosition>>',  mp.code),
        '<<NullTreatment>>',    nt.code),
        '<<ParamOrder>>',       pp.code),
        '<<ExtBehavior>>',      isnull(extb.MeasureNameSuffix, ''))
    
    ,FunctionParams =
        iif(extb.OptionalParam is null,
            case f._NumParams
                when 1 then @FuncParams_X
                when 2 then @FuncParams_XY
                when 3 then @FuncParams_XYZ
            end,
            case f._NumParams
                when 1 then @FuncParams_X_ExtB
                when 2 then @FuncParams_XY_ExtB
                when 3 then @FuncParams_XYZ_ExtB
            end
        )

    ,template = replace(
        case    
            when f._func_name = 'PercentileHi2Lo' and nt.code = 'N' then 
                replace(@template_percentile_exclude_nulls_unknown, '<<FlipPercentile>>', '')
            when f._func_name = 'PercentileHi2Lo' and nt.code = '0' then 
                replace(@template_percentile_include_nulls_unknown, '<<FlipPercentile>>', '')
            when f._func_name = 'PercentileLo2Hi' and nt.code = 'N' then 
                replace(@template_percentile_exclude_nulls_unknown, '<<FlipPercentile>>', '1.0 - ')
            when f._func_name = 'PercentileLo2Hi' and nt.code = '0' then 
                replace(@template_percentile_include_nulls_unknown, '<<FlipPercentile>>', '1.0 - ')
            when f._Formula is not null then replace(@template_formula, '<<formula>>', f._Formula)
            when f._FunctNeedsSet = 1 then replace(@template_def_with_set, '<<_func_name>>', f._func_name)
            when f._FunctNeedsSet = 0 then replace(@template_def, '<<_func_name>>', f._func_name)
        end,
        '<<MEASURE_PROPERTIES>>', [dbo].[ufn_CreateMeasureProperties](1, f._DISPLAY_FOLDER, f._FORMAT_STRING, NULL, NULL, NULL)
        )
    ,f.functions_id
    ,pp.param_permutations_id
    ,extb.extended_behaviors_id
    ,mp.measure_position_id
    ,nt.null_treatment_id
into #t
from
    #functions f
    join #param_permutations pp
        on f._NumParams = pp.num_params
            and (
                f._SupportsPermutations = 1
                or (f._SupportsPermutations = 0 and pp.is_permutation = 0)
            )
    left join #extended_behaviors extb
        on f._func_name = extb._func_name
    cross join #measure_position mp
    cross join #null_treatment nt


--*************************************************************************************************
--*************************************************************************************************
--*************************************************************************************************
--*************************************************************************************************
update t
set
    t.template = replace(replace(replace(replace(replace(t.template, 
        '<<MeasureDefinitionName>>', t.MeasureDefinitionName),
        '<<FunctionParams>>', t.FunctionParams),
        '<<ExtBehavior>>', isnull(extb.OptionalParam, '')),
        '<<NullToZero_Start>>', iif(nt.convert_null_to_zero = 1, 'CoalesceEmpty(', '')),
        '<<NullToZero_End>>', iif(nt.convert_null_to_zero = 1, ', 0)', ''))
from
    #t t
    join #null_treatment nt
        on t.null_treatment_id = nt.null_treatment_id
    left join #extended_behaviors extb
        on t.extended_behaviors_id = extb.extended_behaviors_id
    

--*************************************************************************************************
--*************************************************************************************************
--*************************************************************************************************
--*************************************************************************************************
declare @max_params int = (select max(_NumParams) from #functions)
declare @cur_param_count int = 0

while @cur_param_count < @max_params
begin
    update t
    set
        template = replace(template, 
            concat('<<P', pph.caller_pos, '>>')
            ,case mp.code
                when 'FP' then concat('', pph.offset_first_pos)
                when 'LP' then concat(mp.algo_measure_pos, ' ', pph.offset_last_pos)
                when 'LO' then concat(mp.algo_measure_pos, ' ', pph.offset_left_pos)
                when 'RO' then concat(mp.algo_measure_pos, ' + ', pph.offset_right_pos)
            end
            )
    from
        #t t

        join #param_permutations_helper pph
            on t.param_permutations_id = pph.param_permutations_id
    
        join #measure_position mp
            on t.measure_position_id = mp.measure_position_id
    where
        pph.caller_pos = @cur_param_count


    set @cur_param_count = @cur_param_count +1
end


--*************************************************************************************************
--*************************************************************************************************
--*************************************************************************************************
--*************************************************************************************************
select
    q.*
from
    (
    select 
        template as [--dynamic measure definitions]
    from 
        #t
    union all
    select @template_row_number
    ) q
order by 1


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

