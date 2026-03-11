-- Análise de receita por ano
SELECT
  EXTRACT(YEAR FROM order_date) AS year,
  TRUNC(SUM(amount), 2) AS total_revenue,
  SUM(quantity) AS total_quantity,
  TRUNC(SUM(profit), 2) AS total_profit
FROM
  {{ ref("int_ecommerce")}}
GROUP BY
  1
ORDER BY
  1