class AddcolumnConnaissanceToAgents < ActiveRecord::Migration[5.2]
  def change
    add_column :agents, :connaissance, :string
  end
end
