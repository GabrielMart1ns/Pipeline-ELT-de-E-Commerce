select
    `Order ID` as order_id,
    amount as amount,
    profit as profit,
    quantity as quantity,
    category as category,
    `Sub-category` as sub_category
from
    {{source("ecommerce", 'order_details_raw')}}