-- Análise de correspondência quantitativa entre orderDetails e listOfOrders
WITH
    e_commerce AS (
        select
            order_id
        from {{ref('stg_orderDetails')}} as orderDetails
    ),
    stg_listOfOrders AS (
        select
            order_id
        from {{ref("stg_listOfOrders")}}
    )
select
    count(distinct e.order_id) as contagem
from
    e_commerce as e
inner join
    stg_listOfOrders as stg
on
    e.order_id = stg.order_id