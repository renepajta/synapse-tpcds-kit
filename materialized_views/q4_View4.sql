CREATE MATERIALIZED VIEW q4_View4 WITH (DISTRIBUTION = HASH([Expr0])) AS
SELECT  [DemoDW].[tpcds].[customer].[c_customer_id]            AS [Expr0]
       ,[DemoDW].[tpcds].[customer].[c_first_name]             AS [Expr1]
       ,[DemoDW].[tpcds].[customer].[c_last_name]              AS [Expr2]
       ,[DemoDW].[tpcds].[customer].[c_preferred_cust_flag]    AS [Expr3]
       ,[DemoDW].[tpcds].[customer].[c_birth_country]          AS [Expr4]
       ,[DemoDW].[tpcds].[customer].[c_login]                  AS [Expr5]
       ,[DemoDW].[tpcds].[customer].[c_email_address]          AS [Expr6]
       ,[DemoDW].[tpcds].[date_dim].[d_year]                   AS [Expr7]
       ,[DemoDW].[tpcds].[store_sales].[ss_ext_discount_amt]   AS [Expr8]
       ,[DemoDW].[tpcds].[store_sales].[ss_ext_sales_price]    AS [Expr9]
       ,[DemoDW].[tpcds].[store_sales].[ss_ext_wholesale_cost] AS [Expr10]
       ,[DemoDW].[tpcds].[store_sales].[ss_ext_list_price]     AS [Expr11]
       ,SUM(([DemoDW].[tpcds].[store_sales].[ss_ext_list_price]-[DemoDW].[tpcds].[store_sales].[ss_ext_wholesale_cost]-[DemoDW].[tpcds].[store_sales].[ss_ext_discount_amt]+[DemoDW].[tpcds].[store_sales].[ss_ext_sales_price])/(2.)) AS [Expr12]
       ,COUNT_BIG(([DemoDW].[tpcds].[store_sales].[ss_ext_list_price]-[DemoDW].[tpcds].[store_sales].[ss_ext_wholesale_cost]-[DemoDW].[tpcds].[store_sales].[ss_ext_discount_amt]+[DemoDW].[tpcds].[store_sales].[ss_ext_sales_price])/(2.)) AS [Expr13]
FROM [tpcds].[store_sales], [tpcds].[customer], [tpcds].[date_dim]
WHERE ([DemoDW].[tpcds].[store_sales].[ss_sold_date_sk]=[DemoDW].[tpcds].[date_dim].[d_date_sk]) 
AND ([DemoDW].[tpcds].[customer].[c_customer_sk]=[DemoDW].[tpcds].[store_sales].[ss_customer_sk]) 
GROUP BY  [DemoDW].[tpcds].[customer].[c_customer_id]
         ,[DemoDW].[tpcds].[customer].[c_first_name]
         ,[DemoDW].[tpcds].[customer].[c_last_name]
         ,[DemoDW].[tpcds].[customer].[c_preferred_cust_flag]
         ,[DemoDW].[tpcds].[customer].[c_birth_country]
         ,[DemoDW].[tpcds].[customer].[c_login]
         ,[DemoDW].[tpcds].[customer].[c_email_address]
         ,[DemoDW].[tpcds].[date_dim].[d_year]
         ,[DemoDW].[tpcds].[store_sales].[ss_ext_discount_amt]
         ,[DemoDW].[tpcds].[store_sales].[ss_ext_sales_price]
         ,[DemoDW].[tpcds].[store_sales].[ss_ext_wholesale_cost]
         ,[DemoDW].[tpcds].[store_sales].[ss_ext_list_price]