{{ config(materialized='table') }}

SELECT * FROM {{ref('int_customers_orders_orderitems')}}
