class AddPhoto1ToAnnonce < ActiveRecord::Migration[5.2]
  def change
    add_column :annonces, :photo1, :string, default: "image/upload/v1565065662/profile_default_kttdt0.jpg"
  end
end
