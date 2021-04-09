SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [catalog_sales]
(
	[cs_sold_date_sk] [int] NULL,
	[cs_sold_time_sk] [int] NULL,
	[cs_ship_date_sk] [int] NULL,
	[cs_bill_customer_sk] [int] NULL,
	[cs_bill_cdemo_sk] [int] NULL,
	[cs_bill_hdemo_sk] [int] NULL,
	[cs_bill_addr_sk] [int] NULL,
	[cs_ship_customer_sk] [int] NULL,
	[cs_ship_cdemo_sk] [int] NULL,
	[cs_ship_hdemo_sk] [int] NULL,
	[cs_ship_addr_sk] [int] NULL,
	[cs_call_center_sk] [int] NULL,
	[cs_catalog_page_sk] [int] NULL,
	[cs_ship_mode_sk] [int] NULL,
	[cs_warehouse_sk] [int] NULL,
	[cs_item_sk] [int] NOT NULL,
	[cs_promo_sk] [int] NULL,
	[cs_order_number] [int] NOT NULL,
	[cs_quantity] [int] NULL,
	[cs_wholesale_cost] [decimal](7, 2) NULL,
	[cs_list_price] [decimal](7, 2) NULL,
	[cs_sales_price] [decimal](7, 2) NULL,
	[cs_ext_discount_amt] [decimal](7, 2) NULL,
	[cs_ext_sales_price] [decimal](7, 2) NULL,
	[cs_ext_wholesale_cost] [decimal](7, 2) NULL,
	[cs_ext_list_price] [decimal](7, 2) NULL,
	[cs_ext_tax] [decimal](7, 2) NULL,
	[cs_coupon_amt] [decimal](7, 2) NULL,
	[cs_ext_ship_cost] [decimal](7, 2) NULL,
	[cs_net_paid] [decimal](7, 2) NULL,
	[cs_net_paid_inc_tax] [decimal](7, 2) NULL,
	[cs_net_paid_inc_ship] [decimal](7, 2) NULL,
	[cs_net_paid_inc_ship_tax] [decimal](7, 2) NULL,
	[cs_net_profit] [decimal](7, 2) NULL
)
WITH
(
	DISTRIBUTION = HASH ( [cs_sold_date_sk] ),
	CLUSTERED COLUMNSTORE INDEX
)
GO