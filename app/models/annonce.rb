class Annonce < ApplicationRecord
  belongs_to :user
  has_one :photo, dependent: :destroy
  has_many :candidatures
  has_many :meetings
  validates :titre_annonce, :surface, :description, :loyer_mensuel, :ville, :email, :téléphone, presence: true
  mount_uploader :photo, PhotoUploader

  # belongs_to :user
  # include PgSearch::Model
  # pg_search_scope :search_annonce,
  #   against: [ :addresse, :ville ],
  #   associated_against: {
  #     user: [ :prénom, :nom ]
  #   },
  #   using: {
  #     tsearch: { prefix: true }
  #   }

  include PgSearch::Model
  pg_search_scope :search_annonce,
    against: [ :ville, :adresse, :titre_annonce, :type_de_bien],
    using: {
      tsearch: { prefix: true }
    }
end
