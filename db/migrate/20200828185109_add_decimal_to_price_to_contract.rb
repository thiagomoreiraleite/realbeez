class AddDecimalToPriceToContract < ActiveRecord::Migration[5.2]
  def change
    change_column :contrats, :honoraire_locataire, :decimal, :precision => 10, :scale => 2
    change_column :contrats, :honoraire_bailleur, :decimal, :precision => 10, :scale => 2
  end
end
