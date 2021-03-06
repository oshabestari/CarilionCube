SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create FUNCTION dbo.ufn_CustomRollupSettings_ReturnBitwiseFlagDescription(
    @custom_rollup_settings int
    )
RETURNS 
@tbl TABLE 
(
	custom_rollup_settings_bitwise_flag int not null,
    custom_rollup_settings_description nvarchar(100) not null,
    custom_rollup_settings_description_plus_hex_value nvarchar(100) not null
)
AS
BEGIN
    insert into @tbl(custom_rollup_settings_bitwise_flag, custom_rollup_settings_description, custom_rollup_settings_description_plus_hex_value)
	select 
        0x0
        ,'NO_CUSTOM_ROLLUP'
        ,'NO_CUSTOM_ROLLUP (0x0)'
    where
        @custom_rollup_settings = 0x0
    union all
	select 
        0x1
        ,'MDLEVELS_CUSTOM_ROLLUP_EXPRESSION'
        ,'MDLEVELS_CUSTOM_ROLLUP_EXPRESSION (0x1)'
    where
        (@custom_rollup_settings & 0x1) = 0x1
    union all
	select 
        0x2
        ,'MDLEVELS_CUSTOM_ROLLUP_COLUMN'
        ,'MDLEVELS_CUSTOM_ROLLUP_COLUMN (0x2)'
    where
        (@custom_rollup_settings & 0x2) = 0x2
    union all
	select 
        0x4
        ,'MDLEVELS_SKIPPED_LEVELS'
        ,'MDLEVELS_SKIPPED_LEVELS (0x4)'
    where
        (@custom_rollup_settings & 0x4) = 0x4
    union all
	select 
        0x8
        ,'MDLEVELS_CUSTOM_MEMBER_PROPERTIES'
        ,'MDLEVELS_CUSTOM_MEMBER_PROPERTIES (0x8)'
    where
        (@custom_rollup_settings & 0x8) = 0x8
    union all
	select 
        0x10
        ,'MDLEVELS_UNARY_OPERATOR'
        ,'MDLEVELS_UNARY_OPERATOR (0x10)'
    where
        (@custom_rollup_settings & 0x10) = 0x10

	RETURN 
END
GO
