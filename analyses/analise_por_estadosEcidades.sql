SELECT
    state,
    city,
    COUNT(DISTINCT order_id) AS orders,
    SUM(quantity) AS products_ordered,
    SUM(amount) AS revenue,
    SUM(profit) AS profit,
    ROUND(SAFE_DIVIDE(SUM(profit), SUM(amount))*100, 2) AS profit_margin
FROM
    {{ ref("int_ecommerce")}}
GROUP BY
    1, 2
ORDER BY
    profit DESC