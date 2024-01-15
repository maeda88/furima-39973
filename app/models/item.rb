class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :image, presence: true
  validates :trade_name, presence: true
  validates :explanation, presence: true
  validates :category_id, presence: true
  validates :condition_id, presence: true
  validates :delivery_charge_id, presence: true
  validates :prefecture_id, presence: true
  validates :delivery_time_id, presence: true
  validates :price, presence: true

end
