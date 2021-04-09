SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [customer_demographics]
(
	[cd_demo_sk] [int] NOT NULL,
	[cd_gender] [char](1) NULL,
	[cd_marital_status] [char](1) NULL,
	[cd_education_status] [char](20) NULL,
	[cd_purchase_estimate] [int] NULL,
	[cd_credit_rating] [char](10) NULL,
	[cd_dep_count] [int] NULL,
	[cd_dep_employed_count] [int] NULL,
	[cd_dep_college_count] [int] NULL
)
WITH
(
	DISTRIBUTION = REPLICATE,
	CLUSTERED COLUMNSTORE INDEX
)
GO