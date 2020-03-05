class ChangeColumnContrat3 < ActiveRecord::Migration[5.2]
  def change
    add_column :contrats, :autre_autre_partie_logement, :string
    change_column :contrats, :montant_loyer_majore, :string
    change_column :contrats, :justif_complement_loyer, :text
    change_column :contrats, :loyer_dernier_locataire, :text
    change_column :contrats, :travaux_amelioration, :text
    change_column :contrats, :travaux_majoration_loyer, :text
    change_column :contrats, :travaux_diminution_loyer, :text
  end
end
