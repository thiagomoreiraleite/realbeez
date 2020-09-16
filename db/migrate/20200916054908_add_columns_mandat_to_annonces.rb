class AddColumnsMandatToAnnonces < ActiveRecord::Migration[5.2]
  def change
    add_column :annonces, :telephone_proprio, :string
    add_column :annonces, :mandat_exclusif, :boolean, default: false
  end
end
