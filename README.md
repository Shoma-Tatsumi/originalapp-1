# README

# テーブル設計

## prefectures table

### Association
- has-one :recruitment


## users table

| Column                 | Type    | Options                   |
| ---------------------- | ------- | ------------------------- |
| nickname               | string  | null: false               |
| email                  | string  | null: false, unique: true |
| encrypted_password     | string  | null: false               |
| age                    | string  |                           |
| years_of_experience_id | integer |                           |
| introduction           | text    |                           |

### Association
- has_many :recruitments
- has_many :comments


## recruitments table

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| event-date       | date       | null: false                    |
| start_time       | integer    | null: false                    |
| end_time         | integer    | null: false                    |
| place_id         | integer    | null: false                    |
| category_id      | integer    | null: false                    |
| description      | text       | null: false                    |
| prefecture       | references | null: false, foreign_key: true |
| user             | references | null: false, foreign_key: true |

### Association
- belongs_to :prefecture
- belongs_to :user
- has_many :comments


## commentsテーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| text        | text       | null: false                    |
| user        | references | null: false, foreign_key: true |
| recruitment | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :recruitment