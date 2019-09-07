class Credit < ApplicationRecord
  validates :token, presence: true
  belongs_to :user
end
