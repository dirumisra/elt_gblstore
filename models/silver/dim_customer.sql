{{
    config(
        materialized='table',
        cotracts = {"enabled": true,
        "primary_key": ["CUSTOMER_ID"]}
    )
}}

select 
CUSTOMER_ID,
customer_name,
segment
from {{ ref('ing_gblstore') }}