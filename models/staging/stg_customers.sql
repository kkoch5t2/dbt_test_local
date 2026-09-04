with source as (
    select * from {{ ref('raw_customers') }}
),

renamed as (
    select
        customer_id,
        customer_name,
        email
    from source
)

select * from renamed
