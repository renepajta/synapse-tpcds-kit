SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [customer]
(
	[c_customer_sk] [int] NOT NULL,
	[c_customer_id] [char](16) NOT NULL,
	[c_current_cdemo_sk] [int] NULL,
	[c_current_hdemo_sk] [int] NULL,
	[c_current_addr_sk] [int] NULL,
	[c_first_shipto_date_sk] [int] NULL,
	[c_first_sales_date_sk] [int] NULL,
	[c_salutation] [char](10) NULL,
	[c_first_name] [char](20) NULL,
	[c_last_name] [char](30) NULL,
	[c_preferred_cust_flag] [char](1) NULL,
	[c_birth_day] [int] NULL,
	[c_birth_month] [int] NULL,
	[c_birth_year] [int] NULL,
	[c_birth_country] [varchar](20) NULL,
	[c_login] [char](13) NULL,
	[c_email_address] [char](50) NULL,
	[c_last_review_date] [char](10) NULL
)
WITH
(
	DISTRIBUTION = REPLICATE,
	CLUSTERED COLUMNSTORE INDEX
)
GO