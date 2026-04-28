with
    stg_salestarget as (
        select
            `Month of Order Date` as month_orderdate,
            category as category,
            target as target
        from {{ source("ecommerce", "sales_target_raw") }}
    )
select month_orderdate, category, target
from stg_salestarget
