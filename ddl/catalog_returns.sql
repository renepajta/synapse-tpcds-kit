SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [catalog_returns]
(
	[cr_returned_date_sk] [int] NULL,
	[cr_returned_time_sk] [int] NULL,
	[cr_item_sk] [int] NOT NULL,
	[cr_refunded_customer_sk] [int] NULL,
	[cr_refunded_cdemo_sk] [int] NULL,
	[cr_refunded_hdemo_sk] [int] NULL,
	[cr_refunded_addr_sk] [int] NULL,
	[cr_returning_customer_sk] [int] NULL,
	[cr_returning_cdemo_sk] [int] NULL,
	[cr_returning_hdemo_sk] [int] NULL,
	[cr_returning_addr_sk] [int] NULL,
	[cr_call_center_sk] [int] NULL,
	[cr_catalog_page_sk] [int] NULL,
	[cr_ship_mode_sk] [int] NULL,
	[cr_warehouse_sk] [int] NULL,
	[cr_reason_sk] [int] NULL,
	[cr_order_number] [int] NOT NULL,
	[cr_return_quantity] [int] NULL,
	[cr_return_amount] [decimal](7, 2) NULL,
	[cr_return_tax] [decimal](7, 2) NULL,
	[cr_return_amt_inc_tax] [decimal](7, 2) NULL,
	[cr_fee] [decimal](7, 2) NULL,
	[cr_return_ship_cost] [decimal](7, 2) NULL,
	[cr_refunded_cash] [decimal](7, 2) NULL,
	[cr_reversed_charge] [decimal](7, 2) NULL,
	[cr_store_credit] [decimal](7, 2) NULL,
	[cr_net_loss] [decimal](7, 2) NULL
)
WITH
(
	DISTRIBUTION = HASH ( [cr_item_sk] ),
	CLUSTERED COLUMNSTORE INDEX ORDER ([cr_returned_date_sk], [cr_item_sk])
)
GO