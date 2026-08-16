-- dbtの最大の強みは「他のモデル（SQLファイル）を再利用できる」ことです
-- `ref('モデル名')` を使うことで、依存関係をdbtが自動で解決してくれます

with orders as (
    -- さきほど作成した stg_orders を参照する
    select * from {{ ref('stg_orders') }}
),

-- 例えば「月別の売上集計」をするようなデータマート（最終的な分析用データ）を作ります
monthly_summary as (
    select
        -- 注文日から月だけを抽出（※ 実際のDBの方言に合わせて書きます。ここではシンプルに先頭7文字を取る想定）
        substr(order_date, 1, 7) as order_month,
        count(order_id) as total_orders,
        sum(total_amount) as total_revenue
    from orders
    where status != 'returned' -- 返品されたものは除外
    group by 1
)

select * from monthly_summary
