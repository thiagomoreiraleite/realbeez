class ChangeColumnNameLocataire < ActiveRecord::Migration[5.2]
  def change
    rename_column :locataires, :statut_agent, :statut
  end
end
