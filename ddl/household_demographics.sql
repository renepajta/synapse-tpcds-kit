SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [household_demographics]
(
	[hd_demo_sk] [int] NOT NULL,
	[hd_income_band_sk] [int] NULL,
	[hd_buy_potential] [char](15) NULL,
	[hd_dep_count] [int] NULL,
	[hd_vehicle_count] [int] NULL
)
WITH
(
	DISTRIBUTION = REPLICATE,
	CLUSTERED COLUMNSTORE INDEX
)
GO