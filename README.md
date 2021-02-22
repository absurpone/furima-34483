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
| birthday_year    | int        | null: false               |
| birthday_month   | int        | null: false               |
| birthday_date    | int        | null: false               |

### Association
- has_many :items
- has_many :purchases

## itemsテーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| price         | int        | null: false                    |
| title         | string     | null: false                    |
| detail        | text       | null: false                    |
| category      | string     | null: false                    |
| condition     | string     | null: false                    |
| pays_postage  | string     | null: false                    |
| ship_from     | string     | null: false                    |
| shipping_date | string     | null: false                    |
| user          | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :purchase
- has_one :address

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

| Column     | Type       | Options                        |
| ------     | ---------- | ------------------------------ |
| zip_code   | string     | null: false                    |
| prefecture | text       | null: false                    |
| city       | text       | null: false                    |
| street     | text       | null: false                    |
| building   | text       | null: false                    |
| telephone  | string     | null: false                    |
| item       | references | null: false, foreign_key: true |
| purchase   | references | null: false, foreign_key: true |

### Association
- belongs_to :purchase
- belongs_to :item
