select
    `order id`,
    category,
    `sub-category`,
    COUNT(*) AS linhas
from
    {{ source("ecommerce", 'order_details_raw')}}
group by
    1, 2, 3
having
    COUNT(*) > 1
order by
    linhas DESC
