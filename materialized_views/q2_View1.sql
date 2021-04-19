CREATE MATERIALIZED VIEW q2_View1 WITH (DISTRIBUTION = HASH([Expr0])) AS
SELECT  [j].[i_category]           AS [Expr0]
       ,AVG([j].[i_current_price]) AS [Expr1]
FROM [tpcds].[item] [j]
GROUP BY  [j].[i_category]