with shopdb_product_category as(
    select * from {{source('Shopdb','productcategory')}}
),
final_productcategory as (
    select * from shopdb_product_category
)

select  * from final_productcategory