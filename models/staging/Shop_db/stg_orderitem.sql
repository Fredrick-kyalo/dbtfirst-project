with shopdb_orderitem as(
    select * from {{source('Shopdb','orderitem')}}
),
final_orderitem as (
    select * from shopdb_orderitem
)

select * from final_orderitem