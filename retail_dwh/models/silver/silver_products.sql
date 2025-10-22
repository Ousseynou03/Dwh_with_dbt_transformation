WITH src AS (
    SELECT * FROM {{ source('bronze', 'products') }}
)
SELECT
    product_id::int AS product_id,
    INITCAP(product_name) AS product_name,
    category,
    price::numeric AS price
FROM src
WHERE product_id IS NOT NULL
