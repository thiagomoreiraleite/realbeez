class AddAgentToAnnonce < ActiveRecord::Migration[5.2]
  def change
    add_column :annonces, :agent, :string
  end
end
