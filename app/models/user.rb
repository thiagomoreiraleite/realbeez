class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :annonces, dependent: :destroy
  has_many :candidatures, dependent: :destroy
  has_many :meetings, dependent: :destroy
  has_many :availabilities, dependent: :destroy
  has_one :agent, dependent: :destroy
  mount_uploader :photo, PhotoUploader
  validates :prénom, :nom, presence: true
  has_friendship
end


