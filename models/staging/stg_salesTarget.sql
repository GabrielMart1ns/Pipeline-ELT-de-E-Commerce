WITH stg_salesTarget AS (
    select
        `Month of Order Date` AS month_orderDate,
        Category as category,
        Target AS target
    from
        {{source("ecommerce", 'sales_target_raw')}}
)
select
    month_orderDate,
    category,
    target
from
    stg_salesTarget
