# 🤝 新たな始まりを フットサルから
### フットサルを通じて 人と人を繋ぐアプリケーション

[![Image from Gyazo](https://i.gyazo.com/ef0718c6dad3f1f90ee3a3cc357e3e1c.jpg)](https://gyazo.com/ef0718c6dad3f1f90ee3a3cc357e3e1c)

<br></br>
# 💭 概要

### 一緒に運動をすると仲良くなりやすい

私自身、フットサルを通じて関係性が向上したことや
新しい友人ができ繋がりが増えた経験があったことから、
多くの人に共有したいと思い製作しました。

<br></br>
# 🌐  App URL
### **http://54.95.83.246/** 


# 💻  利用方法

#### `☆ トップページから新規登録・ログイン`
#### `☆ 都道府県を選択し一覧画面へ遷移する`
#### `☆ 新規投稿は右下アイコンをクリック`
#### `☆ 投稿完了後は一覧画面へ戻る`<br>
[![Image from Gyazo](https://i.gyazo.com/300e21e4b6cc34fd70fd86373b70d21f.gif)](https://gyazo.com/300e21e4b6cc34fd70fd86373b70d21f)
[![Image from Gyazo](https://i.gyazo.com/fe21c1467e554e5bda8175fc267837f9.gif)](https://gyazo.com/fe21c1467e554e5bda8175fc267837f9)
<br>

#### `☆ 一覧画面から１つの投稿を選択 → 投稿詳細画面へ遷移する`
#### `☆ 投稿者本人であれば投稿の編集・削除が投稿詳細画面から可能になる`<br>
[![Image from Gyazo](https://i.gyazo.com/c7175413d907b442ba648604f42e5984.gif)](https://gyazo.com/c7175413d907b442ba648604f42e5984)
<br>

#### `☆ 投稿詳細画面からコメントができる`<br>
[![Image from Gyazo](https://i.gyazo.com/63e245ebd1a300dc25704d38fa046291.gif)](https://gyazo.com/63e245ebd1a300dc25704d38fa046291)
<br>

#### `☆ 募集一覧・募集詳細画面からいいねができる`<br>
[![Image from Gyazo](https://i.gyazo.com/e7eacb33145cc8d77ce1db11d2c1ab00.gif)](https://gyazo.com/e7eacb33145cc8d77ce1db11d2c1ab00)



<br></br>
# ✅ 課題解決
| ユーザーストーリーから考える課題                                                     | 課題解決                                         |
| ------------------------------------------------------------------------------- | ------------------------------------------------- |
| どこでもフットサルができる場所・相手を見つけたいという課題                                          | 開催場所（都道府県）ごとに募集をみることができる機能 |
| 募集している相手の情報を知りたいという課題                                            | ユーザー詳細ページを表示する機能 |
| 参加したい先が見つかったが、参加について詳細を聞きたいという課題                                  | 質問が入力できるコメント機能 |
| 参加者側は参加したい募集をチェックし保存しておく課題<br>募集側は参加希望者数はどの程度いるか確認する課題 | 募集に対していいねを押せるいいね機能 |

<br></br>
# 📦  機能一覧
| 機能           | 概要             |
| -------------- | -----------------|
| ユーザー管理機能  | 新規登録・ログイン・ログアウトが可能  |
| 募集機能 | 募集が可能 |
| 募集詳細表示機能 | 各募集詳細が詳細ページで閲覧可能 |
| 募集編集・削除機能 | 投稿者本人のみ募集編集・削除が可能<br>募集日を過ぎると削除のみ可能 |
| ユーザー詳細表示機能 | 各ユーザーのプロフィール・募集一覧が閲覧可能 |
| ユーザー情報編集機能 | ログイン中のユーザーでアカウント本人であればプロフィール編集が可能 |
| コメント機能 | ログイン中のユーザーで投稿内容に対しコメントすることができる<br>募集日をすぎるとコメント不可 |
| いいね機能 | 参加したい募集にいいね機能を押すことができ、もう一度押すと削除できる |

<br></br>
# 🔨 追加予定機能
- 検索機能
- フォロー/フォロワー機能追加予定

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
# 📜 DB設計

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
- has_many :likes


## recruitments table

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| event_date       | date       | null: false                    |
| start_time       | integer    | null: false                    |
| end_time         | integer    | null: false                    |
| place            | string     | null: false                    |
| category_id      | integer    | null: false                    |
| description      | text       | null: false                    |
| prefecture       | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_many :comments
- has_many :likes


## commentsテーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| text        | text       | null: false                    |
| user        | references | null: false, foreign_key: true |
| recruitment | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :recruitment


## likes table

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| user        | references | null: false, foreign_key: true |
| recruitment | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :recruitment