WITH stg_listOfOrders AS (
    select
        `order id`,
        `order date`,
        customerName,
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
