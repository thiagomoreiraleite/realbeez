class Contrat < ApplicationRecord
  belongs_to :user
  belongs_to :locataire_candidature
  validates :locataire_candidature_id, uniqueness: true
end
