class AddRatingDefaultToReview < ActiveRecord::Migration[5.2]
  def change
    change_column_default(:reviews, :rating, 1)
  end
end
