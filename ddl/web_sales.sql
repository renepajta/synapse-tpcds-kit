SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [web_sales]
(
	[ws_sold_date_sk] [int] NULL,
	[ws_sold_time_sk] [int] NULL,
	[ws_ship_date_sk] [int] NULL,
	[ws_item_sk] [int] NOT NULL,
	[ws_bill_customer_sk] [int] NULL,
	[ws_bill_cdemo_sk] [int] NULL,
	[ws_bill_hdemo_sk] [int] NULL,
	[ws_bill_addr_sk] [int] NULL,
	[ws_ship_customer_sk] [int] NULL,
	[ws_ship_cdemo_sk] [int] NULL,
	[ws_ship_hdemo_sk] [int] NULL,
	[ws_ship_addr_sk] [int] NULL,
	[ws_web_page_sk] [int] NULL,
	[ws_web_site_sk] [int] NULL,
	[ws_ship_mode_sk] [int] NULL,
	[ws_warehouse_sk] [int] NULL,
	[ws_promo_sk] [int] NULL,
	[ws_order_number] [int] NOT NULL,
	[ws_quantity] [int] NULL,
	[ws_wholesale_cost] [decimal](7, 2) NULL,
	[ws_list_price] [decimal](7, 2) NULL,
	[ws_sales_price] [decimal](7, 2) NULL,
	[ws_ext_discount_amt] [decimal](7, 2) NULL,
	[ws_ext_sales_price] [decimal](7, 2) NULL,
	[ws_ext_wholesale_cost] [decimal](7, 2) NULL,
	[ws_ext_list_price] [decimal](7, 2) NULL,
	[ws_ext_tax] [decimal](7, 2) NULL,
	[ws_coupon_amt] [decimal](7, 2) NULL,
	[ws_ext_ship_cost] [decimal](7, 2) NULL,
	[ws_net_paid] [decimal](7, 2) NULL,
	[ws_net_paid_inc_tax] [decimal](7, 2) NULL,
	[ws_net_paid_inc_ship] [decimal](7, 2) NULL,
	[ws_net_paid_inc_ship_tax] [decimal](7, 2) NULL,
	[ws_net_profit] [decimal](7, 2) NULL
)
WITH
(
	DISTRIBUTION = HASH ( [ws_sold_date_sk] ),
	CLUSTERED COLUMNSTORE INDEX
)
GO