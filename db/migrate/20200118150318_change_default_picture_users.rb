class ChangeDefaultPictureUsers < ActiveRecord::Migration[5.2]
  def change
    change_column_default(:users, :photo, "image/upload/v1579358933/default_profile.png")
  end
end
