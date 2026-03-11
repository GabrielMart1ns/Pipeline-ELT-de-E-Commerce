-- Visão geral das métricas em int_ecommerce
WITH metrics AS (
  SELECT
    CAST(COUNT(*) AS STRING) AS total_rows,
    CAST(COUNT(DISTINCT order_id) AS STRING) AS orders,
    CAST(COUNT(DISTINCT customer_name) AS STRING) AS customers,
    CAST(TRUNC(SUM(amount), 2) AS STRING) AS total_revenue,
    CAST(TRUNC(SUM(profit), 2) AS STRING) AS total_profit,
    CAST(TRUNC(SUM(amount)/COUNT(DISTINCT order_id), 2) AS STRING) AS avg_order_value,
    CONCAT(CAST(TRUNC((SUM(profit)/SUM(amount)*100), 2) AS STRING), '%') AS profit_margin
  FROM 
    `portfolio-101-417118.portfolio.int_ecommerce`
)
SELECT
  metric,
  value
FROM
  metrics
UNPIVOT (
  value FOR metric IN (
    total_rows,
    orders,
    customers,
    total_revenue,
    total_profit,
    avg_order_value,
    profit_margin
  )
)
