SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [item]
(
	[i_item_sk] [int] NOT NULL,
	[i_item_id] [char](16) NOT NULL,
	[i_rec_start_date] [date] NULL,
	[i_rec_end_date] [date] NULL,
	[i_item_desc] [varchar](200) NULL,
	[i_current_price] [decimal](7, 2) NULL,
	[i_wholesale_cost] [decimal](7, 2) NULL,
	[i_brand_id] [int] NULL,
	[i_brand] [char](50) NULL,
	[i_class_id] [int] NULL,
	[i_class] [char](50) NULL,
	[i_category_id] [int] NULL,
	[i_category] [char](50) NULL,
	[i_manufact_id] [int] NULL,
	[i_manufact] [char](50) NULL,
	[i_size] [char](20) NULL,
	[i_formulation] [char](20) NULL,
	[i_color] [char](20) NULL,
	[i_units] [char](10) NULL,
	[i_container] [char](10) NULL,
	[i_manager_id] [int] NULL,
	[i_product_name] [char](50) NULL
)
WITH
(
	DISTRIBUTION = REPLICATE,
	CLUSTERED COLUMNSTORE INDEX
)
GO