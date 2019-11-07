class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :details_tarifs]

  def home
    if user_signed_in? && current_user.ville != nil
      ville = current_user.ville
      if Annonce.where("statut = ?", "active" ).near("#{ville}",30) == []
        @annonces = Annonce.where("statut = ?", "active").order(created_at: :desc).limit(3)
      else
        @annonces = Annonce.where("statut = ?", "active" ).near("#{ville}",30).limit(3)
      end
      if Profile.where("statut = ?", "Agent" ).near("#{ville}",50) == []
        @profiles = Profile.where("statut = ?", "Agent").limit(6)
      else
        @profiles = Profile.where("statut = ? AND id != ?", "Agent", current_user.id ).near("#{ville}",50).limit(6)
      end
    else
      @annonces = Annonce.where("statut = ?", "active").order(created_at: :desc).limit(3)
      @profiles = Profile.where("statut = ?", "Agent").limit(6)
    end
  end
end
