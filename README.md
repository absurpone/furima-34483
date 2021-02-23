## usersテーブル

| Column           | Type       | Options                   |
| ---------------- | ---------- | ------------------------- |
| nickname         | string     | null: false, unique: true |
| email            | string     | null: false, unique: true |
| password         | string     | null: false               |
| family_name      | string     | null: false               |
| first_name       | string     | null: false               |
| kana_family_name | string     | null: false               |
| kana_first_name  | string     | null: false               |
| birthday         | date       | null: false               |


### Association
- has_many :items
- has_many :purchases

## itemsテーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| price            | int        | null: false                    |
| title            | string     | null: false                    |
| detail           | text       | null: false                    |
| category_id      | integer    | null: false                    |
| condition_id     | integer    | null: false                    |
| pays_postage_id  | integer    | null: false                    |
| ship_from_id     | integer    | null: false                    |
| shipping_date_id | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :purchase

## purchaseテーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| item   | references | null: false, foreign_key: true |
| user   | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :address

## addressesテーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| zip_code      | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | text       | null: false                    |
| street        | text       | null: false                    |
| building      | text       |                                |
| telephone     | string     | null: false                    |
| purchase      | references | null: false, foreign_key: true |

### Association
- belongs_to :purchase