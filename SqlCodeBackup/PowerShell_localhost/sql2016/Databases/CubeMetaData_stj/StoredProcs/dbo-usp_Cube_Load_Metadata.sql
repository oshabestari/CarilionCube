SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROC [dbo].[usp_Cube_Load_Metadata]
AS

set nocount on

truncate table dbo.tblCube_Data_Types
truncate table dbo.tblCube_Dimension_Type
truncate table dbo.tblCube_Dimensions
truncate table dbo.tblCube_Hierarchies
truncate table dbo.tblCube_Levels
truncate table dbo.tblCube_Measure_Aggregator
truncate table dbo.tblCube_Measure_Group_vs_Dimensions
truncate table dbo.tblCube_Measure_Groups
truncate table dbo.tblCube_Measures
truncate table dbo.tblCube_Usage_Between_Dimensions_And_Facts



insert into dbo.tblCube_Data_Types(type_name, data_type, column_size, literal_prefix, literal_suffix, create_params, is_nullable, case_sensitive, searchable, unsigned_attribute, fixed_prec_scale, auto_unique_value, local_type_name, minimum_scale, maximum_scale, guid, typelib, version, is_long, best_match, is_fixedlength) 
select type_name, data_type, column_size, literal_prefix, literal_suffix, create_params, is_nullable, case_sensitive, searchable, unsigned_attribute, fixed_prec_scale, auto_unique_value, local_type_name, minimum_scale, maximum_scale, guid, typelib, version, is_long, best_match, is_fixedlength 
from dbo.Cube_Data_Types

insert into dbo.tblCube_Dimension_Type(dimension_type, dimension_type_name) 
select dimension_type, dimension_type_name 
from dbo.Cube_Dimension_Type

insert into dbo.tblCube_Dimensions([cube_name], [dimension_name], [dimension_unique_name], [dimension_caption], [default_hierarchy], [description], [dimension_master_name], [dimension_ordinal], [dimension_type], [dimension_cardinality], [is_virtual], [is_readwrite], [dimension_unique_settings], [dimension_is_visible]) 
select [cube_name], [dimension_name], [dimension_unique_name], [dimension_caption], [default_hierarchy], [description], [dimension_master_name], [dimension_ordinal], [dimension_type], [dimension_cardinality], [is_virtual], [is_readwrite], [dimension_unique_settings], [dimension_is_visible]
from dbo.Cube_Dimensions

insert into dbo.tblCube_Hierarchies([cube_name], [dimension_unique_name], [hierarchy_name], [hierarchy_unique_name], [hierarchy_caption], [dimension_type], [hierarchy_cardinality], [default_member], [all_member], [description], [structure], [is_virtual], [is_readwrite], [dimension_unique_settings], [dimension_master_unique_name], [dimension_is_visible], [hierarchy_ordinal], [dimension_is_shared], [hierarchy_is_visible], [hierarchy_origin], [hierarchy_display_folder], [instance_selection], [grouping_behavior], [structure_type]) 
select [cube_name], [dimension_unique_name], [hierarchy_name], [hierarchy_unique_name], [hierarchy_caption], [dimension_type], [hierarchy_cardinality], [default_member], [all_member], [description], [structure], [is_virtual], [is_readwrite], [dimension_unique_settings], [dimension_master_unique_name], [dimension_is_visible], [hierarchy_ordinal], [dimension_is_shared], [hierarchy_is_visible], [hierarchy_origin], [hierarchy_display_folder], [instance_selection], [grouping_behavior], [structure_type]
from dbo.Cube_Hierarchies

insert into dbo.tblCube_Levels([cube_name], [dimension_unique_name], [hierarchy_unique_name], [level_name], [level_unique_name], [level_caption], [level_ordering_property], [description], [level_master_unique_name], [level_name_sql_column_name], [level_key_sql_column_name], [level_unique_name_sql_column_name], [level_attribute_hierarchy_name], [level_type_name], [custom_rollup_settings_name], [level_unique_settings_name], [level_origin_name], [level_number], [level_cardinality], [level_type], [custom_rollup_settings], [level_unique_settings], [level_is_visible], [level_dbtype], [level_key_cardinality], [level_origin])
select [cube_name], [dimension_unique_name], [hierarchy_unique_name], [level_name], [level_unique_name], [level_caption], [level_ordering_property], [description], [level_master_unique_name], [level_name_sql_column_name], [level_key_sql_column_name], [level_unique_name_sql_column_name], [level_attribute_hierarchy_name], [level_type_name], [custom_rollup_settings_name], [level_unique_settings_name], [level_origin_name], [level_number], [level_cardinality], [level_type], [custom_rollup_settings], [level_unique_settings], [level_is_visible], [level_dbtype], [level_key_cardinality], [level_origin]
from dbo.Cube_Levels

