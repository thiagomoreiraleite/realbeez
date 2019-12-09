class ChangeDefaultPictures < ActiveRecord::Migration[5.2]
  def change
    change_column_default(:users, :photo, "image/upload/v1575902902/default_profile.png")
    change_column_default(:annonces, :photo, "image/upload/v1575902902/default_annonce.png")
    change_column_default(:annonces, :photo1, "image/upload/v1575902902/default_annonce.png")
    change_column_default(:annonces, :photo2, "image/upload/v1575902902/default_annonce.png")
    change_column_default(:annonces, :photo3, "image/upload/v1575902902/default_annonce.png")
    change_column_default(:annonces, :photo4, "image/upload/v1575902902/default_annonce.png")
    change_column_default(:agents, :justif_entrepreneur, "image/upload/v1575902902/default_annonce.png")
  end
end
