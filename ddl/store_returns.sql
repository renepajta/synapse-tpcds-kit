SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [store_returns]
(
	[sr_returned_date_sk] [int] NULL,
	[sr_return_time_sk] [int] NULL,
	[sr_item_sk] [int] NOT NULL,
	[sr_customer_sk] [int] NULL,
	[sr_cdemo_sk] [int] NULL,
	[sr_hdemo_sk] [int] NULL,
	[sr_addr_sk] [int] NULL,
	[sr_store_sk] [int] NULL,
	[sr_reason_sk] [int] NULL,
	[sr_ticket_number] [int] NOT NULL,
	[sr_return_quantity] [int] NULL,
	[sr_return_amt] [decimal](7, 2) NULL,
	[sr_return_tax] [decimal](7, 2) NULL,
	[sr_return_amt_inc_tax] [decimal](7, 2) NULL,
	[sr_fee] [decimal](7, 2) NULL,
	[sr_return_ship_cost] [decimal](7, 2) NULL,
	[sr_refunded_cash] [decimal](7, 2) NULL,
	[sr_reversed_charge] [decimal](7, 2) NULL,
	[sr_store_credit] [decimal](7, 2) NULL,
	[sr_net_loss] [decimal](7, 2) NULL
)
WITH
(
	DISTRIBUTION = HASH ( [sr_item_sk] ),
	CLUSTERED COLUMNSTORE INDEX ORDER([sr_returned_date_sk], [sr_item_sk])
)
GO