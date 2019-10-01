class AddMorePhotoToAnnonce < ActiveRecord::Migration[5.2]
  def change
    add_column :annonces, :photo2, :string, default: "image/upload/v1565065662/profile_default_kttdt0.jpg"
    add_column :annonces, :photo3, :string, default: "image/upload/v1565065662/profile_default_kttdt0.jpg"
    add_column :annonces, :photo4, :string, default: "image/upload/v1565065662/profile_default_kttdt0.jpg"
  end
end
