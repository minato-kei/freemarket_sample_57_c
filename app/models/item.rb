class Item < ApplicationRecord
  has_many :pictures, dependent: :destroy
  belongs_to :shipping, optional: true 
  belongs_to :user
  belongs_to :category
  # has_many :orders, dependent: :destroy
  # has_many :likes, dependent: :destroy
end
