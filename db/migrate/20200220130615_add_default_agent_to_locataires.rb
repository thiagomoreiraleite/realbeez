class AddDefaultAgentToLocataires < ActiveRecord::Migration[5.2]
  def change
    change_column_default(:locataires, :agent, "Non")
  end
end
