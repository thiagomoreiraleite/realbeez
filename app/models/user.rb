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
  geocoded_by :adresse
  after_validation :geocode, if: :will_save_change_to_adresse?
  has_many :orders, dependent: :destroy
  has_many :mandats, dependent: :destroy
  has_many :notifications, foreign_key: :recipient_id
  has_many :reviews
end
