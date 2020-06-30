https://github.com/masaaki1130/fleamarket_sample_78e/files/4850091/ER.1.pdf
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
- has_many :addresses

### addressesテーブル
|familyname|string|null: false|
|familyname_kana|string|null: false|
|firstname|string|null: false|
|firstname_kana|string|null: false|
|user_id|references|null: false, foreign_key: true|
|postal|integer|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|address|integer|null: false|
|building|string||
|room_number|integer||
|phone_number|integer||
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
|sell|boolean|null: false|
|charges|string|null: false|
|price|integer|null: false|
|postage|string|null: false|
|user_id|references|null: false, foreign_key: true|
|status_id|references|null: false, foreign_key: true|
|day_id|references|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :brand
- belongs_to :category
- belongs_to :status
- belongs_to :day
- has_many :images
### statusesテーブル
|Column|Type|Options|
|------|----|-------|
|status|string|null: false|

### Association
- has_many :products

###  daysテーブル
|Column|Type|Options|
|------|----|-------|
|day|string|null: false|

### Association
- has_many :products

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

### categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
### Association
- has_many :products