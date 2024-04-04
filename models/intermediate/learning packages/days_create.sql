{{ dbt_utils.date_spine(
    datepart="day",
    start_date="cast('2024-03-01' as date)",
    end_date="cast('2024-05-01' as date)"
   )
}}