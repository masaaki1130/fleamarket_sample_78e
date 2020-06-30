### usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false|
|password|string|null: false|
|familyname|string|null: false|
|familyname_kana|string|null: false|
|firstname|string|null: false|
|firstname_kana|string|null: false|
|birthday|date|null: false|
|phone_number|integer|null: false|
### Association
- has_many :purchases
- has_many :cards
- has_many :purchases
- has_many :addresses

### addressesテーブル
|user_id|references|null: false, foreign_key: true|
|postal|integer|null: false|
|prefectures|string|null: false|
|municipalities|string|null: false|
|address|integer|null: false|
|building|string||
### Association
- belongs_to :user

### purchasesテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|product_id|references|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :product


### cardsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|number|integer|null: false|
|date|date|null: false|
|Security|integer|null: false|
|name|string|null: false|
### Association
- belongs_to :user

### productsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|text|text|null: false|
|category_id|references|null: false, foreign_key: true|
|brand_id|references|null: false, foreign_key: true|
|status|string|null: false|
|charges|string|null: false|
|price|integer|null: false|
|postage|string|null: false|
|area|string|null: false|
|day|string|null: false|
|user_id|references|null: false, foreign_key: true|
|sell|boolean|null: false|
### Association
- belongs_to :user
- belongs_to :brand
- belongs_to :category
- has_many :image

###　imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|product_id|references|null: false, foreign_key: true|
### Association
- belongs_to :product

### brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
### Association
- has_many :products

### categorysテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
### Association
- has_many :products