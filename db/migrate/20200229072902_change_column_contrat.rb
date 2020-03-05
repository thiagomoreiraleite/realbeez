class ChangeColumnContrat < ActiveRecord::Migration[5.2]
  def change
    change_column :contrats, :nom_locataire, :text, array: true, default: [], using: "(string_to_array(nom_locataire, ','))"
    rename_column :contrats, :decret_evolution_loyerl, :decret_evolution_loyer
  end
end
