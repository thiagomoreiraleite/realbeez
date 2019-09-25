class AddStatutToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :statut, :string
  end
end
