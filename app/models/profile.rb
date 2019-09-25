class Profile < User
  # include PgSearch::Model
  # pg_search_scope :search_profile,
  #   against: [ :ville, :adresse, :nom, :prénom ],
  #   using: {
  #     tsearch: { prefix: true }
  #   }
end
