class Annonce < ApplicationRecord
  belongs_to :user
  has_one :photo, dependent: :destroy
  has_many :candidatures
  has_many :meetings
  validates :titre_annonce, :surface, :description, :loyer_mensuel, :ville, :email, :téléphone, presence: true
  mount_uploader :photo, PhotoUploader
end
