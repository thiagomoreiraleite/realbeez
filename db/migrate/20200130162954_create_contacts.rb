class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.string :nom
      t.string :prenom
      t.string :telephone
      t.string :email
      t.string :ville
      t.boolean :actualite

      t.timestamps
    end
  end
end
