//------------------------------------------------------------------------
// Microsoft MSMD OLE DB Interfaces (Analysis Services 2005)
// (C) Copyright 1988 - 2003 By Microsoft Corporation.
//
// @doc This file contains constants specific to Microsoft SQL Server
//      Analysis Services that might be useful to client applications.
//
// @module MSMD.H | Microsoft OLE DB Provider for Analysis Services Interfaces
//------------------------------------------------------------------------

#ifndef __msmd_h__
#define __msmd_h__

#ifdef INITGUID
#pragma message ("msmd.h: Defining guids from " __FILE__)
#else
//#pragma message ("msmd.h: Not defining guids from " __FILE__)
#endif

// GUIDs for DM.
DEFINE_GUID(CLSID_MSDMine,           0x2CB6C2D3L, 0xDD7C, 0x11D2, 0xAF, 0xE4, 0x00, 0x10, 0x5A, 0x99, 0x47, 0x24 );
DEFINE_GUID(DBPROPSET_DMSESSION,     0x854c773c,  0x1fe0, 0x4456, 0xbb, 0x10, 0x78, 0xaf, 0xee, 0x80, 0x86, 0x2a );

// GUIDs for OLAP.
DEFINE_GUID(CLSID_MSOLAP,            0xa07ccd0cL, 0x8148, 0x11d0, 0x87, 0xbb, 0x00, 0xc0, 0x4f, 0xc3, 0x39, 0x42 );
DEFINE_GUID(CLSID_MSOLAP_ENUMERATOR, 0xa07ccd0fL, 0x8148, 0x11d0, 0x87, 0xbb, 0x00, 0xc0, 0x4f, 0xc3, 0x39, 0x42 );
DEFINE_GUID(CLSID_MSOLAP_ERROR,      0xa07ccd0dL, 0x8148, 0x11d0, 0x87, 0xbb, 0x00, 0xc0, 0x4f, 0xc3, 0x39, 0x42 );
DEFINE_GUID(DBPROPSET_MSOLAPINIT,    0xa07ccd04L, 0x8148, 0x11d0, 0x87, 0xbb, 0x00, 0xc0, 0x4f, 0xc3, 0x39, 0x42 );
DEFINE_GUID(DBPROPSET_MDX_EXTENSIONS,0xa07ccd05L, 0x8148, 0x11d0, 0x87, 0xbb, 0x00, 0xc0, 0x4f, 0xc3, 0x39, 0x42 );
DEFINE_GUID(DBPROPSET_MSMDPERFSTAT,	 0xa07ccd0aL, 0x8148, 0x11d0, 0x87, 0xbb, 0x00, 0xc0, 0x4f, 0xc3, 0x39, 0x42 );

#define DBPROPSET_MSMDINIT DBPROPSET_MSOLAPINIT


// DataSource Initialization properties.
// These are specific to Analysis Services.
// DBPROPSET_MSOLAPINIT

