class RemoveDefaultValuePiece < ActiveRecord::Migration[5.2]
  def change
    change_column_default(:annonces, :pièces, nil)
  end
end
