### usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false|
|password|string|null: false|
|family_name|string|null: false|
|family_name_kana|string|null: false|
|first_name|string|null: false|
|first_name_kana|string|null: false|
|birth_day|date|null: false|
|phone_number|integer|null: false|
### Association
- has_many :purchases
- has_many :cards
- has_many :addresses
- has_many :products


### addressesテーブル
|Column|Type|Options|
|------|----|-------|
|family_name|string|null: false|
|family_name_kana|string|null: false|
|given_name|string|null: false|
|given_name_kana|string|null: false|
|user_id|references|null: false, foreign_key: true|
|postal|string|null: false|
|prefecture_id|string|null: false|
|city|string|null: false|
|house_number|string|null: false|
|building_name|string||
|phone_number|string||
### Association
- belongs_to :user
- belongs_to_active_hash :prefecture


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
|card_token|integer|null: false|
|card_token|date|null: false|
|card_token|string|null: false|
### Association
- belongs_to :user


### productsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|text|text|null: false|
|category_id|references|null: false, foreign_key: true|
|brand_id|integer||
|sell|boolean|null: false, default: false|
|price|integer|null: false|
|shipping_cost_id|integer|null: false|
|prefecture_id|integer|null: false|
|user_id|references|null: false, foreign_key: true|
|status_id|integer|null: false|
|day_id|integer|null: false|
### Association
- belongs_to_active_hash :prefecture
- belongs_to_active_hash :brand
- belongs_to_active_hash :status
- belongs_to_active_hash :day
- belongs_to_active_hash :shipping_cost
- has_many :purchases
- belongs_to :user
- belongs_to :category
- has_many :images
- accepts_nested_attributes_for :images, allow_destroy: true


### imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|product_id|references|null: false, foreign_key: true|
### Association
- belongs_to :product


### categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
### Association
- has_many :products
- has_ancestry
