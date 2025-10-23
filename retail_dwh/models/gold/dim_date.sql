-- models/gold/dim_date.sql

{{ config(
    materialized='table',
    schema='gold'
) }}

WITH dates AS (
    SELECT
        generate_series(
            '2023-01-01'::date,
            '2024-12-31'::date,
            interval '1 day'
        ) AS date_day
)
SELECT
    date_day AS date_key,
    EXTRACT(year FROM date_day) AS year,
    EXTRACT(month FROM date_day) AS month,
    TO_CHAR(date_day, 'Month') AS month_name,
    EXTRACT(day FROM date_day) AS day,
    EXTRACT(quarter FROM date_day) AS quarter
FROM dates
