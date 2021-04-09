SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [customer_address]
(
	[ca_address_sk] [int] NOT NULL,
	[ca_address_id] [char](16) NOT NULL,
	[ca_street_number] [char](10) NULL,
	[ca_street_name] [varchar](60) NULL,
	[ca_street_type] [char](15) NULL,
	[ca_suite_number] [char](10) NULL,
	[ca_city] [varchar](60) NULL,
	[ca_county] [varchar](30) NULL,
	[ca_state] [char](2) NULL,
	[ca_zip] [char](10) NULL,
	[ca_country] [varchar](20) NULL,
	[ca_gmt_offset] [decimal](5, 2) NULL,
	[ca_location_type] [char](20) NULL
)
WITH
(
	DISTRIBUTION = REPLICATE,
	CLUSTERED COLUMNSTORE INDEX
)
GO