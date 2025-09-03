-- models/silver/dim_date.sql
{{ config(materialized='table') }}

with spine as (
  select dateadd(day, row_number() over(order by seq4()) - 1, to_date('2010-01-01')) as d
  from table(generator(rowcount => 12000))
)
select
  cast(d as date)                    as calendar_date,   -- new safe name
  to_number(to_char(d,'YYYYMMDD'))   as date_key,
  year(d)                            as year_num,
  quarter(d)                         as quarter_num,
  month(d)                          as month_num,
  to_char(d,'YYYY-MM')               as year_month,
  to_char(d,'Month')                 as month_name,
  day(d)                             as day_of_month
from spine;
