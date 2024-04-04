WITH customers AS (
    SELECT * FROM {{ ref('stg_customers') }}
),
orders AS (
    SELECT * FROM {{ ref('stg_orders') }}
),
order_items AS (
    SELECT * FROM {{ ref('stg_orderitem') }}
),

-- Final query joining customers with orders
final AS (
    SELECT *
    FROM customers
    LEFT JOIN orders USING (customer_id)
)

-- Joining final query with order_items to calculate total monetary value for each customer
SELECT 
    final.customer_id,
    final.first_name,
    final.email,
    SUM(order_items.subtotal) AS total_monetary_value 
FROM 
    final

LEFT JOIN 
    order_items ON final.order_id = order_items.order_id
GROUP BY 
    final.customer_id,
    final.first_name,
    final.email

HAVING 
SUM (order_items.subtotal) IS NOT NULL
