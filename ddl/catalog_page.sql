SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [catalog_page]
(
	[cp_catalog_page_sk] [int] NOT NULL,
	[cp_catalog_page_id] [char](16) NOT NULL,
	[cp_start_date_sk] [int] NULL,
	[cp_end_date_sk] [int] NULL,
	[cp_department] [varchar](50) NULL,
	[cp_catalog_number] [int] NULL,
	[cp_catalog_page_number] [int] NULL,
	[cp_description] [varchar](100) NULL,
	[cp_type] [varchar](100) NULL
)
WITH
(
	DISTRIBUTION = REPLICATE,
	CLUSTERED COLUMNSTORE INDEX
)
GO
