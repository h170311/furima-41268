class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :delivery_time
  belongs_to :item_status
  belongs_to :prefecture
  belongs_to :shipping_cost
  has_one_attached :image

  validates :image,            presence: true
  validates :item_name,        presence: true
  validates :item_description, presence: true
  validates :category_id,      numericality: { other_than: 1, message: "can't be blank" }
  validates :item_status_id,   numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_cost_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :prefecture_id,    numericality: { other_than: 0, message: "can't be blank" }
  validates :delivery_time_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :price, presence: true,
                    numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'を正確に入力してください' }

  # has_one    :buy
  belongs_to :user
  has_one_attached :image
end
