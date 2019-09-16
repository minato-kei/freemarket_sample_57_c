class Picture < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :item
  validates :image, :item_id, presence: true
end
