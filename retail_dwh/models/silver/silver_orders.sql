WITH orders AS (
    SELECT * FROM {{ source('bronze', 'orders') }}
),
products AS (
    SELECT * FROM {{ source('bronze', 'products') }}
)
SELECT
    o.order_id::int AS order_id,
    o.customer_id::int AS customer_id,
    o.product_id::int AS product_id,
    o.order_date::date AS order_date,
    o.quantity::int AS quantity,
    (o.quantity * p.price)::numeric AS total_amount
FROM orders o
JOIN products p ON o.product_id = p.product_id
WHERE o.order_id IS NOT NULL
