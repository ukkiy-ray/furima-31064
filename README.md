# README

# テーブル設計

## users テーブル

| Column              | Type     | Options     |
| ------------------- | -------- | ----------- |
| nickname            | string   | null: false |
| last_name           | string   | null: false |
| first_name          | string   | null: false |
| last_name_furigana  | string   | null: false |
| first_name_furigana | string   | null: false |
| email               | string   | null: false |
| password            | string   | null: false |
| birthday            | date     | null: false |

### Association

- has_many :items
- has_many :buyers

## items テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| title               | string     | null: false                    |
| item_details        | text       | null: false                    |
| status_id           | integer    | null: false                    |
| category_id         | integer    | null: false                    |
| delivery_charge_id  | integer    | null: false                    |
| delivery_area_id    | integer    | null: false                    |
| days_to_delivery_id | integer    | null: false                    |
| price               | integer    | null: false                    |
| user                | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :buyer

## buyers テーブル

| Column  | Type       | Options                        |
| --------| ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one :purchase_address


## purchase_address テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| postal_code     | string     | null: false                    |
| prefectures     | integer    | null: false                    |
| city            | string     | null: false                    |
| building number | string     | null: false                    |
| address         | string     | null: false                    |
| phone_number    | string     | null: false                    |
| purchase_info   | references | null: false, foreign_key: true |

### Association

- belongs_to :buyer