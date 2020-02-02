class AddRemoveColumnToMandat < ActiveRecord::Migration[5.2]
  def change
    add_reference :mandats, :annonce, index: true
    remove_reference :mandats, :candidature, index: true
  end
end
