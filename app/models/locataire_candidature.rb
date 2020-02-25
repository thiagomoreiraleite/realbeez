class LocataireCandidature < ApplicationRecord
  belongs_to :user
  belongs_to :annonce

  validates :locataire_email, presence: true
end
