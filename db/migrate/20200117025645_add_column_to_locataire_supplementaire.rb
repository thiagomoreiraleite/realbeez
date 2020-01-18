class AddColumnToLocataireSupplementaire < ActiveRecord::Migration[5.2]
  def change
    add_column :locataire_supplementaires, :adresse, :string
    add_column :locataire_supplementaires, :ville, :string
    add_column :locataire_supplementaires, :tel, :string
    add_column :locataire_supplementaires, :email, :string
    add_column :locataire_supplementaires, :id_recto, :string, default: "image/upload/v1575902902/default_annonce.png"
    add_column :locataire_supplementaires, :id_verso, :string, default: "image/upload/v1575902902/default_annonce.png"
    add_column :locataire_supplementaires, :justif_dom, :string, default: "image/upload/v1575902902/default_annonce.png"
    add_column :locataire_supplementaires, :fiche_paye_mois1, :string, default: "image/upload/v1575902902/default_annonce.png"
    add_column :locataire_supplementaires, :fiche_paye_mois2, :string, default: "image/upload/v1575902902/default_annonce.png"
    add_column :locataire_supplementaires, :fiche_paye_mois3, :string, default: "image/upload/v1575902902/default_annonce.png"
    add_column :locataire_supplementaires, :contrat, :string, default: "image/upload/v1575902902/default_annonce.png"
  end
end
