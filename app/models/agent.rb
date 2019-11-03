class Agent < ApplicationRecord
  belongs_to :user
  mount_uploader :cv, PhotoUploader
  validates :user, uniqueness: true
  has_many :reviews, dependent: :destroy
end
