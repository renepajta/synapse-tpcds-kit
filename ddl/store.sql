SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [store]
(
	[s_store_sk] [int] NOT NULL,
	[s_store_id] [char](16) NOT NULL,
	[s_rec_start_date] [date] NULL,
	[s_rec_end_date] [date] NULL,
	[s_closed_date_sk] [int] NULL,
	[s_store_name] [varchar](50) NULL,
	[s_number_employees] [int] NULL,
	[s_floor_space] [int] NULL,
	[s_hours] [char](20) NULL,
	[s_manager] [varchar](40) NULL,
	[s_market_id] [int] NULL,
	[s_geography_class] [varchar](100) NULL,
	[s_market_desc] [varchar](100) NULL,
	[s_market_manager] [varchar](40) NULL,
	[s_division_id] [int] NULL,
	[s_division_name] [varchar](50) NULL,
	[s_company_id] [int] NULL,
	[s_company_name] [varchar](50) NULL,
	[s_street_number] [varchar](10) NULL,
	[s_street_name] [varchar](60) NULL,
	[s_street_type] [char](15) NULL,
	[s_suite_number] [char](10) NULL,
	[s_city] [varchar](60) NULL,
	[s_county] [varchar](30) NULL,
	[s_state] [char](2) NULL,
	[s_zip] [char](10) NULL,
	[s_country] [varchar](20) NULL,
	[s_gmt_offset] [decimal](5, 2) NULL,
	[s_tax_precentage] [decimal](5, 2) NULL
)
WITH
(
	DISTRIBUTION = REPLICATE,
	CLUSTERED COLUMNSTORE INDEX
)
GO
