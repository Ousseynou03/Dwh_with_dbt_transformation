WITH src AS (
    SELECT customer_id, first_name, last_name, gender, country, signup_date  FROM {{ source('bronze', 'customers') }}
)
SELECT
    customer_id::int AS customer_id,
    INITCAP(first_name) AS first_name,
    INITCAP(last_name) AS last_name,
    gender,
    country,
    signup_date::date AS signup_date
FROM src
WHERE customer_id IS NOT NULL
