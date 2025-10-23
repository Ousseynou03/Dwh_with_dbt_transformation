-- models/gold/dim_products.sql

{{ config(
    materialized='table',
    schema='gold'
) }}

SELECT
    product_id AS product_key,
    product_name,
    category,
    price
FROM {{ ref('silver_products') }}
