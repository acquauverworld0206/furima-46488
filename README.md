## データベース設計

### `users` テーブル

| カラム名             | データ型 | 概要                       |
| -------------------- | -------- | -------------------------- |
| `id`                 | `bigint` | 主キー                     |
| `nickname`           | `string` | ニックネーム               |
| `email`              | `string` | メールアドレス（一意）     |
| `encrypted_password` | `string` | 暗号化されたパスワード     |
| `last_name`          | `string` | 姓                         |
| `first_name`         | `string` | 名                         |
| `last_name_kana`     | `string` | 姓（カナ）                 |
| `first_name_kana`    | `string` | 名（カナ）                 |
| `birth_date`         | `date`   | 生年月日                   |

### `items` テーブル

| カラム名                  | データ型        | 概要                               |
| ------------------------- | --------------- | ---------------------------------- |
| `id`                      | `bigint`        | 主キー                             |
| `name`                    | `string`        | 商品名                             |
| `description`             | `text`          | 商品の説明                         |
| `category_id`             | `integer`       | カテゴリーID                       |
| `condition_id`            | `integer`       | 商品の状態ID                       |
| `shipping_fee_payer_id`   | `integer`       | 配送料の負担者ID                   |
| `prefecture_id`           | `integer`       | 発送元の地域ID                     |
| `shipping_day_id`         | `integer`       | 発送までの日数ID                   |
| `price`                   | `integer`       | 価格                               |
| `user_id`                 | `bigint`        | 出品したユーザーのID（外部キー）   |
| `image`                   | `ActiveStorage` | 商品画像                           |

### `orders` テーブル

| カラム名  | データ型 | 概要                               |
| --------- | -------- | ---------------------------------- |
| `id`      | `bigint` | 主キー                             |
| `user_id` | `bigint` | 購入したユーザーのID（外部キー）   |
| `item_id` | `bigint` | 購入された商品のID（外部キー）     |

### `shipping_addresses` テーブル

| カラム名           | データ型 | 概要                               |
| ------------------ | -------- | ---------------------------------- |
| `id`               | `bigint` | 主キー                             |
| `postal_code`      | `string` | 郵便番号                           |
| `prefecture_id`    | `integer`| 都道府県ID                         |
| `city`             | `string` | 市区町村                           |
| `street_address`   | `string` | 番地                               |
| `building_name`    | `string` | 建物名                             |
| `phone_number`     | `string` | 電話番号                           |
| `order_id`         | `bigint` | 紐づく購入記録のID（外部キー）     |