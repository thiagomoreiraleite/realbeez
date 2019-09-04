
class CreateAvailabilities < ActiveRecord::Migration[5.2]
  def change
    create_table :availabilities do |t|
      t.string :jours
      t.text :heures, array: true, default:[]
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
