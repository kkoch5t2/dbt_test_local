with source as (
    -- 実際の環境では source('jaffle_shop', 'orders') のようになりますが
    -- サンプルとしてダミーデータを利用します
    select 1 as id, 101 as user_id, '2023-01-01' as order_date, 'completed' as status, 1500 as amount union all
    select 2 as id, 102 as user_id, '2023-01-02' as order_date, 'shipped' as status, 2500 as amount union all
    select 3 as id, 101 as user_id, '2023-01-03' as order_date, 'returned' as status, 0 as amount
),

renamed as (
    select
        id as order_id,
        user_id as customer_id,
        order_date,
        status,
        amount as total_amount
    from source
)

select * from renamed
