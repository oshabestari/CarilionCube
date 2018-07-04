SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[usp_MeasureGenerator_PercentRank]
as

SET NOCOUNT on


DECLARE @template NVARCHAR(MAX) = 
N'


/* Procedurally generated code via sproc dbo.usp_MeasureGenerator_PercentRank */
create member CURRENTCUBE.[Measures].[<<measure_name>> - PercentRank Including Null All] as
IIF((count((Axis(1).Item(0).Item(Axis(1).Item(0).Count - 1).Hierarchy.members, <<measure_unique_name>>)) - 1.0) <= 1,
	NULL,
	1.0 - (
		RANK(Axis(1).Item(0).Item(Axis(1).Item(0).Count - 1).Hierarchy.CURRENTMEMBER, 
			Axis(1).Item(0).Item(Axis(1).Item(0).Count - 1).Hierarchy.members, 
			<<measure_unique_name>>
		) -1.0
	) / (count((Axis(1).Item(0).Item(Axis(1).Item(0).Count - 1).Hierarchy.members, <<measure_unique_name>>)) - 1.0)
),FORMAT_STRING = "Percent", VISIBLE = 1, DISPLAY_FOLDER=''PercentRank Including Null All'', ASSOCIATED_MEASURE_GROUP = ''<<measuregroup_name>>'';


/* Procedurally generated code via sproc dbo.usp_MeasureGenerator_PercentRank */
create member CURRENTCUBE.[Measures].[<<measure_name>> - PercentRank Excluding Null All] as
IIF(count((Axis(1).Item(0).Item(Axis(1).Item(0).Count - 1).Hierarchy.members, <<measure_unique_name>>)) <= 1
	or Axis(1).Item(0).Item(Axis(1).Item(0).Count - 1).Hierarchy.CURRENTMEMBER is Axis(1).Item(0).Item(Axis(1).Item(0).Count - 1).Hierarchy.DEFAULTMEMBER
	or Axis(1).Item(0).Item(Axis(1).Item(0).Count - 1).Hierarchy.CURRENTMEMBER is Axis(1).Item(0).Item(Axis(1).Item(0).Count - 1).Hierarchy.UNKNOWNMEMBER,
	NULL,
	1.0 - (
		RANK(
			Axis(1).Item(0).Item(Axis(1).Item(0).Count - 1).Hierarchy.CURRENTMEMBER, 
			except(Axis(1).Item(0).Item(Axis(1).Item(0).Count - 1).Hierarchy.members, { Axis(1).Item(0).Item(Axis(1).Item(0).Count - 1).Hierarchy.DEFAULTMEMBER, Axis(1).Item(0).Item(Axis(1).Item(0).Count - 1).Hierarchy.UNKNOWNMEMBER }), 
			<<measure_unique_name>>
		) - 1.0
	) / (
		count(
			(
				except(Axis(1).Item(0).Item(Axis(1).Item(0).Count - 1).Hierarchy.members, { Axis(1).Item(0).Item(Axis(1).Item(0).Count - 1).Hierarchy.DEFAULTMEMBER, Axis(1).Item(0).Item(Axis(1).Item(0).Count - 1).Hierarchy.UNKNOWNMEMBER }),
				<<measure_unique_name>>
			)
		) - 1.0
	)
),FORMAT_STRING = "Percent", VISIBLE = 1, DISPLAY_FOLDER=''PercentRank Excluding Null All'', ASSOCIATED_MEASURE_GROUP = ''<<measuregroup_name>>'';
'

SELECT
    REPLACE(REPLACE(REPLACE(@template, 
        N'<<measure_name>>', m.measure_name), 
        N'<<measure_unique_name>>', m.measure_unique_name), 
        N'<<measuregroup_name>>', m.measuregroup_name)
    --m.measuregroup_name, m.measure_name
FROM
    [dbo].[tblCube_Measures] m
where
    m.cube_name = 'analytics'
    AND m.[measure_name] LIKE '%count'
    --and m.measure_unique_name = '[Measures].[ED Visit - Count]'
ORDER BY
    m.cube_name
    ,m.measuregroup_name
    ,m.[measure_name]
    
GO
