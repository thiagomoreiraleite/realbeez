class AddColumntToAgent < ActiveRecord::Migration[5.2]
  def change
    add_reference :agents, :user, index: true
  end
end
