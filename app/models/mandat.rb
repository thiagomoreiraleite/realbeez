class Mandat < ApplicationRecord
  belongs_to :annonce
  belongs_to :user
end
