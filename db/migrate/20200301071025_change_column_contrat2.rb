class ChangeColumnContrat2 < ActiveRecord::Migration[5.2]
  def change
    add_column :contrats, :garant, :string
    add_column :contrats, :societe_civile, :string
    change_column :contrats, :reference_irl, :string
    change_column :contrats, :duree_contrat, :string
    change_column :contrats, :autre_partie_logement, :text, array: true, default: [], using: "(string_to_array(autre_partie_logement, ','))"
    change_column :contrats, :partie_commune, :text, array: true, default: [], using: "(string_to_array(partie_commune, ','))"
    change_column :contrats, :montant_loyer_reference, :string
    change_column :contrats, :provision_charges, :string
    change_column :contrats, :montant_annuel_assurance, :string
    change_column :contrats, :montant_mensuel_assurance, :string
    change_column :contrats, :contribution_partage_economie_charges, :string
    change_column :contrats, :colocation_assurance_recuperable, :string
    change_column :contrats, :hausse_baisse_loyer, :string
    change_column :contrats, :signature_bailleur, :boolean, using: "(signature_bailleur::boolean)"
    change_column :contrats, :signature_locataire, :boolean, using: "(signature_locataire::boolean)"
  end
end
