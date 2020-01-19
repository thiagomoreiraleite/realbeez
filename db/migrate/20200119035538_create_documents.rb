class CreateDocuments < ActiveRecord::Migration[5.2]
  def change
    create_table :documents do |t|
      t.string :titre
      t.string :piece_jointe, default: "image/upload/v1575902902/default_annonce.png"
      t.references :locataire, foreign_key: true

      t.timestamps
    end
  end
end
