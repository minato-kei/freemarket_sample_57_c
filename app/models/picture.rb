class Picture < ApplicationRecord
  mount_uploader :image, imageUploader
end
