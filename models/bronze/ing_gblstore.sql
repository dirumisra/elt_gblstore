{{
    config(
        materialized='table'
    )
}}

select * from {{ source('snowflake', 'gblstore') }}