class LocataireSupplementaire < ApplicationRecord
  belongs_to :locataire, inverse_of: :locataire_supplementaires

  mount_uploader :id_recto, PhotoUploader
  mount_uploader :id_verso, PhotoUploader
  mount_uploader :justif_dom, PhotoUploader
  mount_uploader :fiche_paye_mois1, PhotoUploader
  mount_uploader :fiche_paye_mois2, PhotoUploader
  mount_uploader :fiche_paye_mois3, PhotoUploader
  mount_uploader :contrat, PhotoUploader

end
