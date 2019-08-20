class AddColumnToAnnonce < ActiveRecord::Migration[5.2]
  def change
     add_column :annonces, :statut, :string
  end
end
