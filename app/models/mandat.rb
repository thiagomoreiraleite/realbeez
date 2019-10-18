class Mandat < ApplicationRecord
  belongs_to :candidature
  belongs_to :user
end
