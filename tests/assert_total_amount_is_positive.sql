-- 注文の合計金額が0未満になっていないか（マイナス金額がないか）をテストする
-- dbtのテストは「エラーとなるレコード」を取得するSQLを書きます。
-- 1件でもレコードが返ってくればテスト失敗（エラー）となります。

select
    order_id,
    total_amount
from {{ ref('stg_orders') }}
where total_amount < 0
