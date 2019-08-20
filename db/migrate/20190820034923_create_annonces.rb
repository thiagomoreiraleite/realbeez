class CreateAnnonces < ActiveRecord::Migration[5.2]
  def change
    create_table :annonces do |t|
      t.string :titre_annonce
      t.string :type_de_bien
      t.string :meublé
      t.integer :surface
      t.string :pièces
      t.string :classe_énergie
      t.string :ges
      t.text :description
      t.integer :loyer_mensuel
      t.string :adresse
      t.string :ville
      t.string :email
      t.string :téléphone
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
