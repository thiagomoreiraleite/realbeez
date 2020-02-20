class ChangeTypeColumnNameToMeeting < ActiveRecord::Migration[5.2]
  def change
    change_column :meetings, :name, :text
  end
end
