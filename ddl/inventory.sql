SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [inventory]
(
	[inv_date_sk] [int] NOT NULL,
	[inv_item_sk] [int] NOT NULL,
	[inv_warehouse_sk] [int] NOT NULL,
	[inv_quantity_on_hand] [int] NULL
)
WITH
(
	DISTRIBUTION = HASH(inv_item_sk),
	CLUSTERED COLUMNSTORE INDEX ORDER ([inv_date_sk], [inv_item_sk])
)
GO