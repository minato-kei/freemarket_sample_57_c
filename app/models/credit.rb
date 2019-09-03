class Credit < ApplicationRecord
  validates :token, presence: true
end
