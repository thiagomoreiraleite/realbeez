class AddDetailToMeeting < ActiveRecord::Migration[5.2]
  def change
    add_reference :meetings, :user, index: true
    add_reference :meetings, :annonce, index: true
  end
end
