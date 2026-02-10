select
    *
from
    {{ref("stg_listOfOrders")}}
where
    customerName IS NULL