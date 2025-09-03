{% snapshot customer_snapshot %}
    {{
    config(
      target_schema='snapshots',
      unique_key='row_id',
      strategy='check',
      check_cols=['row_id','updated_date']
    )
  }}

    select *

    from {{ source("snowflake", "gblstore") }}

{% endsnapshot %}
