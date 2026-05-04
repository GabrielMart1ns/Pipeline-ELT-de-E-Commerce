-- Análise mensal de receita, qtd_produtos e lucro
WITH
    calculos AS (
        SELECT
            DATE_TRUNC(order_date, MONTH) AS month,
            TRUNC(SUM(amount), 2) AS revenue,
            SUM(quantity) AS products_ordered,
            TRUNC(SUM(profit), 2) AS profit
        FROM
            {{ ref("int_ecommerce")}}
        GROUP BY
            1
    ),
    resultados_mensal AS (
        SELECT
            month,
            FORMAT_DATE('%b/%y', month) AS month_year,
            revenue,
            products_ordered,
            profit,
            ROUND(SAFE_DIVIDE(profit, revenue)*100, 2) AS profit_margin,
            LAG(revenue) OVER(ORDER BY month) AS previous_month_rev
        FROM
            calculos
    )
SELECT
    month_year,
    revenue,
    products_ordered,
    profit,
    profit_margin,
    (revenue - previous_month_rev) AS revenue_diff,
    ROUND((SAFE_DIVIDE(revenue, previous_month_rev)-1)*100, 2) as revenue_mom_growth
FROM
    resultados_mensal
