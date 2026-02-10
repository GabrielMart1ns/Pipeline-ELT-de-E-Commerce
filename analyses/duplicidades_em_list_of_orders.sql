select
    `order id`,
    customerName,
    COUNT(*) AS linhas
from
    {{source("ecommerce", 'list_of_orders_raw')}}
group by
    1, 2
having
    COUNT(*) > 1
order by
    linhas desc
