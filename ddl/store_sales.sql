SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [store_sales]
(
	[ss_sold_date_sk] [int] NULL,
	[ss_sold_time_sk] [int] NULL,
	[ss_item_sk] [int] NOT NULL,
	[ss_customer_sk] [int] NULL,
	[ss_cdemo_sk] [int] NULL,
	[ss_hdemo_sk] [int] NULL,
	[ss_addr_sk] [int] NULL,
	[ss_store_sk] [int] NULL,
	[ss_promo_sk] [int] NULL,
	[ss_ticket_number] [int] NOT NULL,
	[ss_quantity] [int] NULL,
	[ss_wholesale_cost] [decimal](7, 2) NULL,
	[ss_list_price] [decimal](7, 2) NULL,
	[ss_sales_price] [decimal](7, 2) NULL,
	[ss_ext_discount_amt] [decimal](7, 2) NULL,
	[ss_ext_sales_price] [decimal](7, 2) NULL,
	[ss_ext_wholesale_cost] [decimal](7, 2) NULL,
	[ss_ext_list_price] [decimal](7, 2) NULL,
	[ss_ext_tax] [decimal](7, 2) NULL,
	[ss_coupon_amt] [decimal](7, 2) NULL,
	[ss_net_paid] [decimal](7, 2) NULL,
	[ss_net_paid_inc_tax] [decimal](7, 2) NULL,
	[ss_net_profit] [decimal](7, 2) NULL
)
WITH
(
	DISTRIBUTION = HASH ( [ss_sold_date_sk] ),
	CLUSTERED COLUMNSTORE INDEX
)
GO