class Agent < ApplicationRecord
  belongs_to :user
  mount_uploader :justif_entrepreneur, PhotoUploader
  validates :user, uniqueness: true
  has_many :reviews, dependent: :destroy
end
