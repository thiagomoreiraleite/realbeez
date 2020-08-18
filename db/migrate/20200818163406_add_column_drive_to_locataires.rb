class AddColumnDriveToLocataires < ActiveRecord::Migration[5.2]
  def change
    add_column :locataires, :drive, :string
  end
end
