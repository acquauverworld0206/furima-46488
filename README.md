## データベース設計

### `users` テーブル

| カラム名             | データ型 | 概要                   | オプション                  |
| -------------------- | -------- | ---------------------- | --------------------------- |
| `nickname`           | `string` | ニックネーム           | `null: false`               |
| `email`              | `string` | メールアドレス         | `null: false`, `unique: true` |
| `encrypted_password` | `string` | 暗号化されたパスワード | `null: false`               |
| `last_name`          | `string` | 姓                     | `null: false`               |
| `first_name`         | `string` | 名                     | `null: false`               |
| `last_name_kana`     | `string` | 姓（カナ）             | `null: false`               |
| `first_name_kana`    | `string` | 名（カナ）             | `null: false`               |
| `birth_date`         | `date`   | 生年月日               | `null: false`               |

### Associations

`has_many :items`
`has_many :orders`

### `items` テーブル

| カラム名                  | データ型        | 概要                     | オプション                               |
| ------------------------- | --------------- | ------------------------ | ---------------------------------------- |
| `name`                    | `string`        | 商品名                   | `null: false`                            |
| `description`             | `text`          | 商品の説明               | `null: false`                            |
| `category_id`             | `integer`       | カテゴリーID             | `null: false`                            |
| `condition_id`            | `integer`       | 商品の状態ID             | `null: false`                            |
| `shipping_fee_payer_id`   | `integer`       | 配送料の負担者ID         | `null: false`                            |
| `prefecture_id`           | `integer`       | 発送元の地域ID           | `null: false`                            |
| `shipping_day_id`         | `integer`       | 発送までの日数ID         | `null: false`                            |
| `price`                   | `integer`       | 価格                     | `null: false`                            |
| `user`                 | `references`        | ユーザーのID（外部キー） | `null: false`, `foreign_key: true`       |

### Associations

`belongs_to :user`
`has_one :order`
`has_one_attached :image`

### `orders` テーブル

| カラム名  | データ型 | 概要                     | オプション                               |
| --------- | -------- | ------------------------ | ---------------------------------------- |
| `user` | `references` | ユーザーのID（外部キー） | `null: false`, `foreign_key: true`       |
| `item` | `references` | 商品のID（外部キー）     | `null: false`, `foreign_key: true`       |

### Associations

`belongs_to :user`
`belongs_to :item`
`has_one : shipping_address`

### `shipping_addresses` テーブル

| カラム名           | データ型 | 概要                   | オプション                               |
| ------------------ | -------- | ---------------------- | ---------------------------------------- |
| `postal_code`      | `string` | 郵便番号               | `null: false`                            |
| `prefecture_id`    | `integer`| 都道府県ID             | `null: false`                            |
| `city`             | `string` | 市区町村               | `null: false`                            |
| `street_address`   | `string` | 番地                   | `null: false`                            |
| `building_name`    | `string` | 建物名                 |                                          |
| `phone_number`     | `string` | 電話番号               | `null: false`                            |
| `order`         | `references` | 購入記録のID（外部キー） | `null: false`, `foreign_key: true`       |

### Associations

`belongs_to : order`