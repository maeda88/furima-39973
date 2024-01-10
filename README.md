# テーブル設計

## users テーブル

| Column                | Type     | Options                  |
| --------------------- | -------- | ------------------------ |
| nickname              | string   | null: false              |
| email                 | string   | null: false, unique:true |
| encrypted_password    | string   | null: false              |
| family_name           | string   | null: false              |
| first_name            | string   | null: false              |
| family_name_kana      | string   | null: false              |
| first_name_kana       | string   | null: false              |
| birthday              | date     | null: false              |


### Association

- has_many :items
- has_many :buyings

## items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| trade_name         | string     | null: false                    |
| explanation        | text       | null: false                    |
| category_id        | integer    | null: false                    |
| condition_id       | integer    | null: false                    |
| delivery_charge_id | integer    | null: false                    |
| prefecture_id      | integer    | null: false                    |
| delivery_time_id   | integer    | null: false                    |
| price              | integer    | null: false                    |


### Association

- belongs_to :user
- has_one :buying

## buyings テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one :address

## addresses テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| buying         | references | null: false, foreign_key: true |
| postcode       | string     | null: false                    |
| prefecture_id  | integer    | null: false                    |
| municipality   | string     | null: false                    |
| street_address | string     | null: false                    |
| building_name  | string     |                                |
| phonenumber    | string     | null: false                    |

### Association

- belongs_to :buying
