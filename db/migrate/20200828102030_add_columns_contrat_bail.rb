class AddColumnsContratBail < ActiveRecord::Migration[5.2]
  def change
    add_column :contrats, :contrat_type, :text
    add_column :contrats, :date_naissance_bailleur, :string
    add_column :contrats, :lieu_naissance_bailleur, :string
    add_column :contrats, :clause_solidarite, :text
    add_column :contrats, :clause_resolutoire, :text
    add_column :contrats, :caution_solidaire, :text
    add_column :contrats, :autre_info, :text
    add_column :contrats, :civilite_locataire, :string
    add_column :contrats, :date_naissance_locataire, :string
    add_column :contrats, :lieu_naissance_locataire, :string
    add_column :contrats, :consistance_logement, :text
    add_column :contrats, :garantie_duree, :text
    add_column :contrats, :plafond_applicable, :text
  end
end
