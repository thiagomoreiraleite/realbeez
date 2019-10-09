class Annonce < ApplicationRecord
  belongs_to :user
  # has_many :pictures, dependent: :destroy
  has_many :candidatures
  has_many :meetings
  validates :titre_annonce, :surface, :description, :loyer_mensuel, :ville, :email, :téléphone, presence: true
  mount_uploader :photo, PhotoUploader
  mount_uploader :photo1, PhotoUploader
  mount_uploader :photo2, PhotoUploader
  mount_uploader :photo3, PhotoUploader
  mount_uploader :photo4, PhotoUploader
  geocoded_by :adresse
  after_validation :geocode, if: :will_save_change_to_adresse?
  monetize :price_cents
  has_many :orders
  validates :surface, numericality: { greater_than_or_equal_to: 0 }
  validates :pièces, numericality: { greater_than_or_equal_to: 0 }

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

  # include PgSearch::Model
  # pg_search_scope :search_annonce,
  #   against: [ :ville, :adresse, :titre_annonce, :type_de_bien],
  #   using: {
  #     tsearch: { prefix: true }
  # }
end
