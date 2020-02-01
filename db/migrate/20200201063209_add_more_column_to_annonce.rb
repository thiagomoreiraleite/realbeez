class AddMoreColumnToAnnonce < ActiveRecord::Migration[5.2]
  def change
    add_column :annonces, :agent, :string
    add_column :annonces, :nom_proprio, :string
    add_column :annonces, :prenom_proprio, :string
    add_column :annonces, :email_proprio, :string
  end
end