#define DBPROP_MSMD_BASE					0x1000
#define DBPROP_MSMD_CREATECUBE				(DBPROP_MSMD_BASE +  1)
#define DBPROP_MSMD_INSERTINTO				(DBPROP_MSMD_BASE +  2)
#define DBPROP_MSMD_SOURCE_DSN				(DBPROP_MSMD_BASE +  3)
#define DBPROP_MSMD_USEEXISTINGFILE			(DBPROP_MSMD_BASE +  7)
#define DBPROP_MSMD_ARTIFICIALDATA			(DBPROP_MSMD_BASE +  8)
#define DBPROP_MSMD_DATA_CACHE_SIZE			(DBPROP_MSMD_BASE +  9)
#define DBPROP_MSMD_SOURCE_DSN_SUFFIX		(DBPROP_MSMD_BASE + 10)
#define DBPROP_MSMD_AUTOSYNCHPERIOD			(DBPROP_MSMD_BASE + 11)
#define DBPROP_MSMD_CACHEPOLICY				(DBPROP_MSMD_BASE + 12)
#define DBPROP_MSMD_EXECLOCATION			(DBPROP_MSMD_BASE + 13)
#define DBPROP_MSMD_WRITEBACK_TIMEOUT		(DBPROP_MSMD_BASE + 14)
#define DBPROP_MSMD_DEFAULT_ISOLATION_MODE	(DBPROP_MSMD_BASE + 15)
#define DBPROP_MSMD_COMPARECASESENSITIVESTRINGFLAGS    (DBPROP_MSMD_BASE + 16)
#define DBPROP_MSMD_COMPARECASENOTSENSITIVESTRINGFLAGS (DBPROP_MSMD_BASE + 17)
#define DBPROP_MSMD_LARGE_LEVEL_THRESHOLD	(DBPROP_MSMD_BASE + 18)
#define DBPROP_MSMD_READ_ONLY_SESSION		(DBPROP_MSMD_BASE + 19)
#define DBPROP_MSMD_SECURED_CELL_VALUE		(DBPROP_MSMD_BASE + 20)
#define DBPROP_MSMD_ROLES					(DBPROP_MSMD_BASE + 21)
#define DBPROP_MSMD_MDXCOMPATIBILITY		(DBPROP_MSMD_BASE + 22)
#define DBPROP_MSMD_SQLCOMPATIBILITY		(DBPROP_MSMD_BASE + 23)
#define DBPROP_MSMD_SSPI					(DBPROP_MSMD_BASE + 24)
#define DBPROP_MSMD_MDXUNIQUENAMES			(DBPROP_MSMD_BASE + 25)
#define DBPROP_MSMD_DISTINCTMEASURESBYKEY	(DBPROP_MSMD_BASE + 26)
#define DBPROP_MSMD_DONOTAPPLYCOMMANDS		(DBPROP_MSMD_BASE + 27)
#define DBPROP_MSMD_DEFAULT_MDX_VISUAL_MODE	(DBPROP_MSMD_BASE + 28)
#define DBPROP_MSMD_MDX_CALC_MEMBERS_MODE	(DBPROP_MSMD_BASE + 29)
#define DBPROP_MSMD_MINING_LOCATION			(DBPROP_MSMD_BASE + 30)
#define DBPROP_MSMD_OLAP_SESSION			(DBPROP_MSMD_BASE + 31)
#define DBPROP_MSMD_LOG_FILE				(DBPROP_MSMD_BASE + 32)
#define DBPROP_MSMD_MINING_EXECUTION_LOCATION	(DBPROP_MSMD_BASE + 33)
#define DBPROP_MSMD_MINING_PERSISTENCE_FORMAT	(DBPROP_MSMD_BASE + 34)
#define DBPROP_MSMD_SHOW_HIDDEN_CUBES			(DBPROP_MSMD_BASE + 35)
#define DBPROP_MSMD_DEFAULT_GUID_DIALECT		(DBPROP_MSMD_BASE + 36)
#define DBPROP_MSMD_SAFETY_OPTIONS				(DBPROP_MSMD_BASE + 37)
#define DBPROP_MSMD_CACHERATIO					(DBPROP_MSMD_BASE + 38)
#define DBPROP_MSMD_AUTHENTICATED_USER			(DBPROP_MSMD_BASE + 39)
#define DBPROP_MSMD_CACHEMODE					(DBPROP_MSMD_BASE + 40)
#define DBPROP_MSMD_NONEMPTYTHRESHOLD			(DBPROP_MSMD_BASE + 41)
#define DBPROP_MSMD_RESTRICTEDCLIENT			(DBPROP_MSMD_BASE + 42)
#define DBPROP_MSMD_CACHERATIO2					(DBPROP_MSMD_BASE + 43)
#define DBPROP_MSMD_COMMANDTIMEOUT				(DBPROP_MSMD_BASE + 44)
#define DBPROP_MSMD_USEFORMULACACHE				(DBPROP_MSMD_BASE + 45)
#define DBPROP_MSMD_DYNAMICDEBUGLIMIT			(DBPROP_MSMD_BASE + 46)
#define DBPROP_MSMD_DEBUGMODE					(DBPROP_MSMD_BASE + 47)


//
// Begin added in Analysis Services 2005
//
#define DBPROP_MSMD_DATASOURCEINFO				(DBPROP_MSMD_BASE + 60)
#define DBPROP_MSMD_SQLQUERYMODE				(DBPROP_MSMD_BASE + 61)
#define DBPROP_MSMD_CUBE			            (DBPROP_MSMD_BASE + 62)
#define DBPROP_MSMD_PROTOCOLFORMAT				(DBPROP_MSMD_BASE + 63)
#define DBPROP_MSMD_TRANSPORTCOMPRESSION		(DBPROP_MSMD_BASE + 64)
#define DBPROP_MSMD_COMPRESSIONLEVEL			(DBPROP_MSMD_BASE + 65)
#define DBPROP_MSMD_CHARACTERENCODING			(DBPROP_MSMD_BASE + 66)
#define DBPROP_MSMD_ENCRYPTION_PASSWORD			(DBPROP_MSMD_BASE + 67)
#define DBPROP_MSMD_REAL_TIME_OLAP				(DBPROP_MSMD_BASE + 68)
#define DBPROP_MSMD_CONNECT_TO					(DBPROP_MSMD_BASE + 69)
#define DBPROP_MSMD_EFFECTIVE_USERNAME			(DBPROP_MSMD_BASE + 70)
#define DBPROP_MSMD_MDX_MISSING_MEMBER_MODE		(DBPROP_MSMD_BASE + 71)
#define DBPROP_MSMD_SESSIONID					(DBPROP_MSMD_BASE + 72)
#define DBPROP_MSMD_CUSTOMDATA					(DBPROP_MSMD_BASE + 73)
#define DBPROP_MSMD_ERROR_MESSAGE_MODE			(DBPROP_MSMD_BASE + 74)

DEFINE_GUID(DBPROPSET_MDCOMMAND,     0x980883ff,  0xb1fa, 0x4fef, 0xaa, 0x92, 0x3e, 0x59, 0x60, 0xb3, 0x0f, 0x95 );

// DBPROPSET_MDCOMMAND properties
#define DBPROP_MSMD_FLATTENED_ROWSET			(DBPROP_MSMD_BASE + 1)
#define DBPROP_MSMD_FLATTENED2					(DBPROP_MSMD_BASE + 2)

//
// End added in Analysis Services 2005
//

