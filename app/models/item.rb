class Item < ApplicationRecord
  has_many :pictures, dependent: :destroy
  belongs_to :shipping, optional: true 
  belongs_to :user
  belongs_to :category
  validates :name, :price,:condition,:shipping_from, :shipping_day, :status, presence: true
  # has_many :orders, dependent: :destroy
  # has_many :likes, dependent: :destroy
end
