{{config(materialized='table')}}

WITH
    e_commerce AS (
        select
            t2.order_id,
            t2.order_date,
            t2.month_year,
            t2.customer_name,
            t2.state,
            t2.city,
            t1.category,
            t1.sub_category,
            t1.amount,
            t1.quantity,
            t1.profit,
            t3.target
        from {{ref('stg_orderDetails')}} as t1
        inner join {{ref("stg_listOfOrders")}} as t2 on t1.order_id = t2.order_id
        inner join {{ref("stg_salesTarget")}} as t3 on
                                                        t2.month_year = t3.month_orderDate
                                                        AND t1.category = t3.category
    )
select
    order_id,
    order_date,
    month_year,
    customer_name,
    state,
    city,
    category,
    sub_category,
    amount,
    quantity,
    profit,
    SUM(DISTINCT target) as target
from e_commerce
group by
    order_id,
    order_date,
    month_year,
    customer_name,
    state,
    city,
    category,
    sub_category,
    amount,
    quantity,
    profit