// DataSource properties.
// These are specific to Analysis Services.
// DBPROPSET_MSMDPERFSTAT

#define DBPROP_MSMD_PERFSTAT_QUERYCOUNT		(DBPROP_MSMD_BASE + 1)
#define DBPROP_MSMD_PERFSTAT_QUERYTIME		(DBPROP_MSMD_BASE + 2)
#define DBPROP_MSMD_PERFSTAT_QUERYCELLCOUNT	(DBPROP_MSMD_BASE + 3)
#define DBPROP_MSMD_PERFSTAT_QUERYNETCOUNT	(DBPROP_MSMD_BASE + 4)
#define DBPROP_MSMD_PERFSTAT_QUERYNETTIME	(DBPROP_MSMD_BASE + 5)


// DataSource Information properties.
// These are specific to Analysis Services, but could be created by anyone.
// DBPROPSET_MDX_EXTENSIONS

#define DBPROP_MSMD_MDX_DDL_EXTENSIONS		(DBPROP_MSMD_BASE +  1)
#define DBPROP_MSMD_MDX_USE_EXTENSIONS		(DBPROP_MSMD_BASE +  2)
#define DBPROP_MSMD_MDX_CALCMEMB_EXTENSIONS	(DBPROP_MSMD_BASE +  3)

#define DBPROPVAL_MDX_DDL_CREATECUBE		0x0001
#define DBPROPVAL_MDX_DDL_INSERTINTO		0x0002
#define DBPROPVAL_MDX_DDL_REFRESHCUBE		0x0004
#define DBPROPVAL_MDX_DLL_CREATESESSIONCUBE 0x0008
#define DBPROPVAL_MDX_DLL_CREATEGLOBALCUBE	0x0010

#define DBPROPVAL_MDX_USE_LIBRARY		0x0001
#define DBPROPVAL_MDX_USE_CATALOG		0x0002

#define DBPROPVAL_MDX_CALCMEMB_ADD		0x0001
#define DBPROPVAL_MDX_CALCMEMB_STRIP	0x0002

#define DBPROPVAL_MSMD_CAP_DEFAULT				0x0000
#define DBPROPVAL_MSMD_CAP_WINDOWING			0x0001
#define DBPROPVAL_MSMD_CAP_ALLSCAN				0x0002
#define DBPROPVAL_MSMD_CAP_ISOLATED				0x0003
#define DBPROPVAL_MSMD_CAP_IGNORE_VP			0x0004
#define DBPROPVAL_MSMD_CAP_INFINITE_VP			0x0005
#define DBPROPVAL_MSMD_CAP_LARGEST_AREA_FIRST	0x0006

#define DBPROPVAL_MSMD_EXL_DEFAULT		0x0000
#define DBPROPVAL_MSMD_EXL_SMART		0x0001
#define DBPROPVAL_MSMD_EXL_CLIENT		0x0002
#define DBPROPVAL_MSMD_EXL_SERVER		0x0003

#define DBPROPVAL_MSMD_LARGE_LEVEL_THRESHOLD_MIN 10
#define DBPROPVAL_MSMD_LARGE_LEVEL_THRESHOLD_DEFAULT 1000

#define DBPROPVAL_MSMD_SECURED_CELL_VALUE_DEFAULT 0x0000
#define DBPROPVAL_MSMD_SECURED_CELL_VALUE_NA      0x0001
#define DBPROPVAL_MSMD_SECURED_CELL_VALUE_ERROR   0x0002
#define DBPROPVAL_MSMD_SECURED_CELL_VALUE_NULL    0x0003
#define DBPROPVAL_MSMD_SECURED_CELL_VALUE_ZERO    0x0004
#define DBPROPVAL_MSMD_SECURED_CELL_VALUE_STRING  0x0005

#define DBPROP_MSMD_MDXCOMPATIBILITY_DEFAULT      0x0000
#define DBPROP_MSMD_MDXCOMPATIBILITY_70           0x0001
#define DBPROP_MSMD_MDXCOMPATIBILITY_7X           0x0002

#define DBPROP_MSMD_SQLCOMPATIBILITY_DEFAULT      0x0000
#define DBPROP_MSMD_SQLCOMPATIBILITY_NORMAL       0x0001
#define DBPROP_MSMD_SQLCOMPATIBILITY_COMPACT      0x0002
#define DBPROP_MSMD_SQLCOMPATIBILITY_NOFIREHOSE   0x0003
#define DBPROP_MSMD_SQLCOMPATIBILITY_80COMPATIBLE 0x0004

#define DBPROP_MSMD_MDXUNIQUENAMES_DEFAULT        0x0000
#define DBPROP_MSMD_MDXUNIQUENAMES_KEYPATH        0x0001
#define DBPROP_MSMD_MDXUNIQUENAMES_NAMEPATH       0x0002
#define DBPROP_MSMD_MDXUNIQUENAMES_7X             0x0003

#define DBPROPVAL_VISUAL_MODE_DEFAULT			  0x0000
#define DBPROPVAL_VISUAL_MODE_VISUAL			  0x0001
#define DBPROPVAL_VISUAL_MODE_ORIGINAL			  0x0002

