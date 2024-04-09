{%snapshot snap_orders%}

    {{
     config(
        target_database = 'Shopdb',
        target_schema ='dbt_fredrick',
        unique_key ='order_id',

        strategy = 'check',
        check_cols =['order_id']
    )
    }}

select * from {{source('Shopdb','orders')}}

{%endsnapshot%}