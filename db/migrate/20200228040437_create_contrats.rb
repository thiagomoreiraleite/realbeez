class CreateContrats < ActiveRecord::Migration[5.2]
  def change
    create_table :contrats do |t|
      t.references :locataire_candidature
      t.references :user
      t.string :qualite_bailleur
      t.string :nom_bailleur
      t.string :denomination_bailleur
      t.string :adresse_bailleur
      t.string :email_bailleur
      t.boolean :mandataire
      t.string :nom_mandataire
      t.string :denomination_mandataire
      t.string :adresse_mandataire
      t.string :activite_mandataire
      t.string :carte_pro
      t.string :nom_locataire
      t.string :adresse_logement
      t.string :type_habitat_immeuble
      t.string :type_habitat
      t.string :periode_construction
      t.integer :surface
      t.integer :nb_piece
      t.string :autre_partie_logement
      t.string :equipement
      t.string :chauffage
      t.string :eau_chaude
      t.string :destination_locaux
      t.boolean :cave
      t.string :cave_detail
      t.boolean :parking
      t.string :parking_detail
      t.boolean :garage
      t.string :garage_detail
      t.boolean :autre_partie_privative
      t.string :autre_partie_privative_detail
      t.string :partie_commune
      t.string :autre_partie_commune
      t.string :equipement_technologique
      t.string :date_prise_effet
      t.integer :duree_contrat
      t.string :nb_duree_reduite
      t.string :justif_duree_reduite
      t.integer :loyer_mensuel
      t.boolean :decret_evolution_loyerl
      t.boolean :loyer_reference
      t.integer :montant_loyer_reference
      t.integer :montant_loyer_majore
      t.string :justif_complement_loyer
      t.string :loyer_dernier_locataire
      t.string :date_revision_loyer
      t.integer :reference_irl
      t.string :modalite_paiement_charges
      t.integer :provision_charges
      t.string :modalite_revision_forfait
      t.string :contribution_economie_charge
      t.string :justif_contribution_travaux
      t.boolean :colocation_assurance
      t.integer :montant_annuel_assurance
      t.integer :montant_mensuel_assurance
      t.string :perdiodicite_paiement
      t.string :paiement_echoir_echu
      t.string :date_periode_paiement
      t.string :lieu_paiement
      t.integer :loyer_hors_charges
      t.integer :charge_recuperable
      t.integer :contribution_partage_economie_charges
      t.integer :colocation_assurance_recuperable
      t.integer :hausse_baisse_loyer
      t.string :modalite_hausse_annuelle
      t.string :travaux_amelioration
      t.string :travaux_majoration_loyer
      t.string :travaux_diminution_loyer
      t.integer :depot_garantie
      t.integer :honoraires_visite_bail
      t.integer :honoraires_etat_lieux
      t.string :honoraires_autres
      t.text :autre_condition
      t.string :date_signature
      t.string :lieu_signature
      t.string :signature_bailleur
      t.string :signature_locataire

      t.timestamps
    end
  end
end
