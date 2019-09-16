class Shipping < ApplicationRecord
  belongs_to :user
  has_many :items
  validates :zipcode, :pref, :city, :address, :user_id, :default, presence: true
end