insert into dbo.tblCube_Measure_Aggregator(measure_aggregator, measure_aggregator_name) 
select measure_aggregator, measure_aggregator_name 
from dbo.Cube_Measure_Aggregator

insert into dbo.tblCube_Measure_Group_vs_Dimensions(catalog_name, cube_name, schema_name, measuregroup_name, measuregroup_cardinality, dimension_unique_name, dimension_granularity, dimension_cardinality, dimension_is_visible, dimension_is_fact_dimension) 
select catalog_name, cube_name, schema_name, measuregroup_name, measuregroup_cardinality, dimension_unique_name, dimension_granularity, dimension_cardinality, dimension_is_visible, dimension_is_fact_dimension 
from dbo.Cube_Measure_Group_vs_Dimensions

insert into dbo.tblCube_Measure_Groups(cube_name, measuregroup_name, measure_display_folder, measure_name, measure_unique_name, measure_caption, measure_is_visible, data_type, measure_aggregator, expression, default_format_string) 
select cube_name, measuregroup_name, measure_display_folder, measure_name, measure_unique_name, measure_caption, measure_is_visible, data_type, measure_aggregator, expression, default_format_string 
from dbo.Cube_Measure_Groups

insert into dbo.tblCube_Measures(cube_name, measuregroup_name, measure_display_folder, measure_name, measure_unique_name, measure_caption, measure_is_visible, data_type, measure_aggregator, expression, default_format_string) 
select cube_name, measuregroup_name, measure_display_folder, measure_name, measure_unique_name, measure_caption, measure_is_visible, data_type, measure_aggregator, expression, default_format_string 
from dbo.Cube_Measures

insert into dbo.tblCube_Usage_Between_Dimensions_And_Facts([cube_name], [measuregroup_name], [measure_display_folder], [measure_name], [measure_unique_name], [measure_caption], [measure_is_visible], [type_name], [measure_aggregator_name], [expression], [default_format_string], [does_measure_caption_match_measure_name], [measuregroup_cardinality], [dimension_unique_name], [dimension_granularity], [dimension_cardinality], [dimension_is_visible], [dimension_is_fact_dimension], [hierarchy_name], [hierarchy_unique_name], [hierarchy_caption], [dimension_type_name], [hierarchy_cardinality], [default_member], [all_member], [hierarchy_ordinal], [dimension_is_shared], [hierarchy_is_visible], [hierarchy_origin], [hierarchy_display_folder], [dimension_name], [dimension_caption], [default_hierarchy], [description], [dimension_master_name], [dimension_ordinal], [dimension_type], [dimension_is_virtual], [dimension_is_readwrite], [dimension_unique_settings], [level_name], [level_unique_name], [level_caption], [level_ordering_property], [level_description], [level_master_unique_name], [level_name_sql_column_name], [level_key_sql_column_name], [level_unique_name_sql_column_name], [level_attribute_hierarchy_name], [level_type_name], [custom_rollup_settings_name], [level_unique_settings_name], [level_origin_name], [level_number], [level_cardinality], [level_type], [custom_rollup_settings], [level_unique_settings], [level_is_visible], [level_dbtype], [level_key_cardinality], [level_origin]) 
select [cube_name], [measuregroup_name], [measure_display_folder], [measure_name], [measure_unique_name], [measure_caption], [measure_is_visible], [type_name], [measure_aggregator_name], [expression], [default_format_string], [does_measure_caption_match_measure_name], [measuregroup_cardinality], [dimension_unique_name], [dimension_granularity], [dimension_cardinality], [dimension_is_visible], [dimension_is_fact_dimension], [hierarchy_name], [hierarchy_unique_name], [hierarchy_caption], [dimension_type_name], [hierarchy_cardinality], [default_member], [all_member], [hierarchy_ordinal], [dimension_is_shared], [hierarchy_is_visible], [hierarchy_origin], [hierarchy_display_folder], [dimension_name], [dimension_caption], [default_hierarchy], [description], [dimension_master_name], [dimension_ordinal], [dimension_type], [dimension_is_virtual], [dimension_is_readwrite], [dimension_unique_settings], [level_name], [level_unique_name], [level_caption], [level_ordering_property], [level_description], [level_master_unique_name], [level_name_sql_column_name], [level_key_sql_column_name], [level_unique_name_sql_column_name], [level_attribute_hierarchy_name], [level_type_name], [custom_rollup_settings_name], [level_unique_settings_name], [level_origin_name], [level_number], [level_cardinality], [level_type], [custom_rollup_settings], [level_unique_settings], [level_is_visible], [level_dbtype], [level_key_cardinality], [level_origin]
from dbo.Cube_Usage_Between_Dimensions_And_Facts


exec [util].[usp_FixData_Cube_Tables]
GO
