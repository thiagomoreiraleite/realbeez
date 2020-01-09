class AddParrainToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :parrain, :string
  end
end
