class RemoveColumnLocataires < ActiveRecord::Migration[5.2]
  def change
    remove_column :locataires, :nom2
    remove_column :locataires, :prenom2
    remove_column :locataires, :adresse2
    remove_column :locataires, :ville2
    remove_column :locataires, :tel2
    remove_column :locataires, :email2
    remove_column :locataires, :id_recto2
    remove_column :locataires, :id_verso2
    remove_column :locataires, :justif_dom2
    remove_column :locataires, :fiche_paye_mois1_2
    remove_column :locataires, :fiche_paye_mois2_2
    remove_column :locataires, :fiche_paye_mois3_2
    remove_column :locataires, :contrat2
    remove_column :locataires, :nom3
    remove_column :locataires, :prenom3
    remove_column :locataires, :adresse3
    remove_column :locataires, :ville3
    remove_column :locataires, :tel3
    remove_column :locataires, :email3
    remove_column :locataires, :id_recto3
    remove_column :locataires, :id_verso3
    remove_column :locataires, :justif_dom3
    remove_column :locataires, :fiche_paye_mois1_3
    remove_column :locataires, :fiche_paye_mois2_3
    remove_column :locataires, :fiche_paye_mois3_3
    remove_column :locataires, :contrat3
    rename_column :locataires, :nom1, :nom
    rename_column :locataires, :prenom1, :prenom
    rename_column :locataires, :adresse1, :adresse
    rename_column :locataires, :ville1, :ville
    rename_column :locataires, :tel1, :tel
    rename_column :locataires, :email1, :email
    rename_column :locataires, :id_recto1, :id_recto
    rename_column :locataires, :id_verso1, :id_verso
    rename_column :locataires, :justif_dom1, :justif_dom
    rename_column :locataires, :fiche_paye_mois1_1, :fiche_paye_mois1
    rename_column :locataires, :fiche_paye_mois2_1, :fiche_paye_mois2
    rename_column :locataires, :fiche_paye_mois3_1, :fiche_paye_mois3
    rename_column :locataires, :contrat1, :contrat
  end
end
