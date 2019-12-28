class CreateLocataires < ActiveRecord::Migration[5.2]
  def change
    create_table :locataires do |t|
      t.string :nom1
      t.string :prenom1
      t.string :adresse1
      t.string :ville1
      t.string :tel1
      t.string :email1
      t.string :id_recto1, default: "image/upload/v1575902902/default_annonce.png"
      t.string :id_verso1, default: "image/upload/v1575902902/default_annonce.png"
      t.string :justif_dom1, default: "image/upload/v1575902902/default_annonce.png"
      t.string :fiche_paye_mois1_1, default: "image/upload/v1575902902/default_annonce.png"
      t.string :fiche_paye_mois2_1, default: "image/upload/v1575902902/default_annonce.png"
      t.string :fiche_paye_mois3_1, default: "image/upload/v1575902902/default_annonce.png"
      t.string :contrat1, default: "image/upload/v1575902902/default_annonce.png"
      t.string :nom2
      t.string :prenom2
      t.string :adresse2
      t.string :ville2
      t.string :tel2
      t.string :email2
      t.string :id_recto2, default: "image/upload/v1575902902/default_annonce.png"
      t.string :id_verso2, default: "image/upload/v1575902902/default_annonce.png"
      t.string :justif_dom2, default: "image/upload/v1575902902/default_annonce.png"
      t.string :fiche_paye_mois1_2, default: "image/upload/v1575902902/default_annonce.png"
      t.string :fiche_paye_mois2_2, default: "image/upload/v1575902902/default_annonce.png"
      t.string :fiche_paye_mois3_2, default: "image/upload/v1575902902/default_annonce.png"
      t.string :contrat2, default: "image/upload/v1575902902/default_annonce.png"
      t.string :nom3
      t.string :prenom3
      t.string :adresse3
      t.string :ville3
      t.string :tel3
      t.string :email3
      t.string :id_recto3, default: "image/upload/v1575902902/default_annonce.png"
      t.string :id_verso3, default: "image/upload/v1575902902/default_annonce.png"
      t.string :justif_dom3, default: "image/upload/v1575902902/default_annonce.png"
      t.string :fiche_paye_mois1_3, default: "image/upload/v1575902902/default_annonce.png"
      t.string :fiche_paye_mois2_3, default: "image/upload/v1575902902/default_annonce.png"
      t.string :fiche_paye_mois3_3, default: "image/upload/v1575902902/default_annonce.png"
      t.string :contrat3, default: "image/upload/v1575902902/default_annonce.png"
      t.string :nom_garant
      t.string :prenom_garant
      t.string :adresse_garant
      t.string :ville_garant
      t.string :tel_garant
      t.string :email_garant
      t.string :id_recto_garant, default: "image/upload/v1575902902/default_annonce.png"
      t.string :id_verso_garant, default: "image/upload/v1575902902/default_annonce.png"
      t.string :justif_dom_garant, default: "image/upload/v1575902902/default_annonce.png"
      t.string :fiche_paye_mois1_garant, default: "image/upload/v1575902902/default_annonce.png"
      t.string :fiche_paye_mois2_garant, default: "image/upload/v1575902902/default_annonce.png"
      t.string :fiche_paye_mois3_garant, default: "image/upload/v1575902902/default_annonce.png"
      t.string :contrat_garant, default: "image/upload/v1575902902/default_annonce.png"
      t.text   :message
      t.string :statut_agent
      t.string :statut_proprietaire

      t.references :annonce, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
