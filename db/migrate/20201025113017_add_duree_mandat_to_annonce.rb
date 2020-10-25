class AddDureeMandatToAnnonce < ActiveRecord::Migration[5.2]
  def change
    add_column :annonces, :duree_mandat, :string
  end
end
