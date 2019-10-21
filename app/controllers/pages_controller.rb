class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :details_tarifs]

  def home

    if user_signed_in? && current_user.ville != nil
      ville = current_user.ville
      if Annonce.where("statut = ?", "active" ).near("#{ville}",30) == []
        @annonces = Annonce.where("statut = ?", "active").near('paris',30).limit(3)
      else
        @annonces = Annonce.where("statut = ?", "active" ).near("#{ville}",30).limit(3)
      end
      # if Profile.where("statut = ?", "Agent" ).near(current_user.adresse,100) == []
      #   @profiles = Profile.where("statut = ?", "Agent").limit(4)
      # else
      #   @profiles = Profile.where("statut = ?", "Agent" ).near(current_user.adresse,100).limit(4)
      # end
    else
      @annonces = Annonce.where("statut = ?", "active").near('paris',30).limit(3)
      # @profiles = Profile.where("statut = ?", "Agent").limit(4)
    end
  end

  def details_tarifs
  end
end
