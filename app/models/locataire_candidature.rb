class LocataireCandidature < ApplicationRecord
  belongs_to :user
  belongs_to :annonce
  has_one :contrat, dependent: :destroy

  validates :locataire_email, presence: true
end
