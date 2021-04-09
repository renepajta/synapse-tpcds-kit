SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [web_returns]
(
	[wr_returned_date_sk] [int] NULL,
	[wr_returned_time_sk] [int] NULL,
	[wr_item_sk] [int] NOT NULL,
	[wr_refunded_customer_sk] [int] NULL,
	[wr_refunded_cdemo_sk] [int] NULL,
	[wr_refunded_hdemo_sk] [int] NULL,
	[wr_refunded_addr_sk] [int] NULL,
	[wr_returning_customer_sk] [int] NULL,
	[wr_returning_cdemo_sk] [int] NULL,
	[wr_returning_hdemo_sk] [int] NULL,
	[wr_returning_addr_sk] [int] NULL,
	[wr_web_page_sk] [int] NULL,
	[wr_reason_sk] [int] NULL,
	[wr_order_number] [int] NOT NULL,
	[wr_return_quantity] [int] NULL,
	[wr_return_amt] [decimal](7, 2) NULL,
	[wr_return_tax] [decimal](7, 2) NULL,
	[wr_return_amt_inc_tax] [decimal](7, 2) NULL,
	[wr_fee] [decimal](7, 2) NULL,
	[wr_return_ship_cost] [decimal](7, 2) NULL,
	[wr_refunded_cash] [decimal](7, 2) NULL,
	[wr_reversed_charge] [decimal](7, 2) NULL,
	[wr_account_credit] [decimal](7, 2) NULL,
	[wr_net_loss] [decimal](7, 2) NULL
)
WITH
(
	DISTRIBUTION = HASH ( [wr_returned_date_sk] ),
	CLUSTERED COLUMNSTORE INDEX
)
GO