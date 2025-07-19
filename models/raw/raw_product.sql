{{
    config(
        materialized='table'
    )
}}

select * from {{ source('snowflakeraw','products')}}