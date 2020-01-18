class Locataire < ApplicationRecord
  belongs_to :annonce
  belongs_to :user
  has_many :locataire_supplementaires, inverse_of: :locataire, autosave: true
  accepts_nested_attributes_for :locataire_supplementaires, allow_destroy: true

  mount_uploader :id_recto, PhotoUploader
  mount_uploader :id_verso, PhotoUploader
  mount_uploader :justif_dom, PhotoUploader
  mount_uploader :fiche_paye_mois1, PhotoUploader
  mount_uploader :fiche_paye_mois2, PhotoUploader
  mount_uploader :fiche_paye_mois3, PhotoUploader
  mount_uploader :contrat, PhotoUploader

  mount_uploader :id_recto_garant, PhotoUploader
  mount_uploader :id_verso_garant, PhotoUploader
  mount_uploader :justif_dom_garant, PhotoUploader
  mount_uploader :fiche_paye_mois1_garant, PhotoUploader
  mount_uploader :fiche_paye_mois2_garant, PhotoUploader
  mount_uploader :fiche_paye_mois3_garant, PhotoUploader
  mount_uploader :contrat_garant, PhotoUploader

  validates :agent, :prenom, :nom, :adresse, :ville, :tel, :email, presence: true
end
