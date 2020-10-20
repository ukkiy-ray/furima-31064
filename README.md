# README

# テーブル設計

## users テーブル

| Column              | Type     | Options     |
| ------------------- | -------- | ----------- |
| last_name           | string   | null: false |
| first_name          | string   | null: false |
| last_name_furigana  | string   | null: false |
| first_name_furigana | string   | null: false |
| email               | string   | null: false |
| password            | string   | null: false |
| birthday            | datetime | null: false |

### Association

- has_many :items

## items テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| title            | string     | null: false                    |
| status           | string     | null: false                    |
| category         | string     | null: false                    |
| delivery_charge  | string     | null: false                    |
| delivery_area    | string     | null: false                    |
| days_to_delivery | text       | null: false                    |
| item_details     | text       | null: false                    |
| price            | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase_info

## purchase_info テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| credit_card_number | integer    | null: false                    |
| cvv                | integer    | null: false                    |
| expiration_date    | datetime   | null: false                    |
| item               | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- has_one :purchase_address


## purchase_address テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | integer    | null: false                    |
| prefectures   | string     | null: false                    |
| city          | string     | null: false                    |
| address       | integer    | null: false                    |
| phone_number  | integer    | null: false                    |
| purchase_info | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase_info