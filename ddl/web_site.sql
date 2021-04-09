SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [web_site]
(
	[web_site_sk] [int] NOT NULL,
	[web_site_id] [char](16) NOT NULL,
	[web_rec_start_date] [date] NULL,
	[web_rec_end_date] [date] NULL,
	[web_name] [varchar](50) NULL,
	[web_open_date_sk] [int] NULL,
	[web_close_date_sk] [int] NULL,
	[web_class] [varchar](50) NULL,
	[web_manager] [varchar](40) NULL,
	[web_mkt_id] [int] NULL,
	[web_mkt_class] [varchar](50) NULL,
	[web_mkt_desc] [varchar](100) NULL,
	[web_market_manager] [varchar](40) NULL,
	[web_company_id] [int] NULL,
	[web_company_name] [char](50) NULL,
	[web_street_number] [char](10) NULL,
	[web_street_name] [varchar](60) NULL,
	[web_street_type] [char](15) NULL,
	[web_suite_number] [char](10) NULL,
	[web_city] [varchar](60) NULL,
	[web_county] [varchar](30) NULL,
	[web_state] [char](2) NULL,
	[web_zip] [char](10) NULL,
	[web_country] [varchar](20) NULL,
	[web_gmt_offset] [decimal](5, 2) NULL,
	[web_tax_percentage] [decimal](5, 2) NULL
)
WITH
(
	DISTRIBUTION = REPLICATE,
	CLUSTERED COLUMNSTORE INDEX
)
GO