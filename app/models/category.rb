class Category < ApplicationRecord
  has_ancestry
  has_many :items
  # has_many :brands ,through :brands_categories
  validates :name, presence: true
end
