class CreatePhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :photos do |t|
      t.string :photo1, default: "image/upload/v1565065662/profile_default_kttdt0.jpg"
      t.string :photo2, default: "image/upload/v1565065662/profile_default_kttdt0.jpg"
      t.string :photo3, default: "image/upload/v1565065662/profile_default_kttdt0.jpg"
      t.string :photo4, default: "image/upload/v1565065662/profile_default_kttdt0.jpg"
      t.string :photo4, default: "image/upload/v1565065662/profile_default_kttdt0.jpg"
      t.string :photo5, default: "image/upload/v1565065662/profile_default_kttdt0.jpg"
      t.references :annonce, foreign_key: true

      t.timestamps
    end
  end
end
