SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [warehouse]
(
	[w_warehouse_sk] [int] NOT NULL,
	[w_warehouse_id] [char](16) NOT NULL,
	[w_warehouse_name] [varchar](20) NULL,
	[w_warehouse_sq_ft] [int] NULL,
	[w_street_number] [char](10) NULL,
	[w_street_name] [varchar](60) NULL,
	[w_street_type] [char](15) NULL,
	[w_suite_number] [char](10) NULL,
	[w_city] [varchar](60) NULL,
	[w_county] [varchar](30) NULL,
	[w_state] [char](2) NULL,
	[w_zip] [char](10) NULL,
	[w_country] [varchar](20) NULL,
	[w_gmt_offset] [decimal](5, 2) NULL
)
WITH
(
	DISTRIBUTION = REPLICATE,
	CLUSTERED COLUMNSTORE INDEX
)
GO