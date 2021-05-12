# 🤝 新たな始まりを フットサルから
### フットサルを通じて 人と人が繋がれるアプリケーション

[![Image from Gyazo](https://i.gyazo.com/1f7713a454cebf0536660092a153cde9.jpg)](https://gyazo.com/1f7713a454cebf0536660092a153cde9)

<br></br>
# 💭　概要

### 一緒に運動をすると仲良くなりやすい

私自身、フットサルを通じて関係性が向上したことや
新しい友人ができ繋がりが増えた経験があったことから、
多くの人に共有したいと思い製作しようと決めました。

<br></br>
# 🌐  App URL
### **http://54.95.83.246/** 


# 💻  利用方法

#### `☆ トップページから新規登録・ログイン`
#### `☆ 都道府県を選択し一覧画面へ遷移する`
#### `☆ 新規投稿は右下アイコンをクリック`
#### `☆ 投稿完了後は一覧画面へ戻る`<br>
[![Image from Gyazo](https://i.gyazo.com/6d437c80cd7e0fba5156862abdd56355.gif)](https://gyazo.com/6d437c80cd7e0fba5156862abdd56355)
[![Image from Gyazo](https://i.gyazo.com/2ef9987b74f02bf8ea6583bdd325d2aa.gif)](https://gyazo.com/2ef9987b74f02bf8ea6583bdd325d2aa)
<br>
#### `☆ 一覧画面から１つの投稿を選択 → 投稿詳細画面へ遷移する`
#### `☆ 投稿者本人であれば投稿の編集・削除が投稿詳細画面から可能になる`<br>
[![Image from Gyazo](https://i.gyazo.com/6078400ccb23cd2a9e47dafb6ff6ba10.gif)](https://gyazo.com/6078400ccb23cd2a9e47dafb6ff6ba10)
<br>

#### `☆ 投稿詳細画面からコメントができる`<br>
[![Image from Gyazo](https://i.gyazo.com/6b123b219a6ab8f50026f34c8233969b.gif)](https://gyazo.com/6b123b219a6ab8f50026f34c8233969b)

<br></br>
# ✅ 課題解決
| ユーザーストーリーから考える課題                                                        | 課題解決                                         |
| ------------------------------------------------------------------------------- | ------------------------------------------------- |
| フットサルができる場所・相手を見つけたいという課題                                          | 開催場所（都道府県）ごとに募集をみることができる機能 |
| 募集している相手の情報を知りたいという課題                                            | ユーザー詳細ページを表示する機能 |
| 参加したい先が見つかったが、参加について詳細を聞きたいという課題                                  | 質問やコメントが入力できる機能 |

<br></br>
# 📦  機能一覧
| 機能           | 概要             |
| -------------- | -----------------|
| ユーザー管理機能  | 新規登録・ログイン・ログアウトが可能  |
| 投稿機能 | 画像付きで日記投稿が可能 |
| 投稿詳細表示機能 | 各投稿詳細が詳細ページで閲覧可能 |
| 投稿編集・削除機能 | 投稿者本人のみ投稿編集・削除が可能 |
| ユーザー詳細表示機能 | 各ユーザーのプロフィール・投稿一覧が閲覧可能 |
| ユーザー情報編集機能 | ログイン中のユーザーでアカウント本人であればプロフィール編集が可能 |
| コメント機能 | ログイン中のユーザーで投稿内容に対しコメントすることができる |

<br></br>
# 🔨 追加予定機能
- 検索機能
- フォロー/フォロワー機能追加予定
- いいね機能追加予定

<br></br>
# 🚜 開発環境

- VScode
- Ruby 2.6.5
- Rails 6.0.0
- mysql2 0.4.4
- JavaScript
- gem 3.0.3
- AWS EC2

<br></br>
# DB設計

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