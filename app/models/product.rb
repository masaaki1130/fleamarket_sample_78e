class Product < ApplicationRecord

  belongs_to user, foregin_key: 'user_id'
  belongs_to :category
  belongs_to :brand_id

  validates :name, presence: true
  validates :image, presence: true
  validates :text, presence: true
  validates :category, presence: true
  validates :status, presence: true
  validates :charges, presence: true
  validates :price, presence: true
  validates :postage, presence: true
  validates :area, presence: true
  validates :day, presence: true
  validates :user_id, presence: true

end
