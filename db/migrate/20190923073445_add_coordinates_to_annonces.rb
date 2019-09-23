class AddCoordinatesToAnnonces < ActiveRecord::Migration[5.2]
  def change
    add_column :annonces, :latitude, :float
    add_column :annonces, :longitude, :float
  end
end
