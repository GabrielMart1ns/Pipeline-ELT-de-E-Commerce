select
    *
from
    {{ref("stg_listOfOrders")}}
where
    customer_name IS NULL