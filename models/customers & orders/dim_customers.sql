{{
    config(materialized='table')
}}

with customers as (
    select * from {{ ref('stg_customers') }}
),
orders as (
    select * from {{ ref('stg_orders') }}
),

-- Final query joining customers with orders
final as (
    select *
    from customers
    left join orders using (customer_id))
-- Selecting final results
select * from final
