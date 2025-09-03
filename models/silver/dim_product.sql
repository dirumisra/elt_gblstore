{{
    config(
        materialized='table'
    )
}}

select 
    product_id,
    category,
    sub_category,
    product_name
from {{ ref('ing_gblstore') }}
