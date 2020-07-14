class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :brand
  belongs_to_active_hash :status
  belongs_to_active_hash :day
  belongs_to_active_hash :shipping_cost
  has_many :purchases
  has_many :images, inverse_of: :product,dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true
  belongs_to :user
  belongs_to :category

  validates :name, presence: true
  validates :images, presence: true
  validates :text, presence: true
  validates :category_id, presence: true
  validates :status_id, presence: true
  validates :price, presence: true
  validates :shipping_cost_id, presence: true
  validates :prefecture_id, presence: true
  validates :day_id, presence: true
  validates :user_id, presence: true

end
