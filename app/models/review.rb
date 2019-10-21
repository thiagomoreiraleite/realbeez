class Review < ApplicationRecord
  belongs_to :agent
  belongs_to :user
  validates :rating, presence: true
  validates :user_id, uniqueness: { scope: :agent_id, message: "test" }
end

# message: "Vous avez déjà publié un commentaire"
