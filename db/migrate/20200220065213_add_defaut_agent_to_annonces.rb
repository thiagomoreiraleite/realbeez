class AddDefautAgentToAnnonces < ActiveRecord::Migration[5.2]
  def change
    change_column_default(:annonces, :agent, "Non")
  end
end
