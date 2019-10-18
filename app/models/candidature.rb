class Candidature < ApplicationRecord
  belongs_to :annonce
  belongs_to :user
  has_one :mandat, dependent: :destroy

  # validates :annonce_id, uniqueness: { scope: :user_id,
  # message: " déja postulé" }
end
