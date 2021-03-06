SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION dbo.ufn_LevelOrigin_ReturnBitwiseFlagDescription(
    @level_origin int
    )
RETURNS 
@level_origin_description TABLE 
(
	level_origin_bitwise_flag int not null,
    level_origin_description nvarchar(100) not null,
    level_origin_description_plus_hex_value nvarchar(100) not null
)
AS
BEGIN
    insert into @level_origin_description(level_origin_bitwise_flag, level_origin_description, level_origin_description_plus_hex_value)
	select 
        0x1
        ,'MD_ORIGIN_USER_DEFINED'
        ,'MD_ORIGIN_USER_DEFINED (0x1)'
    where
        (@level_origin & 0x1) = 0x1
    union all
	select 
        0x2
        ,'MD_ORIGIN_ATTRIBUTE'
        ,'MD_ORIGIN_ATTRIBUTE (0x2)'
    where
        (@level_origin & 0x2) = 0x2
    union all
	select 
        0x4
        ,'MD_ORIGIN_KEY_ATTRIBUTE'
        ,'MD_ORIGIN_KEY_ATTRIBUTE (0x4)'
    where
        (@level_origin & 0x4) = 0x4
    union all
	select 
        0x8
        ,'MD_ORIGIN_INTERNAL'
        ,'MD_ORIGIN_INTERNAL (0x8)'
    where
        (@level_origin & 0x8) = 0x8

	RETURN 
END
GO
