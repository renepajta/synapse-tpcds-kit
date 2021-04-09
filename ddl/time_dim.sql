SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [time_dim]
(
	[t_time_sk] [int] NOT NULL,
	[t_time_id] [char](16) NOT NULL,
	[t_time] [int] NULL,
	[t_hour] [int] NULL,
	[t_minute] [int] NULL,
	[t_second] [int] NULL,
	[t_am_pm] [char](2) NULL,
	[t_shift] [char](20) NULL,
	[t_sub_shift] [char](20) NULL,
	[t_meal_time] [char](20) NULL
)
WITH
(
	DISTRIBUTION = REPLICATE,
	CLUSTERED COLUMNSTORE INDEX
)
GO