#define DBPROPVAL_MSMD_CALC_MEMBERS_MODE_DEFAULT  0x0000
#define DBPROPVAL_MSMD_CALC_MEMBERS_MODE_ADD      0x0001
#define DBPROPVAL_MSMD_CALC_MEMBERS_MODE_STRIP    0x0002
#define DBPROPVAL_MSMD_CALC_MEMBERS_MODE_ORIGINAL 0x0003

#define DBPROPVAL_MSMD_SAFETY_OPTIONS_DEFAULT	  0x0000
#define DBPROPVAL_MSMD_SAFETY_OPTIONS_ALLOW_ALL	  0x0001
#define DBPROPVAL_MSMD_SAFETY_OPTIONS_ALLOW_SAFE  0x0002
#define DBPROPVAL_MSMD_SAFETY_OPTIONS_ALLOW_NONE  0x0003

#define DBPROPVAL_MSMD_CACHERATIO_LOWER			  0.
#define DBPROPVAL_MSMD_CACHERATIO_UPPER			  1.
#define  DBPROPVAL_MSMD_CACHERATIO_DEFAULT		  0.5

#define DBPROPVAL_MSMD_CACHEMODE_DEFAULT			0x0000
#define	DBPROPVAL_MSMD_CACHEMODE_REGONLY			0x0001
#define	DBPROPVAL_MSMD_CACHEMODE_SCAN				0x0002

#define DBPROPVAL_MSMD_NO_ERRORS					0
#define DBPROPVAL_MSMD_SCRIPT_ERRORS				1
#define DBPROPVAL_MSMD_SECURITY_ERRORS				2

// Constants for identifier lengths.
// Note that these should also be returned by IDBInfo.
#define MSMD_DBLITERAL_CATALOG_NAME_CCHMAXLEN				24
#define MSMD_DBLITERAL_CUBE_NAME_CCHMAXLEN					24
#define MSMD_DBLITERAL_DIMENSION_NAME_CCHMAXLEN				14
#define MSMD_DBLITERAL_HIERARCHY_NAME_CCHMAXLEN				10
#define MSMD_DBLITERAL_DIMENSIONHIERARCHY_NAME_CCHMAXLEN	24
#define MSMD_DBLITERAL_LEVEL_NAME_CCHMAXLEN					255
#define MSMD_DBLITERAL_MEMBER_NAME_CCHMAXLEN				255

#define MSMD_DBLITERAL_INVALID_STARTING_CHARS L"0123456789 "
#define MSMD_DBLITERAL_INVALID_CHARS L"."


// Provider-specific HRESULT codes.
#define MSMD_E_TRANSACTION_COMMIT_TIMEOUT	((HRESULT)0x8040F008)

// Provider-specific schema rowset restrictions
#define CRESTRICTIONS_MDSCHEMA_FUNCTIONS					4
#define CRESTRICTIONS_MDSCHEMA_SETS  						5

// Provider-specific schema rowset restrictions
#define CRESTRICTIONS_MDSCHEMA_COMMANDS						5

// Provider-specific schema rowset Actions
#define CRESTRICTIONS_MDSCHEMA_ACTIONS						8

// Provider-specific schema rowset MeasureGroupDimensions
#define CRESTRICTIONS_MDSCHEMA_MEASUREGROUP_DIMENSIONS		6

#define MSMD_SCHEMA_FUNCTIONS_ORIGIN_MSOLAP					0x0001
#define MSMD_SCHEMA_FUNCTIONS_ORIGIN_UDF					0x0002

////Note: The following items may be migrated to oledb.h in a future release
#define	MD_DIMTYPE_QUANTITATIVE								0x05
#define	MD_DIMTYPE_ACCOUNTS									0x06
#define	MD_DIMTYPE_CUSTOMERS								0x07
#define	MD_DIMTYPE_PRODUCTS									0x08
#define	MD_DIMTYPE_SCENARIO									0x09
#define	MD_DIMTYPE_UTILIY									0x0A
#define	MD_DIMTYPE_CURRENCY									0x0B
#define	MD_DIMTYPE_RATES									0x0C
#define	MD_DIMTYPE_CHANNEL									0x0D
#define	MD_DIMTYPE_PROMOTION								0x0E
#define	MD_DIMTYPE_ORGANIZATION								0x0F
#define	MD_DIMTYPE_BILL_OF_MATERIALS						0x10
#define	MD_DIMTYPE_GEOGRAPHY								0x11

