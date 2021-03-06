SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE VIEW [dbo].[Cube_Dimension_Type]
AS
--     select * from dbo.Cube_Dimension_Type
SELECT 0  AS dimension_type, N'MD_DIMTYPE_UNKNOWN'               AS dimension_type_name UNION ALL
SELECT 1  AS dimension_type, N'MD_DIMTYPE_TIME'                  AS dimension_type_name UNION ALL
SELECT 2  AS dimension_type, N'MD_DIMTYPE_MEASURE'               AS dimension_type_name UNION ALL
SELECT 3  AS dimension_type, N'MD_DIMTYPE_OTHER'                 AS dimension_type_name UNION ALL
SELECT 5  AS dimension_type, N'MD_DIMTYPE_QUANTITATIVE'          AS dimension_type_name UNION ALL
SELECT 6  AS dimension_type, N'MD_DIMTYPE_ACCOUNTS'              AS dimension_type_name UNION ALL
SELECT 7  AS dimension_type, N'MD_DIMTYPE_CUSTOMERS'             AS dimension_type_name UNION ALL
SELECT 8  AS dimension_type, N'MD_DIMTYPE_PRODUCTS'              AS dimension_type_name UNION ALL
SELECT 9  AS dimension_type, N'MD_DIMTYPE_SCENARIO'              AS dimension_type_name UNION ALL
SELECT 10 AS dimension_type, N'MD_DIMTYPE_UTILIY'                AS dimension_type_name UNION ALL
SELECT 11 AS dimension_type, N'MD_DIMTYPE_CURRENCY'              AS dimension_type_name UNION ALL
SELECT 12 AS dimension_type, N'MD_DIMTYPE_RATES'                 AS dimension_type_name UNION ALL
SELECT 13 AS dimension_type, N'MD_DIMTYPE_CHANNEL'               AS dimension_type_name UNION ALL
SELECT 14 AS dimension_type, N'MD_DIMTYPE_PROMOTION'             AS dimension_type_name UNION ALL
SELECT 15 AS dimension_type, N'MD_DIMTYPE_ORGANIZATION'          AS dimension_type_name UNION ALL
SELECT 16 AS dimension_type, N'MD_DIMTYPE_BILL_OF_MATERIALS'     AS dimension_type_name UNION ALL
SELECT 17 AS dimension_type, N'MD_DIMTYPE_GEOGRAPHY'             AS dimension_type_name



GO
