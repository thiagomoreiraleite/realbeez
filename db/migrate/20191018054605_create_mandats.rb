class CreateMandats < ActiveRecord::Migration[5.2]
  def change
    create_table :mandats do |t|
      t.boolean :acceptation_proprio
      t.boolean :acceptation_agent
      t.string :statut
      t.references :candidature, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
