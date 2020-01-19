class Document < ApplicationRecord
  belongs_to :locataire, inverse_of: :documents
  mount_uploader :piece_jointe, PhotoUploader
end
