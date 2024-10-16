# テーブル設計

## users テーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false, unique: true |
| email              | string | null: false, unique: true |
| password           | string | null: false |
| name_kanji         | string | null: false |
| name_kana          | string | null: false |
| birthday           | date   | null: false |

### Association
- has_many :items*
- has_many :buys*


## items テーブル
| Column           | Type   | Options     |
| ---------------- | ------ | ----------- |
| image_url        |        | null: false |
| item             | text   | null: false |
| item_description | text   | null: false |
| category         | string | null: false |
| item_status      | string | null: false |
| shipping_cost    | string | null: false |
| shipping_region  | string | null: false |
| delivery_time    | string | null: false |
| price            | integer | null: false |
| user             | references | null: false, foreign_key: true |

### Association
- has_one    :buy*
- belongs_to :user*


## buys テーブル
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| item   | references | null: false, foreign_key: true |
| user   | references | null: false, foreign_key: true |

### Association
- belongs_to :item*
- belongs_to :user*
- has_one    :buyer_address*

## buyer_address テーブル
| Column         | Type       | Options                     |
| -------------- | ------- | ------------------------------ |
| postcode       | integer | null: false |
| prefectures    | string  | null: false |
| municipalities | text    | null: false |
| street_address | text    | null: false |
| building_name  | text    |             |
| telephone      | integer | null: false |
| buy            | references | null: false, foreign_key: true|

### Association
- belongs_to :buy*
