{{
    config(
        materialized='view'
    )
}}

select 
    customerid,
    customername,
    segment,
    country,
    sum(orderprofit) as customer_profit
from {{ ref('stg_orders') }}
group by customerid,
        customername,
        segment,
        country