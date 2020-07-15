![フリーマーケットサイト](https://gyazo.com/e9a2d42a04c4948dbda82b73cb4566b0)

<h2 align="center">FURIMA</h2>
<dl>
  <dt>:link:主な使用言語</dt>
<p align="center">
  <a href="https://www.ruby-lang.org/ja/"><img src="https://i1.wp.com/qs.nndo.jp/wp-content/uploads/2017/06/ruby.png?w=393" width="80px;" /></a>
  <br>
  <a href="https://railsguides.jp/getting_started.html"><img src="https://kuromame-blog.com/wp-content/uploads/rails-768x432.png" height="45px;" /></a>
  <a href="http://haml.info/"><img src="http://haml.info/images/haml.png" height="45px;" /></a>
  <a href="https://sass-lang.com/"><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/9/96/Sass_Logo_Color.svg/144px-Sass_Logo_Color.svg.png" height="40px;" /></a>
  <a href="https://jquery.com/"><img src="https://syncer.jp/storage/web/brand-logos/static/dst/jquery-logo-001.png" height="45px;" /></a>
  <a href="https://github.co.jp/"><img src="https://github.githubassets.com/images/modules/logos_page/GitHub-Mark.png" height="45px;" /></a>
  <a href="https://aws.amazon.com/jp/"><img src="https://d0.awsstatic.com/logos/powered-by-aws.png" height="45px;" /></a>
</p>
</dl>
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
- has_many :addresses
- has_many :products
- has_one :card


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
|user_id|integer|null: false, foreign_key: true|
|customer_id|string|null: false|
|card_id|string|null: false, foreign_key: true|

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
