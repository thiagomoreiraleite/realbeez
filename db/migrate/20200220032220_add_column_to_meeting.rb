class AddColumnToMeeting < ActiveRecord::Migration[5.2]
  def change
    add_column :meetings, :prenom_prospect, :string
    add_column :meetings, :nom_prospect, :string
    add_column :meetings, :telephone, :string
    add_column :meetings, :email, :string
  end
end
