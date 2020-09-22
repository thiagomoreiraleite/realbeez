class AddColumnDepotGarantietoAnnonce < ActiveRecord::Migration[5.2]
  def change
    add_column :annonces, :depot_garantie, :integer
  end
end
