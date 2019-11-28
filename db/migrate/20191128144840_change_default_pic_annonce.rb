class ChangeDefaultPicAnnonce < ActiveRecord::Migration[5.2]
  def change
    change_column_default(:annonces, :photo, "image/upload/v1574951778/muoulom033dq3xfv6tvj.png")
    change_column_default(:annonces, :photo1, "image/upload/v1574951778/muoulom033dq3xfv6tvj.png")
    change_column_default(:annonces, :photo2, "image/upload/v1574951778/muoulom033dq3xfv6tvj.png")
    change_column_default(:annonces, :photo3, "image/upload/v1574951778/muoulom033dq3xfv6tvj.png")
    change_column_default(:annonces, :photo4, "image/upload/v1574951778/muoulom033dq3xfv6tvj.png")
    change_column_default(:agents, :justif_entrepreneur, "image/upload/v1574951778/muoulom033dq3xfv6tvj.png")
  end
end
