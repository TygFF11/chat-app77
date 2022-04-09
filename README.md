# テーブル設計

# users
| column               | type   | option      |
| -------------------- | ------ | ----------- |
| name                 | string | null: false |
| email                | string | null: false |
| encrypted-password   | string | null: false |
- has_many :room-users
- has_many :rooms, through: :room-users
- has_many :messages

# rooms
| column | type   | option      |
| ------ | ------ | ----------- |
| name   | string | null: false |
- has_many :room-users
- has_many :users, through: :room-users
- has_many :messages

# rooms-users
| column | type       | option                         |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign-key: true |
| room   | references | null: false, foreign-key: true |
- belongs_to :user
- belongs_to :room

# messages
| column  | type   | option |
| ------- | ------ | ------ |
| content | string |        |
- belongs_to :user
- belongs_to :room


