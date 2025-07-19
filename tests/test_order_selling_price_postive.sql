SELECT
    orderid,
    SUM(ordersellingprice) AS total_price
FROM {{ ref('raw_orders') }}
GROUP BY orderid
HAVING SUM(ordersellingprice) <= 0
