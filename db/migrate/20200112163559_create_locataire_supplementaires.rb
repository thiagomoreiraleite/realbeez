class CreateLocataireSupplementaires < ActiveRecord::Migration[5.2]
  def change
    create_table :locataire_supplementaires do |t|
      t.string :nom
      t.string :prenom
      t.references :locataire, foreign_key: true

      t.timestamps
    end
  end
end
