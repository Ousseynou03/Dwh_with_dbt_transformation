-- models/gold/dim_customers.sql

{{ config(
    materialized='table',
    schema='gold'
) }}

SELECT
    customer_id AS customer_key,        -- clé primaire de la dimension
    first_name,
    last_name,
    gender,
    country,
    signup_date
FROM {{ ref('silver_customers') }};
