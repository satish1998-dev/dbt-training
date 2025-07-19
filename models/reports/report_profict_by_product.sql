{{
    config(
        materialized='view'
    )
}}

select 
    productid,
    productname,
    category,
    subcategory,
    sum(orderprofit) as product_profit
from {{ ref('stg_orders') }}
group by 
    productid,
    productname,
    category,
    subcategory