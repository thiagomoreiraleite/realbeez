class Blog < ApplicationRecord
  belongs_to :user
  mount_uploader :photo, PhotoUploader
  mount_uploader :photo_1, PhotoUploader
  mount_uploader :photo_2, PhotoUploader
  mount_uploader :photo_3, PhotoUploader
  mount_uploader :photo_4, PhotoUploader
  mount_uploader :photo_5, PhotoUploader
  mount_uploader :photo_6, PhotoUploader
  mount_uploader :photo_7, PhotoUploader
end
