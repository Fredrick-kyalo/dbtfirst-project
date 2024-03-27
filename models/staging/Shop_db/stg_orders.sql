with shopdb_orders as(
    select * from {{source('Shopdb','orders')}}
),

orderfinal as(
    select * from shopdb_orders
)

select * from orderfinal