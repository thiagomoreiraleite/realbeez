class CreateLocataireCandidatures < ActiveRecord::Migration[5.2]
  def change
    create_table :locataire_candidatures do |t|
      t.string :agent, default: "Non"
      t.text :message
      t.string :statut
      t.string :statut_proprietaire
      t.string :locataire_email
      t.references :user, foreign_key: true
      t.references :annonce, foreign_key: true

      t.timestamps
    end
  end
end
