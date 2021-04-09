SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [date_dim]
(
	[d_date_sk] [int] NOT NULL,
	[d_date_id] [char](16) NOT NULL,
	[d_date] [date] NULL,
	[d_month_seq] [int] NULL,
	[d_week_seq] [int] NULL,
	[d_quarter_seq] [int] NULL,
	[d_year] [int] NULL,
	[d_dow] [int] NULL,
	[d_moy] [int] NULL,
	[d_dom] [int] NULL,
	[d_qoy] [int] NULL,
	[d_fy_year] [int] NULL,
	[d_fy_quarter_seq] [int] NULL,
	[d_fy_week_seq] [int] NULL,
	[d_day_name] [char](9) NULL,
	[d_quarter_name] [char](6) NULL,
	[d_holiday] [char](1) NULL,
	[d_weekend] [char](1) NULL,
	[d_following_holiday] [char](1) NULL,
	[d_first_dom] [int] NULL,
	[d_last_dom] [int] NULL,
	[d_same_day_ly] [int] NULL,
	[d_same_day_lq] [int] NULL,
	[d_current_day] [char](1) NULL,
	[d_current_week] [char](1) NULL,
	[d_current_month] [char](1) NULL,
	[d_current_quarter] [char](1) NULL,
	[d_current_year] [char](1) NULL
)
WITH
(
	DISTRIBUTION = REPLICATE,
	CLUSTERED COLUMNSTORE INDEX
)
GO