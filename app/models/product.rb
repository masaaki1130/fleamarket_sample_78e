class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :brand
  belongs_to_active_hash :status
  belongs_to_active_hash :day
  has_many :purchases
  has_many :images
  accepts_nested_attributes_for :images, allow_destroy: true
  belongs_to :user
  belongs_to :category

  validates :name, presence: true
  validates :images, presence: true
  validates :text, presence: true
  validates :category_id, presence: true
  validates :status_id, presence: true
  validates :price, presence: true
  validates :postage, presence: true
  validates :area, presence: true
  validates :day_id, presence: true
  validates :user_id, presence: true

end
