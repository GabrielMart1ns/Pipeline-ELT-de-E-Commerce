-- Análise de correspondência de datas entre listOfOrders e salesTarget
select distinct
    t1.month_year,
    t2.month_orderDate
from
    {{ref("stg_listOfOrders")}} as t1
left join
    {{ref("stg_salesTarget")}} as t2
on
    t1.month_year = t2.month_orderDate