class Picture < ApplicationRecord
  belongs_to :annonce
  mount_uploader :photo, PhotoUploader
end
