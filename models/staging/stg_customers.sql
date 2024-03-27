with shopdb_customers as(
    select * from {{ source('Shopdb', 'customer') }}
),

final as(
    select * from shopdb_customers
)

select * from final