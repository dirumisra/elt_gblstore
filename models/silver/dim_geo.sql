{{
    config(
        materialized='table'
    )
}}

select
    city,
    state,
    postal_code,
    country,
    market,
    region
from {{ ref('ing_gblstore') }}