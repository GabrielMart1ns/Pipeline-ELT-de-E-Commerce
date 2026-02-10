WITH stg_listOfOrders AS (
    select
        `order id` as order_id,
        `order date` as order_date,
        FORMAT_DATE('%b-%y', `order date`) as month_year,
        customerName as customer_name,
        state,
        city
    from
        {{source("ecommerce", 'list_of_orders_raw')}}
    where
        customerName IS NOT NULL
)
select
    *
from
    stg_listOfOrders
