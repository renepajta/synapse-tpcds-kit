CREATE MATERIALIZED VIEW q6_View2 WITH (DISTRIBUTION = HASH([Expr0])) AS
SELECT  [DemoDW].[tpcds].[date_dim].[d_month_seq] AS [Expr0]
       ,[DemoDW].[tpcds].[date_dim].[d_year]      AS [Expr1]
       ,[DemoDW].[tpcds].[date_dim].[d_moy]       AS [Expr2]
FROM [tpcds].[date_dim]
GROUP BY  [DemoDW].[tpcds].[date_dim].[d_month_seq]
         ,[DemoDW].[tpcds].[date_dim].[d_year]
         ,[DemoDW].[tpcds].[date_dim].[d_moy]