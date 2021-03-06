SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view dbo.OptimizeDimensionAttributeBasedOnCardinality
as
--   select * from dbo.OptimizeDimensionAttributeBasedOnCardinality

select
    l.dimension_unique_name
    ,l.level_unique_name
    ,l.level_cardinality
    ,d.dimension_cardinality
    ,l.level_cardinality / d.dimension_cardinality as CardinalityRatio
    ,case
        when (l.level_cardinality / d.dimension_cardinality) >= 0.8 then cast(1 as bit)
        else cast(0 as bit)
    end as DoNotOptimize
from
    [dbo].[tblCube_Dimensions] d
    join [dbo].[tblCube_Levels] l
        on d.dimension_unique_name = l.dimension_unique_name
where
    l.dimension_unique_name = '[Sales Reason]'
    and l.level_number > 0
    --and (l.level_cardinality / d.dimension_cardinality) >= 0.8


GO
