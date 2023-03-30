{{config(alias='users') }}
{{ config(materialized='table') }}

select id, user_name from source.users
