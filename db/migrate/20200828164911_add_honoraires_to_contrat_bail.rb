class AddHonorairesToContratBail < ActiveRecord::Migration[5.2]
  def change
    add_column :contrats, :honoraire_bailleur, :integer
    add_column :contrats, :honoraire_bailleur_detail, :text
    add_column :contrats, :honoraire_locataire, :integer
    add_column :contrats, :honoraire_locataire_detail, :text
  end
end
