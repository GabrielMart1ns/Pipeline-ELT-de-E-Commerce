with 

source as (

    select * from {{ source('ecommerce', 'list_of_orders_raw') }}

),

renamed as (

    select
        order id,
        order date,
        customername,
        state,
        city

    from source

)

select * from renamed