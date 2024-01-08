# テーブル設計

## users テーブル

| Column                | Type     | Options                  |
| --------------------- | -------- | ------------------------ |
| nickname              | string   | null: false              |
| email                 | string   | null: false, unique:true |
| password              | string   | null: false              |
| password_confirmation | string   | null: false              |
| family_name           | string   | null: false              |
| first_name            | string   | null: false              |
| family_name_kana      | string   | null: false              |
| first_name_kana       | string   | null: false              |
| birthday              | datetime | null: false              |


### Association

- has_many :items
- has_many :buying

## items テーブル

| Column          | Type     | Options     |
| --------------- | -------- | ----------- |
| image           | string   | null: false |
| trade_name      | string   | null: false |
| explanation     | text     | null: false |
| category        | string   | null: false |
| condition       | string   | null: false |
| delivery_charge | string   | null: false |
| destination     | string   | null: false |
| delivery_time   | string   | null: false |
| price           | integer  | null: false |


### Association

- belongs_to :user
- has_one :buying

## buying テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user_id | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user

## address テーブル

| Column         | Type    | Options     |
| -------------- | ------- | ----------- |
| postcode       | integer | null: false |
| prefecture     | string  | null: false |
| municipality   | string  | null: false |
| street_address | string  | null: false |
| building_name  | string  | null: false |
| phonenumber    | integer | null: false |

### Association

- belongs_to :buying
