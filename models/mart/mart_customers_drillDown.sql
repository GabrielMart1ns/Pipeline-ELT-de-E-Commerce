{{config(materialized='table')}}

SELECT
    customer_name,
    category,
    sub_category,
    COUNT(DISTINCT order_id) AS total_orders,
    SUM(quantity) AS total_products,
    SUM(amount) AS revenue,
    SUM(profit) AS profit,
    ROUND(SAFE_DIVIDE(SUM(profit), SUM(amount))*100, 2) AS profit_margin
FROM
    {{ref("int_ecommerce")}}
GROUP BY
    1, 2, 3
ORDER BY
    customer_name ASC, profit DESC
      
