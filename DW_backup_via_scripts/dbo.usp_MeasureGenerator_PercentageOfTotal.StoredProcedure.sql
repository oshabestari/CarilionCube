USE [carilion_dw]
GO
set nocount on
GO

GO
/****** Object:  StoredProcedure [dbo].[usp_MeasureGenerator_PercentageOfTotal]    Script Date: 6/21/2018 11:44:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_MeasureGenerator_PercentageOfTotal]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[usp_MeasureGenerator_PercentageOfTotal] AS' 
END
GO


ALTER PROCEDURE [dbo].[usp_MeasureGenerator_PercentageOfTotal]
as

SET NOCOUNT on


DECLARE @template NVARCHAR(MAX) = 
N'

/* Procedurally generated code via sproc dbo.usp_MeasureGenerator_PercentageOfTotal */
CREATE MEMBER CURRENTCUBE.[Measures].[<<measure_name>> - Percentage Of Total]
 AS 
IIF(([Measures].[<<measure_name>>], Axis(1).Item(0).Item(Axis(1).Item(0).Count - 1).Hierarchy.CurrentMember.Parent) = 0, 
     null,
     [Measures].[<<measure_name>>]/([Measures].[<<measure_name>>], Axis(1).Item(0).Item(Axis(1).Item(0).Count - 1).Hierarchy.CurrentMember.Parent)
    )
,FORMAT_STRING = "Percent", 
VISIBLE = 1 ,  ASSOCIATED_MEASURE_GROUP = ''<<MEASURE_GROUP>>'';

'

SELECT
    REPLACE(REPLACE(@template, N'<<measure_name>>', m.measure_name), N'<<MEASURE_GROUP>>', m.measuregroup_name)
    --m.measuregroup_name, m.measure_name
FROM
    [dbo].[tblCube_Measures] m
where
    m.cube_name = 'analytics'
    AND m.[measure_name] LIKE '%count'
ORDER BY
    m.cube_name
    ,m.measuregroup_name
    ,m.[measure_name]
    
GO
