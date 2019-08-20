class CreateCandidatures < ActiveRecord::Migration[5.2]
  def change
    create_table :candidatures do |t|
      t.integer :durée
      t.string :dispo_jours
      t.string :dispo_heures
      t.string :statut
      t.references :annonce, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
