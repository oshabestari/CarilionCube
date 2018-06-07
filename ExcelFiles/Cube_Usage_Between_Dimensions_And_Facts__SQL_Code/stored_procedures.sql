USE [carilion_dw]
GO

/****** Object:  StoredProcedure [dbo].[usp_Cube_Load_Metadata]    Script Date: 6/7/2018 1:01:26 PM ******/
DROP PROCEDURE [dbo].[usp_Cube_Load_Metadata]
GO

/****** Object:  StoredProcedure [dbo].[usp_Cube_Load_Metadata]    Script Date: 6/7/2018 1:01:26 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




CREATE PROC [dbo].[usp_Cube_Load_Metadata]
AS


TRUNCATE TABLE dbo.tblCube_Data_Types
TRUNCATE TABLE dbo.tblCube_Dimension_Type
TRUNCATE TABLE dbo.tblCube_Dimensions
TRUNCATE TABLE dbo.tblCube_Measure_Aggregator
TRUNCATE TABLE dbo.tblCube_Measure_Group_vs_Dimensions
TRUNCATE TABLE dbo.tblCube_Measure_Groups
TRUNCATE TABLE dbo.tblCube_Measures
TRUNCATE TABLE dbo.tblCube_Usage_Between_Dimensions_And_Facts



INSERT INTO dbo.tblCube_Data_Types(type_name, data_type, column_size, literal_prefix, literal_suffix, create_params, is_nullable, case_sensitive, searchable, unsigned_attribute, fixed_prec_scale, auto_unique_value, local_type_name, minimum_scale, maximum_scale, guid, typelib, version, is_long, best_match, is_fixedlength) 
SELECT type_name, data_type, column_size, literal_prefix, literal_suffix, create_params, is_nullable, case_sensitive, searchable, unsigned_attribute, fixed_prec_scale, auto_unique_value, local_type_name, minimum_scale, maximum_scale, guid, typelib, version, is_long, best_match, is_fixedlength 
FROM dbo.Cube_Data_Types

INSERT INTO dbo.tblCube_Dimension_Type(dimension_type, dimension_type_name) 
SELECT dimension_type, dimension_type_name 
FROM dbo.Cube_Dimension_Type

INSERT INTO dbo.tblCube_Dimensions(cube_name, dimension_unique_name, hierarchy_name, hierarchy_unique_name, hierarchy_caption, dimension_type, hierarchy_cardinality, default_member, all_member, hierarchy_ordinal, dimension_is_shared, hierarchy_is_visible, hierarchy_origin, hierarchy_display_folder) 
SELECT cube_name, dimension_unique_name, hierarchy_name, hierarchy_unique_name, hierarchy_caption, dimension_type, hierarchy_cardinality, default_member, all_member, hierarchy_ordinal, dimension_is_shared, hierarchy_is_visible, hierarchy_origin, hierarchy_display_folder 
FROM dbo.Cube_Dimensions

INSERT INTO dbo.tblCube_Measure_Aggregator(measure_aggregator, measure_aggregator_name) 
SELECT measure_aggregator, measure_aggregator_name 
FROM dbo.Cube_Measure_Aggregator

INSERT INTO dbo.tblCube_Measure_Group_vs_Dimensions(catalog_name, cube_name, schema_name, measuregroup_name, measuregroup_cardinality, dimension_unique_name, dimension_granularity, dimension_cardinality, dimension_is_visible, dimension_is_fact_dimension) 
SELECT catalog_name, cube_name, schema_name, measuregroup_name, measuregroup_cardinality, dimension_unique_name, dimension_granularity, dimension_cardinality, dimension_is_visible, dimension_is_fact_dimension 
FROM dbo.Cube_Measure_Group_vs_Dimensions

INSERT INTO dbo.tblCube_Measure_Groups(cube_name, measuregroup_name, measure_display_folder, measure_name, measure_unique_name, measure_caption, measure_is_visible, data_type, measure_aggregator, expression, default_format_string) 
SELECT cube_name, measuregroup_name, measure_display_folder, measure_name, measure_unique_name, measure_caption, measure_is_visible, data_type, measure_aggregator, expression, default_format_string 
FROM dbo.Cube_Measure_Groups

INSERT INTO dbo.tblCube_Measures(cube_name, measuregroup_name, measure_display_folder, measure_name, measure_unique_name, measure_caption, measure_is_visible, data_type, measure_aggregator, expression, default_format_string) 
SELECT cube_name, measuregroup_name, measure_display_folder, measure_name, measure_unique_name, measure_caption, measure_is_visible, data_type, measure_aggregator, expression, default_format_string 
FROM dbo.Cube_Measures

INSERT INTO dbo.tblCube_Usage_Between_Dimensions_And_Facts(_cube_name, _measuregroup_name, _measure_display_folder, _measure_name, _measure_unique_name, _measure_caption, _measure_is_visible, _type_name, _measure_aggregator_name, _expression, _default_format_string, _does_measure_caption_match_measure_name, _measuregroup_cardinality, _dimension_unique_name, _dimension_granularity, _dimension_cardinality, _dimension_is_visible, _dimension_is_fact_dimension, _hierarchy_name, _hierarchy_unique_name, _hierarchy_caption, _dimension_type, _hierarchy_cardinality, _default_member, _all_member, _hierarchy_ordinal, _dimension_is_shared, _hierarchy_is_visible, _hierarchy_origin, _hierarchy_display_folder) 
SELECT _cube_name, _measuregroup_name, _measure_display_folder, _measure_name, _measure_unique_name, _measure_caption, _measure_is_visible, _type_name, _measure_aggregator_name, _expression, _default_format_string, _does_measure_caption_match_measure_name, _measuregroup_cardinality, _dimension_unique_name, _dimension_granularity, _dimension_cardinality, _dimension_is_visible, _dimension_is_fact_dimension, _hierarchy_name, _hierarchy_unique_name, _hierarchy_caption, _dimension_type, _hierarchy_cardinality, _default_member, _all_member, _hierarchy_ordinal, _dimension_is_shared, _hierarchy_is_visible, _hierarchy_origin, _hierarchy_display_folder 
FROM dbo.Cube_Usage_Between_Dimensions_And_Facts





GO


