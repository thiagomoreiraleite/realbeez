class AddStatutToContrat < ActiveRecord::Migration[5.2]
  def change
    add_column :contrats, :statut_contrat, :boolean, default: false
  end
end
