

## アプリケーション名
- cookreco

## アプリケーションの概要
- ログインすると、自分のよく作る料理のレシピやポイントを記録しておくことができます。
- 他人の投稿も参照することができます。
- ログインしていなくても他人の投稿一覧、詳細を参照することが可能です。

## アプリケーションのURL
- https://cookreco.herokuapp.com/

## Basic認証ID、Password
- ID:cook2020
- Password:2121

## テスト用アカウント
- Email:111@gmail
- Password:111111

## 利用方法
- ユーザー登録をすると、自分の料理を記録することができます。
- 記録項目は、お料理名、カテゴリー選択、レシピのURL、調理する際のポイントです。
- また、追記したい場合はメモ機能を使用できます。

## 目指した課題解決
- 「毎日、献立を考えるのが大変」、「前に作ったレシピで作ったけどレシピ通りだと味が濃すぎた。前回もそうだったことを忘れていた」、
  「以前作ったレシピが美味しかったけど、どのレシピか忘れてしまった」などの日々の悩みを抱えている方のお力になりたいと考案したアプリケーションです。
- ユーザー登録するとレシピのURLや調理のポイントなどを記録できます。特に調理のポイントに関しましては、その方のお味の基準や健康状態に合わせた良い調理方法を
  書き留めることができます。例えば、「醤油は半分の量にした」や、「（熱の通りがよいレンジなので）レンジは600wで1分で加熱した」、
  「（アレルギーなどで）卵を抜いたが問題なかった」など、レシピ通りの分量や作り方ではないが、その方やご家庭の基準で一番美味しくできたという時のポイントを記述しておくと、次回もまた安心して作ることができます。

## 実装要件

- ユーザー登録、ログイン機能
- 投稿機能
- マイページ機能
- メモ機能
- 検索機能
- 一覧表示機能
- 詳細表示機能
- カテゴリー検索機能
- 編集機能
- 削除機能
- 画像プレビュー表示機能
- マイページ内カテゴリー検索機能
- いいね！機能
- いいね！した投稿を一覧で確認機能

## 実装機能動作の様子

- ユーザー登録：https://gyazo.com/d3b3568527381398717a636f21fb9e68
- 投稿機能：https://gyazo.com/2cd50173e41b83566c3f4ff025e4ebe1
- マイページ機能：https://gyazo.com/fc8415e367f7e4c49d5cfb632b1ba1c5
- メモ機能：https://gyazo.com/00296b166ecc2ecd69c9e81b25e803ab
- 検索機能：https://gyazo.com/c4f286b06ea9ecf60118057ad2673c2a
- 詳細表示機能：https://gyazo.com/7cb42315ce2fe02f69c614e8a4002afa
- カテゴリー検索機能：https://gyazo.com/d43d14d7e3d02cab29af604ea4de2990
- 編集機能：https://gyazo.com/63c7c516fc159910d2faf7e305cf74dd
- 削除機能：https://gyazo.com/c840cbf46913fc2c24c2570229f40c0e
- 画像プレビュー表示機能：https://gyazo.com/48fad305491def00178fec955e1abce6

## 実装予定の機能

- いいね！機能（デプロイ後エラー解消）
- マイページ内カテゴリー検索機能


## ローカルでの動作方法(アプリケーションの起動）

$ rails s
→http://localhost:3000



## DB設計

## ER図
![cookreko](https://user-images.githubusercontent.com/73802103/102161815-5927dd00-3ecb-11eb-8cc5-ea9ed75388ad.png)




# users テーブル
| Column     | Type   | Options     |
| ---------- | ------ | ----------- |
| email      | string | null: false |
| password   | string | null: false |
| name       | string | null: false |

# Association
- has_many :recipes
- has_many :memos
- has_many :likes
- has_many :like_recipes


# recipes テーブル
| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| title       | string     | null: false                    |
| genre_id    | integer    | null: false                    |
| point       | text       |                                |
| url         | string     |                                |
| user        | references | null: false, foreign_key: true |
| likes_count | integer    |                                |


# Association
- belongs_to :user
- has_many :memos
- belongs_to :genre
- has_many :likes
- has_many :liking_users


# memos テーブル
| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| text      | text       | null: false                    |
| user      | references | null: false, foreign_key: true |
| recipe    | references | null: false, foreign_key: true |

# Association

- belongs_to :user
- belongs_to :recipe

# likes テーブル
| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| recipe    | references | null: false, foreign_key: true |

- belongs_to :recipe
- belongs_to :user

