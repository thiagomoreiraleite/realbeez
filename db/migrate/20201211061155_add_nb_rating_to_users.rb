class AddNbRatingToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :nb_rating, :integer
  end
end