#define	MDLEVEL_TYPE_GEO_CONTINENT							0x2001
#define	MDLEVEL_TYPE_GEO_REGION								0x2002
#define	MDLEVEL_TYPE_GEO_COUNTRY							0x2003
#define	MDLEVEL_TYPE_GEO_STATE_OR_PROVINCE					0x2004
#define	MDLEVEL_TYPE_GEO_COUNTY								0x2005
#define	MDLEVEL_TYPE_GEO_CITY								0x2006
#define	MDLEVEL_TYPE_GEO_POSTALCODE							0x2007
#define	MDLEVEL_TYPE_GEO_POINT								0x2008
#define	MDLEVEL_TYPE_ORG_UNIT								0x1011
#define	MDLEVEL_TYPE_BOM_RESOURCE							0x1012
#define	MDLEVEL_TYPE_QUANTITATIVE							0x1013
#define	MDLEVEL_TYPE_ACCOUNT								0x1014
#define	MDLEVEL_TYPE_CUSTOMER								0x1021
#define	MDLEVEL_TYPE_CUSTOMER_GROUP							0x1022
#define	MDLEVEL_TYPE_CUSTOMER_HOUSEHOLD						0x1023
#define	MDLEVEL_TYPE_PRODUCT								0x1031
#define	MDLEVEL_TYPE_PRODUCT_GROUP							0x1032
#define	MDLEVEL_TYPE_SCENARIO								0x1015
#define	MDLEVEL_TYPE_UTILITY								0x1016
#define	MDLEVEL_TYPE_PERSON									0x1041
#define	MDLEVEL_TYPE_COMPANY								0x1042
#define	MDLEVEL_TYPE_CURRENCY_SOURCE						0x1051
#define	MDLEVEL_TYPE_CURRENCY_DESTINATION					0x1052
#define	MDLEVEL_TYPE_CHANNEL								0x1061
#define	MDLEVEL_TYPE_REPRESENTATIVE							0x1062
#define	MDLEVEL_TYPE_PROMOTION								0x1071

#define	MD_PROPTYPE_REGULAR  								0x0000
#define	MD_PROPTYPE_ID										0x0001
#define	MD_PROPTYPE_RELATION_TO_PARENT						0x0002
#define MD_PROPTYPE_ROLLUP_OPERATOR							0x0003
#define	MD_PROPTYPE_ORG_TITLE								0x0011
#define	MD_PROPTYPE_CAPTION 								0x0021
#define	MD_PROPTYPE_CAPTION_SHORT							0x0022
#define	MD_PROPTYPE_CAPTION_DESCRIPTION						0x0023
#define	MD_PROPTYPE_CAPTION_ABBREVIATION					0x0024
#define	MD_PROPTYPE_WEB_URL									0x0031
#define	MD_PROPTYPE_WEB_HTML								0x0032
#define	MD_PROPTYPE_WEB_XML_OR_XSL							0x0033
#define	MD_PROPTYPE_WEB_MAIL_ALIAS							0x0034
#define	MD_PROPTYPE_ADDRESS									0x0041
#define	MD_PROPTYPE_ADDRESS_STREET							0x0042
#define	MD_PROPTYPE_ADDRESS_HOUSE							0x0043
#define	MD_PROPTYPE_ADDRESS_CITY							0x0044
#define	MD_PROPTYPE_ADDRESS_STATE_OR_PROVINCE 				0x0045
#define	MD_PROPTYPE_ADDRESS_ZIP								0x0046
#define	MD_PROPTYPE_ADDRESS_QUARTER							0x0047
#define	MD_PROPTYPE_ADDRESS_COUNTRY							0x0048
#define	MD_PROPTYPE_ADDRESS_BUILDING						0x0049
#define	MD_PROPTYPE_ADDRESS_ROOM							0x004A
#define	MD_PROPTYPE_ADDRESS_FLOOR							0x004B
#define	MD_PROPTYPE_ADDRESS_FAX								0x004C
#define	MD_PROPTYPE_ADDRESS_PHONE							0x004D
#define	MD_PROPTYPE_GEO_CENTROID_X							0x0061
#define	MD_PROPTYPE_GEO_CENTROID_Y							0x0062
#define	MD_PROPTYPE_GEO_CENTROID_Z							0x0063
#define	MD_PROPTYPE_GEO_BOUNDARY_TOP						0x0064
#define	MD_PROPTYPE_GEO_BOUNDARY_LEFT						0x0065
#define	MD_PROPTYPE_GEO_BOUNDARY_BOTTOM						0x0066
#define	MD_PROPTYPE_GEO_BOUNDARY_RIGHT						0x0067
#define	MD_PROPTYPE_GEO_BOUNDARY_FRONT						0x0068
#define	MD_PROPTYPE_GEO_BOUNDARY_REAR						0x0069
#define	MD_PROPTYPE_GEO_BOUNDARY_POLYGON					0x006A
#define	MD_PROPTYPE_PHYSICAL_SIZE							0x0071
#define	MD_PROPTYPE_PHYSICAL_COLOR							0x0072
#define	MD_PROPTYPE_PHYSICAL_WEIGHT							0x0073
#define	MD_PROPTYPE_PHYSICAL_HEIGHT							0x0074
#define	MD_PROPTYPE_PHYSICAL_WIDTH							0x0075
#define	MD_PROPTYPE_PHYSICAL_DEPTH							0x0076
#define	MD_PROPTYPE_PHYSICAL_VOLUME							0x0077
#define	MD_PROPTYPE_PHYSICAL_DENSITY						0x0078
#define	MD_PROPTYPE_PERSON_FULL_NAME						0x0082
#define	MD_PROPTYPE_PERSON_FIRST_NAME						0x0083
#define	MD_PROPTYPE_PERSON_LAST_NAME						0x0084
#define	MD_PROPTYPE_PERSON_MIDDLE_NAME						0x0085
#define	MD_PROPTYPE_PERSON_DEMOGRAPHIC						0x0086
#define	MD_PROPTYPE_PERSON_CONTACT							0x0087
#define	MD_PROPTYPE_QTY_RANGE_LOW							0x0091
#define	MD_PROPTYPE_QTY_RANGE_HIGH							0x0092
#define	MD_PROPTYPE_FORMATTING_COLOR						0x00A1
#define	MD_PROPTYPE_FORMATTING_ORDER						0x00A2
#define	MD_PROPTYPE_FORMATTING_FONT							0x00A3
#define	MD_PROPTYPE_FORMATTING_FONT_EFFECTS					0x00A4
#define	MD_PROPTYPE_FORMATTING_FONT_SIZE					0x00A5
#define	MD_PROPTYPE_FORMATTING_SUB_TOTAL					0x00A1
#define	MD_PROPTYPE_DATE									0x00B1
#define	MD_PROPTYPE_DATE_START								0x00B2
#define	MD_PROPTYPE_DATE_ENDED								0x00B3
#define	MD_PROPTYPE_DATE_CANCELED							0x00B4
#define	MD_PROPTYPE_DATE_MODIFIED							0x00B5
#define	MD_PROPTYPE_DATE_DURATION							0x00B6
#define	MD_PROPTYPE_VERSION									0x00C1

