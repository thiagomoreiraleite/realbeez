class AddAgentToLocataire < ActiveRecord::Migration[5.2]
  def change
    add_column :locataires, :agent, :string
  end
end
