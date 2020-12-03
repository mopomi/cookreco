# テーブル設計

# users テーブル
| Column     | Type   | Options     |
| ---------- | ------ | ----------- |
| email      | string | null: false |
| password   | string | null: false |
| name       | string | null: false |

# Association
- has_many :recipes
- has_many :memos


# recipes テーブル
| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| title      | string     | null: false                    |
| genre_id   | integer    | null: false                    |
| point      | text       |                                |
| url        | string     |                                |
| user       | references | null: false, foreign_key: true |

# Association
- belongs_to :user
- has_many :memos


# memos テーブル
| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| text      | text       | null: false                    |
| user      | references | null: false, foreign_key: true |
| prototype | references | null: false, foreign_key: true |

# Association

- belongs_to :user
- belongs_to :recipe