//Note: The following items may be migrated to oledb.h in a future release
#define MD_SECURITY_ENABLE_DRILLTHROUGH						0x0001
#define MD_SECURITY_ENABLE_WRITEBACK						0x0002

//Note: The following items may be migrated to oledb.h in a future release
#define	MDACTION_COORDINATE_CUBE							0x00000001
#define	MDACTION_COORDINATE_DIMENSION						0x00000002
#define	MDACTION_COORDINATE_LEVEL							0x00000003
#define	MDACTION_COORDINATE_MEMBER							0x00000004
#define	MDACTION_COORDINATE_SET								0x00000005
#define	MDACTION_COORDINATE_CELL							0x00000006

#define	MDACTION_TYPE_ALL									0x00000000
#define	MDACTION_TYPE_URL									0x00000001
#define	MDACTION_TYPE_HTML									0x00000002
#define	MDACTION_TYPE_STATEMENT								0x00000004
#define	MDACTION_TYPE_DATASET								0x00000008
#define	MDACTION_TYPE_ROWSET								0x00000010
#define	MDACTION_TYPE_COMMANDLINE							0x00000020
#define	MDACTION_TYPE_PROPRIETARY							0x00000040
#define	MDACTION_TYPE_REPORT								0x00000080
#define	MDACTION_TYPE_DRILLTHROUGH							0x00000100

#define MDDATA_TYPE_ALL										0x00000000
#define MDDATA_TYPE_VARIANT									0x00000001
#define MDDATA_TYPE_WSTRING									0x00000002

#define	MDACTION_INVOCATION_ALL								0x00000000
#define	MDACTION_INVOCATION_INTERACTIVE						0x00000001
#define	MDACTION_INVOCATION_ON_OPEN							0x00000002
#define	MDACTION_INVOCATION_BATCH							0x00000004

#define MDLEVELS_CUSTOM_ROLLUP_EXPRESSION					0x00000001
#define MDLEVELS_CUSTOM_ROLLUP_COLUMN						0x00000002 
#define	MDLEVELS_SKIPPED_LEVELS								0x00000004
#define	MDLEVELS_CUSTOM_MEMBER_PROPERTIES					0x00000008
#define	MDLEVELS_UNARY_OPERATOR								0x00000010

#define MDLEVELS_MEMBER_KEY_UNIQUE							0x00000001
#define MDLEVELS_MEMBER_NAME_UNIQUE							0x00000002

#define MDPROP_SYSTEM						                0x00000004
#define MDPROP_BLOB							                0x00000008

#define MDDIMENSIONS_MEMBER_KEY_UNIQUE						0x00000001
#define MDDIMENSIONS_MEMBER_NAME_UNIQUE						0x00000002

#define MDLEVELS_HIDEMEMBERIF_NO_HOLES						0x00000000	// no holes on this level
#define MDLEVELS_HIDEMEMBERIF_ONLY_CHILD_AND_BLANK_NAME	    0x00000001	// hole is determined if the vertex has an empty name and singleton
#define MDLEVELS_HIDEMEMBERIF_ONLY_CHILD_AND_PARENT_NAME	0x00000002	// hole is determined if the vertex has a name same as the parent and singleton
#define MDLEVELS_HIDEMEMBERIF_BLANK_NAME					0x00000003	// hole is determined if the vertex has an empty name
#define MDLEVELS_HIDEMEMBERIF_PARENT_NAME					0x00000004,	// hole is determined if the vertex has a name same as the parent

//Note: The following items may be migrated to oledb.h in a future release
//			  should be 10 and we should use that one instead of this one
//			  everywhere in the code
#define CRESTRICTIONS_MDSCHEMA_PROPERTIES_7x                10

// Measure type distinct count
//Note: The following items may be migrated to oledb.h in a future release
#define MDMEASURE_AGGR_DST									0x08

