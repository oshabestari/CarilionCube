SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create PROCEDURE [dbo].[usp_MeasureGenerator_Rank]
as

SET NOCOUNT on


DECLARE @template NVARCHAR(MAX) = 
N'

/* Procedurally generated code via sproc dbo.usp_MeasureGenerator_Rank */

CREATE MEMBER CURRENTCUBE.[Measures].[ED Visit - Means of Arrival - RegularRank]
AS 
IIF(
    ([Measures].[ED Visit - Count])=0 OR
        (Axis(1).Item(0).Item(Axis(1).Item(0).Count-1).CURRENTMEMBER.Name) = ''All'' OR
        ([ED Visit].[ED Visit - Means of Arrival].CURRENTMEMBER.Name) = ''Unknown'',
    NULL,
    RANK([ED Visit].[ED Visit - Means of Arrival].CURRENTMEMBER,
        ORDER(
            FILTER([ED Visit].[ED Visit - Means of Arrival].MEMBERS,
                [ED Visit].[ED Visit - Means of Arrival].CURRENTMEMBER.Name <> ''All'' and
                    [ED Visit].[ED Visit - Means of Arrival].CURRENTMEMBER.Name <> ''Unknown''
            ), 
            [Measures].[ED Visit - Count], DESC
        )
    )
)
,FORMAT_STRING = "#,###", 
VISIBLE = 1 ,  ASSOCIATED_MEASURE_GROUP = ''<<MEASURE_GROUP>>''; 


CREATE MEMBER CURRENTCUBE.[Measures].[ED Visit - Means of Arrival - TiedRank]
as
IIF(
    ([Measures].[ED Visit - Count])=0 OR
        ([ED Visit].[ED Visit - Means of Arrival].CURRENTMEMBER.Name) = ''All'' OR
        ([ED Visit].[ED Visit - Means of Arrival].CURRENTMEMBER.Name) = ''Unknown'',
    NULL,
    (
        [Measures].[ED Visit - Means of Arrival - RegularRank], 
        GENERATE(
            {
                INTERSECT(
                    {ORDER([ED Visit].[ED Visit - Means of Arrival].MEMBERS, [Measures].[ED Visit - Count], BDESC).ITEM(0)} AS FIRSTTIE,
                    {}
                ),
                ORDER([ED Visit].[ED Visit - Means of Arrival].MEMBERS, [Measures].[ED Visit - Count], BDESC)
            } AS [OrderedSet2], 
            IIF(
                ({[OrderedSet2].CURRENT AS CURRATTRIB}.ITEM(0),[Measures].[ED Visit - Count]) = ({[OrderedSet2].ITEM([OrderedSet2].CURRENTORDINAL-2) AS PREVATTRIB}.ITEM(0),[Measures].[ED Visit - Count]),
                IIF(
                    (PREVATTRIB.ITEM(0), [Measures].[ED Visit - Count]) = (FIRSTTIE.ITEM(0), [Measures].[ED Visit - Count])
                    ,{FIRSTTIE}
                    ,{PREVATTRIB AS FIRSTTIE}
                ),
                {CURRATTRIB}
            ),
            ALL
        ).ITEM([Measures].[ED Visit - Means of Arrival - RegularRank]-1)
    )
)
,FORMAT_STRING = "#,###", 
VISIBLE = 1 ,  ASSOCIATED_MEASURE_GROUP = ''<<MEASURE_GROUP>>''; 
 
'

SELECT
    --REPLACE(REPLACE(@template, N'<<measure_name>>', m.measure_name), N'<<MEASURE_GROUP>>', m.measuregroup_name)
    m.measuregroup_name, m.measure_name
FROM
    [dbo].[tblCube_Measures] m
where
    m.cube_name = 'analytics'
    AND m.[measure_name] LIKE '%count'
ORDER BY
    m.cube_name
    ,m.measuregroup_name
    ,m.[measure_name]
    




/*

CREATE MEMBER CURRENTCUBE.[Measures].[ED Visit - Means of Arrival - RegularRank]
AS 
IIF(
    ([Measures].[ED Visit - Count])=0 OR
        ([ED Visit].[ED Visit - Means of Arrival].CURRENTMEMBER.Name) = ''All'' OR
        ([ED Visit].[ED Visit - Means of Arrival].CURRENTMEMBER.Name) = ''Unknown'',
    NULL,
    RANK([ED Visit].[ED Visit - Means of Arrival].CURRENTMEMBER,
        ORDER(
            FILTER([ED Visit].[ED Visit - Means of Arrival].MEMBERS,
                [ED Visit].[ED Visit - Means of Arrival].CURRENTMEMBER.Name <> ''All'' and
                    [ED Visit].[ED Visit - Means of Arrival].CURRENTMEMBER.Name <> ''Unknown''
            ), 
            [Measures].[ED Visit - Count], DESC
        )
    )
)
,FORMAT_STRING = "#,###", 
VISIBLE = 1 ,  ASSOCIATED_MEASURE_GROUP = ''<<MEASURE_GROUP>>''; 


CREATE MEMBER CURRENTCUBE.[Measures].[ED Visit - Means of Arrival - TiedRank]
as
IIF(
    ([Measures].[ED Visit - Count])=0 OR
        ([ED Visit].[ED Visit - Means of Arrival].CURRENTMEMBER.Name) = ''All'' OR
        ([ED Visit].[ED Visit - Means of Arrival].CURRENTMEMBER.Name) = ''Unknown'',
    NULL,
    (
        [Measures].[ED Visit - Means of Arrival - RegularRank], 
        GENERATE(
            {
                INTERSECT(
                    {ORDER([ED Visit].[ED Visit - Means of Arrival].MEMBERS, [Measures].[ED Visit - Count], BDESC).ITEM(0)} AS FIRSTTIE,
                    {}
                ),
                ORDER([ED Visit].[ED Visit - Means of Arrival].MEMBERS, [Measures].[ED Visit - Count], BDESC)
            } AS [OrderedSet2], 
            IIF(
                ({[OrderedSet2].CURRENT AS CURRATTRIB}.ITEM(0),[Measures].[ED Visit - Count]) = ({[OrderedSet2].ITEM([OrderedSet2].CURRENTORDINAL-2) AS PREVATTRIB}.ITEM(0),[Measures].[ED Visit - Count]),
                IIF(
                    (PREVATTRIB.ITEM(0), [Measures].[ED Visit - Count]) = (FIRSTTIE.ITEM(0), [Measures].[ED Visit - Count])
                    ,{FIRSTTIE}
                    ,{PREVATTRIB AS FIRSTTIE}
                ),
                {CURRATTRIB}
            ),
            ALL
        ).ITEM([Measures].[ED Visit - Means of Arrival - RegularRank]-1)
    )
)
,FORMAT_STRING = "#,###", 
VISIBLE = 1 ,  ASSOCIATED_MEASURE_GROUP = ''<<MEASURE_GROUP>>''; 
 
*/


GO
