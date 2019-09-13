class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_many :pictures, dependent: :destroy
  belongs_to :shipping, optional: true 
  belongs_to :user
  belongs_to :category
  validates :name, :price,:condition_id, :category_id,:shipping_from, :shipping_day_id, :status_id, presence: true
  belongs_to_active_hash :size
  belongs_to_active_hash :condition
  belongs_to_active_hash :cost_burden
  belongs_to_active_hash :shipping_day
  
  belongs_to_active_hash :status
  # has_many :orders, dependent: :destroy
  # has_many :likes, dependent: :destroy
  
end