// Measures types for semiadditive measures.
//Note: The following items may be migrated to oledb.h in a future release
#define MDMEASURE_AGGR_NONE                                 0x09
#define MDMEASURE_AGGR_AVGCHILDREN                          0x0A
#define MDMEASURE_AGGR_FIRSTCHILD                           0x0B
#define MDMEASURE_AGGR_LASTCHILD                            0x0C
#define MDMEASURE_AGGR_FIRSTNONEMPTY                        0x0D
#define MDMEASURE_AGGR_LASTNONEMPTY                         0x0E
#define MDMEASURE_AGGR_BYACCOUNT                            0x0F

//Note: The following items may be migrated to oledb.h in a future release
enum DBPROPENUM27
{
	DBPROP_PROVIDEROLEDBOLAPVER			=	0x101L,
	DBPROP_DATASOURCE_CONNECTION_TYPE	=	0x102L
};

#define DBPROPVAL_MDX_DCT_SERVER 0x0001
#define DBPROPVAL_MDX_DCT_LOCAL	 0x0002
#define DBPROPVAL_MDX_DCT_HTTP 	 0x0004

#define MD_STRUCTURE_FULLYBALANCED		0x0000
#define MD_STRUCTURE_RAGGEDBALANCED		0x0001
#define MD_STRUCTURE_UNBALANCED			0x0002
#define MD_STRUCTURE_NETWORK			0x0003

#define MDSET_SCOPE_GLOBAL				0x00001
#define MDSET_SCOPE_SESSION				0x00002

#define DBPROP_VISUALMODE				(DBPROP_SESS_AUTOCOMMITISOLEVELS  + 1)

//property values for UPDATE cell property
#define MD_MASK_ENABLED										0x00000000
#define MD_MASK_NOT_ENABLED									0x10000000

#define DBPROP_CELL_UPDATE_ENABLED							MD_MASK_ENABLED		| 0x00000001 // can update
#define DBPROP_CELL_UPDATE_ENABLED_WITH_UPDATE				MD_MASK_ENABLED		| 0x00000002 // can update using UPDATE function
#define DBPROP_CELL_UPDATE_NOT_ENABLED_FORMULA				MD_MASK_NOT_ENABLED | 0x00000001 // cannot update formula
#define DBPROP_CELL_UPDATE_NOT_ENABLED_NONSUM_MEASURE		MD_MASK_NOT_ENABLED | 0x00000002 // cannot update non-sum type measure
#define DBPROP_CELL_UPDATE_NOT_ENABLED_NACELL_VIRTUALCUBE	MD_MASK_NOT_ENABLED | 0x00000003 // cannot update N/A cell in virtual cube
#define DBPROP_CELL_UPDATE_NOT_ENABLED_UPDATETONULL			MD_MASK_NOT_ENABLED | 0x00000004 // cannot store a NULL in a non NULL cell
#define DBPROP_CELL_UPDATE_NOT_ENABLED_SECURE				MD_MASK_NOT_ENABLED | 0x00000005 // cannot update because cell is secured
#define DBPROP_CELL_UPDATE_NOT_ENABLED_CALCLEVEL			MD_MASK_NOT_ENABLED | 0x00000006 // cannot update for calculated level
#define DBPROP_CELL_UPDATE_NOT_ENABLED_CANNOTUPDATE			MD_MASK_NOT_ENABLED | 0x00000007 // cannot update for internal reason
#define DBPROP_CELL_UPDATE_NOT_ENABLED_INVALIDDIMENSIONTYPE	MD_MASK_NOT_ENABLED | 0x00000009 // cannot update if special dimensions (ref, MM, DM) non trivial coordinates

extern const OLEDBDECLSPEC GUID MDGUID_DM  = {0x62c58fed,0xcca5,0x44f1,{0x83, 0xb6, 0x7b, 0x45, 0x68, 0x2b, 0x39, 0x04}};

//
// Begin added in Analysis Services 2005
//

// Enum values for <object>_ORIGIN
#define MD_ORIGIN_USER_DEFINED							0x00000001
#define MD_ORIGIN_ATTRIBUTE								0x00000002
#define MD_ORIGIN_KEY_ATTRIBUTE							0x00000004
#define MD_ORIGIN_INTERNAL								0x00000008

// Enum values for INSTANCE_SELECTION
#define MD_INSTANCE_SELECTION_NONE						0x00000000
#define MD_INSTANCE_SELECTION_DROPDOWN					0x00000001
#define MD_INSTANCE_SELECTION_LIST						0x00000002
#define MD_INSTANCE_SELECTION_FILTEREDLIST				0x00000003
#define MD_INSTANCE_SELECTION_MANDATORYFILTER			0x00000004					

// Enum values for GROUPING_BEHAVIOR
#define	MD_GROUPING_BEHAVIOR_ENCOURAGE					0x00000001
#define	MD_GROUPING_BEHAVIOR_DISCOURAGE					0x00000002

// Enum values for CUBE_SOURCE property
#define	MD_CUBE_SOURCE_CUBE				0x0001
#define	MD_CUBE_SOURCE_DIMENSION		0x0002

//
// End added in Analysis Services 2005
//

//////////////////////////////////////////////////////////////////////////
// Begin: Interface  and related structure definitions for IMDDatasetInfo
//////////////////////////////////////////////////////////////////////////

typedef struct tagMDAXISINFOEX
    {
    DBLENGTH cbSize;
    DBCOUNTITEM iAxis;
    DBCOUNTITEM cHierarchies;
    LPOLESTR *rgpwszHierarchyNames;
    } 	MDAXISINFOEX;

