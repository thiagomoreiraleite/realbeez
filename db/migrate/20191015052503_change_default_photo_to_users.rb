class ChangeDefaultPhotoToUsers < ActiveRecord::Migration[5.2]
  def change
    # change_column :users, :photo, default: "image/upload/v1571116830/b8aajqve5rgod5m4zgyg.png"
    change_column_default(:users, :photo, "image/upload/v1571116830/b8aajqve5rgod5m4zgyg.png")
  end
end
