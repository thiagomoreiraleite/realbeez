class CreateBlogs < ActiveRecord::Migration[5.2]
  def change
    create_table :blogs do |t|
      t.string :photo, default: "image/upload/v1582613499/default_annonce.png"
      t.string :titre
      t.date :date
      t.text :intro
      t.string :titre_1
      t.text :intro_1
      t.string :photo_1, default: "image/upload/v1582613499/default_annonce.png"
      t.text :texte_1
      t.string :titre_2
      t.text :intro_2
      t.string :photo_2, default: "image/upload/v1582613499/default_annonce.png"
      t.text :texte_2
      t.string :titre_3
      t.text :intro_3
      t.string :photo_3, default: "image/upload/v1582613499/default_annonce.png"
      t.text :texte_3
      t.string :titre_4
      t.text :intro_4
      t.string :photo_4, default: "image/upload/v1582613499/default_annonce.png"
      t.text :texte_4
      t.string :titre_5
      t.text :intro_5
      t.string :photo_5, default: "image/upload/v1582613499/default_annonce.png"
      t.text :texte_5
      t.string :titre_6
      t.text :intro_6
      t.string :photo_6, default: "image/upload/v1582613499/default_annonce.png"
      t.text :texte_6
      t.string :titre_7
      t.text :intro_7
      t.string :photo_7, default: "image/upload/v1582613499/default_annonce.png"
      t.text :texte_7
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
