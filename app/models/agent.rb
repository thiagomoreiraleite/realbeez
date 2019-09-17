class Agent < ApplicationRecord
  belongs_to :user
  mount_uploader :cv, PhotoUploader
  validates :user, uniqueness: true
  validates :cv, presence: true
end
