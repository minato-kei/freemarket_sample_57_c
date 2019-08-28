class Category < ApplicationRecord
  has_ancestry
  # has_many :brands ,through :brands_categories
end
