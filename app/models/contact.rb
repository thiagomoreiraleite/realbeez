class Contact < ApplicationRecord
  validates :prenom, :nom, :ville, :telephone, :email, presence: true
end
