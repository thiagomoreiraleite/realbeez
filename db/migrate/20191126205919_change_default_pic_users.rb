class ChangeDefaultPicUsers < ActiveRecord::Migration[5.2]
  def change
    change_column_default(:users, :photo, "image/upload/v1574801859/ztld1jfbvwxzxzea88fp.png")
  end
end
