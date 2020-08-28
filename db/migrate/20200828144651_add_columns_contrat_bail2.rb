class AddColumnsContratBail2 < ActiveRecord::Migration[5.2]
  def change
    add_column :contrats, :domicile_locataire, :text
    change_column :contrats, :justif_duree_reduite , :text
  end
end
