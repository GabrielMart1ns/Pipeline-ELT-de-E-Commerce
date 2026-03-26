{{config(materialized='table')}}

WITH customers_analysis AS (
  SELECT 
      customer_name,
      COUNT(DISTINCT order_id) AS total_orders,
      SUM(amount) AS revenue,
      ROUND(AVG(amount), 2) AS customer_avg_value,
      SUM(profit) AS profit,
      ROUND(SAFE_DIVIDE(SUM(profit), SUM(amount))*100, 2) AS profit_margin
  FROM
    {{ref("int_ecommerce")}}
  GROUP BY
    1
)
SELECT
  *
FROM
  customers_analysis
ORDER BY
    profit DESC
