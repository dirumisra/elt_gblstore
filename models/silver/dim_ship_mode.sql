{{
    config(
        materialized='table'
    )
}}

select
    ship_date,
    ship_mode,
    shipping_cost
from {{ ref('ing_gblstore') }}