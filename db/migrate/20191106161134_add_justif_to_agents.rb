class AddJustifToAgents < ActiveRecord::Migration[5.2]
  def change
    add_column :agents, :justif_entrepreneur, :string, default: "image/upload/v1571117407/vkvocjjohixcui17sivw.png"
  end
end
