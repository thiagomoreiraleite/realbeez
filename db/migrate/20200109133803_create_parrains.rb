class CreateParrains < ActiveRecord::Migration[5.2]
  def change
    create_table :parrains do |t|
      t.string :prenom
      t.string :nom
      t.string :email
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
