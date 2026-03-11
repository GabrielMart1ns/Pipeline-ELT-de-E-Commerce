SELECT 
    order_id
FROM 
    {{ref("stg_orderDetails")}}
WHERE 
    order_id IS NULL