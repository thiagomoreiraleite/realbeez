class AddDefaultPicToAgents < ActiveRecord::Migration[5.2]
  def change
    change_column :agents, :cv, :string, default: "image/upload/v1565065662/profile_default_kttdt0.jpg"
  end
end