typedef struct tagMDCUBEINFO
    {
    DBLENGTH cbSize;
    DBCOUNTITEM iCube;
    LPOLESTR wszCubeName;
    DATE LastDataUpdate;
    DATE LastSchemaUpdate;
    } 	MDCUBEINFO;



extern RPC_IF_HANDLE __MIDL_itf_pxoprovider_0000_v0_0_c_ifspec;
extern RPC_IF_HANDLE __MIDL_itf_pxoprovider_0000_v0_0_s_ifspec;

#ifndef __IMDDatasetInfo_INTERFACE_DEFINED__
#define __IMDDatasetInfo_INTERFACE_DEFINED__

/* interface IMDDatasetInfo */
/* [unique][uuid][object][local] */ 


EXTERN_C const IID IID_IMDDatasetInfo;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("a07ccd16-8148-11d0-87bb-00c04fc33942")
    IMDDatasetInfo : public IUnknown
    {
    public:
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE FreeAxisInfo( 
            DBCOUNTITEM cAxes,
            MDAXISINFOEX *rgAxisInfo) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE GetAxisInfo( 
            DBCOUNTITEM *pcAxes,
            MDAXISINFOEX **prgAxisInfo) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE FreeCubeInfo( 
            DBCOUNTITEM cCubes,
            MDCUBEINFO *rgCubeInfo) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE GetCubeInfo( 
            DBCOUNTITEM *pcCubes,
            MDCUBEINFO **prgCubeInfo) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IMDDatasetInfoVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            IMDDatasetInfo * This,
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            IMDDatasetInfo * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            IMDDatasetInfo * This);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *FreeAxisInfo )( 
            IMDDatasetInfo * This,
            DBCOUNTITEM cAxes,
            MDAXISINFOEX *rgAxisInfo);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *GetAxisInfo )( 
            IMDDatasetInfo * This,
            DBCOUNTITEM *pcAxes,
            MDAXISINFOEX **prgAxisInfo);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *FreeCubeInfo )( 
            IMDDatasetInfo * This,
            DBCOUNTITEM cCubes,
            MDCUBEINFO *rgCubeInfo);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *GetCubeInfo )( 
            IMDDatasetInfo * This,
            DBCOUNTITEM *pcCubes,
            MDCUBEINFO **prgCubeInfo);
        
        END_INTERFACE
    } IMDDatasetInfoVtbl;

    interface IMDDatasetInfo
    {
        CONST_VTBL struct IMDDatasetInfoVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IMDDatasetInfo_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IMDDatasetInfo_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IMDDatasetInfo_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define IMDDatasetInfo_FreeAxisInfo(This,cAxes,rgAxisInfo)	\
    ( (This)->lpVtbl -> FreeAxisInfo(This,cAxes,rgAxisInfo) ) 

#define IMDDatasetInfo_GetAxisInfo(This,pcAxes,prgAxisInfo)	\
    ( (This)->lpVtbl -> GetAxisInfo(This,pcAxes,prgAxisInfo) ) 

#define IMDDatasetInfo_FreeCubeInfo(This,cCubes,rgCubeInfo)	\
    ( (This)->lpVtbl -> FreeCubeInfo(This,cCubes,rgCubeInfo) ) 

#define IMDDatasetInfo_GetCubeInfo(This,pcCubes,prgCubeInfo)	\
    ( (This)->lpVtbl -> GetCubeInfo(This,pcCubes,prgCubeInfo) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */



/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE IMDDatasetInfo_FreeAxisInfo_Proxy( 
    IMDDatasetInfo * This,
    DBCOUNTITEM cAxes,
    MDAXISINFOEX *rgAxisInfo);


void __RPC_STUB IMDDatasetInfo_FreeAxisInfo_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE IMDDatasetInfo_GetAxisInfo_Proxy( 
    IMDDatasetInfo * This,
    DBCOUNTITEM *pcAxes,
    MDAXISINFOEX **prgAxisInfo);


void __RPC_STUB IMDDatasetInfo_GetAxisInfo_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE IMDDatasetInfo_FreeCubeInfo_Proxy( 
    IMDDatasetInfo * This,
    DBCOUNTITEM cCubes,
    MDCUBEINFO *rgCubeInfo);


void __RPC_STUB IMDDatasetInfo_FreeCubeInfo_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE IMDDatasetInfo_GetCubeInfo_Proxy( 
    IMDDatasetInfo * This,
    DBCOUNTITEM *pcCubes,
    MDCUBEINFO **prgCubeInfo);


void __RPC_STUB IMDDatasetInfo_GetCubeInfo_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);

#endif 	/* __IMDDatasetInfo_INTERFACE_DEFINED__ */

DEFINE_GUID(IID_IMDDatasetInfo,      0xa07ccd16,  0x8148, 0x11d0, 0x87, 0xbb, 0x00, 0xc0, 0x4f, 0xc3, 0x39, 0x42 );

//////////////////////////////////////////////////////////////////////////
// END: Interface  and related structure definitions for IMDDatasetInfo
//////////////////////////////////////////////////////////////////////////

#endif	// __msmd_h__
