SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [ship_mode]
(
	[sm_ship_mode_sk] [int] NOT NULL,
	[sm_ship_mode_id] [char](16) NOT NULL,
	[sm_type] [char](30) NULL,
	[sm_code] [char](10) NULL,
	[sm_carrier] [char](20) NULL,
	[sm_contract] [char](20) NULL
)
WITH
(
	DISTRIBUTION = REPLICATE,
	CLUSTERED COLUMNSTORE INDEX
)
GO