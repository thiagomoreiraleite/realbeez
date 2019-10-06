class ChangeColumnAnnonce < ActiveRecord::Migration[5.2]
  def change
    rename_column :annonces, :agent, :agent_user_id
  end
end
