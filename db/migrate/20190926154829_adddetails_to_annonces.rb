class AdddetailsToAnnonces < ActiveRecord::Migration[5.2]
  def change
    add_column :annonces, :checkout_agent, :string
    add_column :annonces, :checkout_proprio, :string
  end
end
