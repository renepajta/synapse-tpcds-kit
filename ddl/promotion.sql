SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [promotion]
(
	[p_promo_sk] [int] NOT NULL,
	[p_promo_id] [char](16) NOT NULL,
	[p_start_date_sk] [int] NULL,
	[p_end_date_sk] [int] NULL,
	[p_item_sk] [int] NULL,
	[p_cost] [decimal](15, 2) NULL,
	[p_response_target] [int] NULL,
	[p_promo_name] [char](50) NULL,
	[p_channel_dmail] [char](1) NULL,
	[p_channel_email] [char](1) NULL,
	[p_channel_catalog] [char](1) NULL,
	[p_channel_tv] [char](1) NULL,
	[p_channel_radio] [char](1) NULL,
	[p_channel_press] [char](1) NULL,
	[p_channel_event] [char](1) NULL,
	[p_channel_demo] [char](1) NULL,
	[p_channel_details] [varchar](100) NULL,
	[p_purpose] [char](15) NULL,
	[p_discount_active] [char](1) NULL
)
WITH
(
	DISTRIBUTION = REPLICATE,
	CLUSTERED COLUMNSTORE INDEX
)
GO