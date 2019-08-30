class Candidature < ApplicationRecord
  belongs_to :annonce
  belongs_to :user
  validates :dispo_jours, presence: true
end
