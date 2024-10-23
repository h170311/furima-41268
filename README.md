# テーブル設計

## users テーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false, unique: true|
| encrypted_password | string | null: false |
| last_name_kanji    | string | null: false |
| first_name_kanji   | string | null: false |
| last_name_kana     | string | null: false |
| first_name_kana    | string | null: false |
| birthday           | date   | null: false |

### Association
- has_many :items
- has_many :buys


## items テーブル
| Column           | Type    | Options     |
| ---------------- | ------- | ----------- |
| item_name        | string  | null: false |
| item_description | text    | null: false |
| category_id      | integer | null: false |
| item_status_id   | integer | null: false |
| shipping_cost_id | integer | null: false |
| prefecture_id    | integer | null: false |
| delivery_time_id | integer | null: false |
| price            | integer | null: false |
| user             | references | null: false, foreign_key: true |

### Association
- has_one    :buy
- belongs_to :user


## buys テーブル
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| item   | references | null: false, foreign_key: true |
| user   | references | null: false, foreign_key: true |

### Association
- belongs_to :item
- belongs_to :user
- has_one    :buyer_address

## buyer_address テーブル
| Column         | Type    | Options                        |
| -------------- | ------- | ------------------------------ |
| postcode       | string  | null: false |
| prefecture_id  | integer | null: false |
| municipalities | string  | null: false |
| street_address | string  | null: false |
| building_name  | string  |             |
| telephone      | string  | null: false |
| buy            | references | null: false, foreign_key: true|

### Association
- belongs_to :buy
