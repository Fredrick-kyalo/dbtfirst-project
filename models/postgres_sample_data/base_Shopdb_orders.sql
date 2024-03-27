with source as (
      select * from {{ source('Shopdb', 'orders') }}
),
renamed as (
    select
        {{ adapter.quote("order_id") }},
        {{ adapter.quote("customer_id") }},
        {{ adapter.quote("order_date") }}

    from source
)
select * from renamed
  