class AddLocataireIdToLocataireCandidature < ActiveRecord::Migration[5.2]
  def change
    add_column :locataire_candidatures, :locataire_id, :integer
  end
end
