{{
    config(
        materialized='table'
    )
}}

select 
    {{ dbt_utils.generate_surrogate_key(['o.orderid','c.customerid','p.productid'])}},
    o.orderid,
    o.orderdate,
    o.shipdate,
    o.shipmode,
    d.deliveryteam,
    o.ordercostprice,
    o.ordersellingprice,
    o.ordersellingprice-o.ordercostprice as orderprofit,
    c.customerid,
    c.customername,
    c.segment,
    c.country,
    p.productid,
    p.productname,
    p.category,
    p.subcategory,
    {{ markup('ordersellingprice','ordercostprice') }} as markup
from {{ ref('raw_orders') }} as o
left join {{ ref('raw_customer') }} as c 
on o.customerid=c.customerid
left join {{ ref('raw_product') }} as p 
on o.productid = p.productid
left join {{ ref('delivery_team') }} as d
on o.shipmode=d.shipmode

