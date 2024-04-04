WITH 
products AS (
    SELECT * FROM {{ref('stg_product')}}
),
productcategory AS (
    SELECT * FROM {{ref('stg_product_category')}}
),
orderitems AS (
    SELECT * FROM {{ref('stg_orderitem')}}
),
final AS (
    SELECT 
        orderitems.order_id,
        orderitems.subtotal,
        productcategory.category_name,
        products.product_name,
        products.product_id,
        products.quantity,
        --category.category_name,
        products.price
    FROM 
        orderitems
    LEFT JOIN 
        products USING (product_id)
    LEFT JOIN 
        productcategory USING (category_id)
)
SELECT 
    category_name,
    product_name,
    product_id,
    
    order_id,
    subtotal,
    
    SUM(price * quantity) AS total_category_price
FROM 
    final
GROUP BY 
    category_name,
    product_name,
    subtotal,
    product_id,
    order_id

