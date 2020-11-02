class AddColumnToblog < ActiveRecord::Migration[5.2]
  def change
    add_column :blogs, :statut, :string
    add_column :blogs, :disclaimer, :text
  end
end
