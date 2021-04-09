SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [call_center]
(
	[cc_call_center_sk] [int] NOT NULL,
	[cc_call_center_id] [char](16) NOT NULL,
	[cc_rec_start_date] [date] NULL,
	[cc_rec_end_date] [date] NULL,
	[cc_closed_date_sk] [int] NULL,
	[cc_open_date_sk] [int] NULL,
	[cc_name] [varchar](50) NULL,
	[cc_class] [varchar](50) NULL,
	[cc_employees] [int] NULL,
	[cc_sq_ft] [int] NULL,
	[cc_hours] [char](20) NULL,
	[cc_manager] [varchar](40) NULL,
	[cc_mkt_id] [int] NULL,
	[cc_mkt_class] [char](50) NULL,
	[cc_mkt_desc] [varchar](100) NULL,
	[cc_market_manager] [varchar](40) NULL,
	[cc_division] [int] NULL,
	[cc_division_name] [varchar](50) NULL,
	[cc_company] [int] NULL,
	[cc_company_name] [char](50) NULL,
	[cc_street_number] [char](10) NULL,
	[cc_street_name] [varchar](60) NULL,
	[cc_street_type] [char](15) NULL,
	[cc_suite_number] [char](10) NULL,
	[cc_city] [varchar](60) NULL,
	[cc_county] [varchar](30) NULL,
	[cc_state] [char](2) NULL,
	[cc_zip] [char](10) NULL,
	[cc_country] [varchar](20) NULL,
	[cc_gmt_offset] [decimal](5, 2) NULL,
	[cc_tax_percentage] [decimal](5, 2) NULL
)
WITH
(
	DISTRIBUTION = REPLICATE,
	CLUSTERED COLUMNSTORE INDEX
)
GO