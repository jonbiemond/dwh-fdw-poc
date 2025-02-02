WITH source AS (
    SELECT * FROM {{ source('app', 'sales') }}
)
, renamed AS (
    SELECT
        id AS sales_id,
        customer_id,
        product_id,
        quantity,
        total_price,
        sold_at
    FROM source
)
SELECT * FROM renamed
