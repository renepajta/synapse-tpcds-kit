CREATE MATERIALIZED VIEW q3_View2 WITH (DISTRIBUTION = HASH([Expr0])) AS
SELECT  [dt].[d_year]                                                  AS [Expr0]
       ,[DemoDW].[tpcds].[item].[i_brand]                              AS [Expr1]
       ,[DemoDW].[tpcds].[item].[i_brand_id]                           AS [Expr2]
       ,SUM([DemoDW].[tpcds].[store_sales].[ss_ext_sales_price])       AS [Expr3]
       ,COUNT_BIG([DemoDW].[tpcds].[store_sales].[ss_ext_sales_price]) AS [Expr4]
FROM [tpcds].[date_dim] [dt], [tpcds].[item], [tpcds].[store_sales]
WHERE ([dt].[d_date_sk]=[DemoDW].[tpcds].[store_sales].[ss_sold_date_sk]) 
AND ([dt].[d_moy]=(12)) 
AND ([DemoDW].[tpcds].[store_sales].[ss_item_sk]=[DemoDW].[tpcds].[item].[i_item_sk]) 
AND ([DemoDW].[tpcds].[item].[i_manufact_id]=(436)) 
GROUP BY  [dt].[d_year]
         ,[DemoDW].[tpcds].[item].[i_brand]
         ,[DemoDW].[tpcds].[item].[i_brand_id]