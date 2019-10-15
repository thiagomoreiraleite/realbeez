class ChangeDefaultPhotoToAnnonces < ActiveRecord::Migration[5.2]
  def change
    change_column_default(:annonces, :photo, "image/upload/v1571117407/vkvocjjohixcui17sivw.png")
    change_column_default(:annonces, :photo1, "image/upload/v1571117407/vkvocjjohixcui17sivw.png")
    change_column_default(:annonces, :photo2, "image/upload/v1571117407/vkvocjjohixcui17sivw.png")
    change_column_default(:annonces, :photo3, "image/upload/v1571117407/vkvocjjohixcui17sivw.png")
    change_column_default(:annonces, :photo4, "image/upload/v1571117407/vkvocjjohixcui17sivw.png")
  end
end
