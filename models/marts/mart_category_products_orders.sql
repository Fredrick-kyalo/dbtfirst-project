{{ 
    config(materialized='table') 
}}




SELECT * FROM {{ref("int_product_product_category")}}



