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

## items テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| title            | string     | null: false                    |
| item_details     | text       | null: false                    |
| status           | integer    | null: false                    |
| category         | integer    | null: false                    |
| delivery_charge  | integer    | null: false                    |
| delivery_area    | integer    | null: false                    |
| days_to_delivery | integer    | null: false                    |
| price            | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase_info

## purchase_info テーブル

| Column  | Type       | Options                        |
| --------| ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one :purchase_address


## purchase_address テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefectures   | integer    | null: false                    |
| city          | string     | null: false                    |
| address       | integer    | null: false                    |
| phone_number  | integer    | null: false                    |
| purchase_info | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase_info