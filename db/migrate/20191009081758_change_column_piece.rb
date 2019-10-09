class ChangeColumnPiece < ActiveRecord::Migration[5.2]
  def change
    remove_column :annonces, :pièces
    add_column :annonces, :pièces, :integer, default: 0
  end
end
