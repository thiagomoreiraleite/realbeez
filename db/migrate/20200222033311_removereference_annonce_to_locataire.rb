class RemovereferenceAnnonceToLocataire < ActiveRecord::Migration[5.2]
  def change
    remove_reference(:locataires, :annonce, index: true)
  end
end
