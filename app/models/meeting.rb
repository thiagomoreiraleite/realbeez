class Meeting < ApplicationRecord
  belongs_to :annonce
  belongs_to :user
end
