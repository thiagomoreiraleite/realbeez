class AddDetailsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :civilité, :string
    add_column :users, :nom, :string
    add_column :users, :prénom, :string
    add_column :users, :pseudo, :string
    add_column :users, :adresse, :string
    add_column :users, :ville, :string
    add_column :users, :dispo_jours, :string
    add_column :users, :dispo_heures, :string
    add_column :users, :téléphone, :string
    add_column :users, :photo, :string, default: "image/upload/v1565065662/profile_default_kttdt0.jpg"
  end
end
