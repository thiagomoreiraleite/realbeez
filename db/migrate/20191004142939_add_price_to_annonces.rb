class AddPriceToAnnonces < ActiveRecord::Migration[5.2]
  def change
    add_monetize :annonces, :price, currency: { present: false }
  end
end
