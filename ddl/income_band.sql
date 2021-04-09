SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [income_band]
(
	[ib_income_band_sk] [int] NOT NULL,
	[ib_lower_bound] [int] NULL,
	[ib_upper_bound] [int] NULL
)
WITH
(
	DISTRIBUTION = REPLICATE,
	CLUSTERED COLUMNSTORE INDEX
)
GO