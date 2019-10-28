class RemoveUnusedColumn < ActiveRecord::Migration[5.2]
  def change
    remove_column :agents, :connaissance
    remove_column :agents, :cv
    remove_column :candidatures, :durée
    remove_column :candidatures, :dispo_heures
    remove_column :candidatures, :dispo_jours
    remove_column :users, :dispo_jours
    remove_column :users, :dispo_heures
  end
end
