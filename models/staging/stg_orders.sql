{{
    config(
        materialized='table'
    )
}}

select 
    o.orderid,
    o.orderdate,
    o.shipdate,
    o.shipmode,
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
    p.subcategory
from {{ ref('raw_orders') }} as o
left join {{ ref('raw_customer') }} as c 
on o.customerid=c.customerid
left join {{ ref('raw_product') }} as p 
on o.productid = p.productid
