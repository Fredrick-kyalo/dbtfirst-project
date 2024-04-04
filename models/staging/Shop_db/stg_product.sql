with shopdb_product as(
    select * from {{source('Shopdb','product')}}
),
final_product as (
    select * from shopdb_product
)

select * from final_product