-- models/gold/fact_orders.sql

{{ config(
    materialized='table',
    schema='gold'
) }}

SELECT
    o.order_id AS order_key,
    c.customer_id AS customer_key,
    p.product_id AS product_key,
    o.order_date AS date_key,
    o.quantity,
    o.total_amount
FROM {{ ref('silver_orders') }} o
JOIN {{ ref('silver_customers') }} c ON o.customer_id = c.customer_id
JOIN {{ ref('silver_products') }} p ON o.product_id = p.product_id
