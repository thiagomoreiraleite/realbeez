class CreateAgents < ActiveRecord::Migration[5.2]
  def change
    create_table :agents do |t|
      t.string :cv
      t.date :date_de_naissance
      t.string :auto_entrepreneur
      t.text :experience
      t.string :statut
      t.string :connaissance

      t.timestamps
    end
  end
end
