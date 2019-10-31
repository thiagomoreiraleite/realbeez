class AddChargesToAnnonces < ActiveRecord::Migration[5.2]
  def change
    add_column :annonces, :charges, :integer
  end
end
