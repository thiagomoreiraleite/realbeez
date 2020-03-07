class AddResumeToLocataire < ActiveRecord::Migration[5.2]
  def change
    add_column :locataires, :activite, :string
    add_column :locataires, :activite_autre, :string
    add_column :locataires, :type_contrat, :string
    add_column :locataires, :revenus, :string
    add_column :locataires, :activite_garant, :string
    add_column :locataires, :activite_autre_garant, :string
    add_column :locataires, :type_contrat_garant, :string
    add_column :locataires, :revenus_garant, :string
    add_column :locataire_supplementaires, :activite, :string
    add_column :locataire_supplementaires, :activite_autre, :string
    add_column :locataire_supplementaires, :type_contrat, :string
    add_column :locataire_supplementaires, :revenus, :string
  end
end
