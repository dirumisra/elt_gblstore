{{
    config(
        materialized='incremental'
    )
}}

select *
from {{ source('snowflake', 'gblstore') }}

{% if is_incremental() %}
    -- this filter will only be applied on an incremental run
    where updated_date > (select max(updated_date) from {{ this }}) 
{% endif %}


