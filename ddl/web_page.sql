SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [web_page]
(
	[wp_web_page_sk] [int] NOT NULL,
	[wp_web_page_id] [char](16) NOT NULL,
	[wp_rec_start_date] [date] NULL,
	[wp_rec_end_date] [date] NULL,
	[wp_creation_date_sk] [int] NULL,
	[wp_access_date_sk] [int] NULL,
	[wp_autogen_flag] [char](1) NULL,
	[wp_customer_sk] [int] NULL,
	[wp_url] [varchar](100) NULL,
	[wp_type] [char](50) NULL,
	[wp_char_count] [int] NULL,
	[wp_link_count] [int] NULL,
	[wp_image_count] [int] NULL,
	[wp_max_ad_count] [int] NULL
)
WITH
(
	DISTRIBUTION = REPLICATE,
	CLUSTERED COLUMNSTORE INDEX
)
GO