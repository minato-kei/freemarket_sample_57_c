class Credit < ApplicationRecord
  validates :token, :user_id,presence: true
  belongs_to :user
end
