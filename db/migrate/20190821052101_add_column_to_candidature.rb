class AddColumnToCandidature < ActiveRecord::Migration[5.2]
  def change
    add_column :candidatures, :commentaire, :text
  end
end
