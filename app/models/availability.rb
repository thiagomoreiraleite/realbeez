class Availability < ApplicationRecord
  belongs_to :user
  validates :jours, uniqueness: { scope: :user_id,
    message: " déja enregistré" }
end
