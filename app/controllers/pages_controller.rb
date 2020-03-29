class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :details_tarifs, :mentions_legales, :nous_decouvrir, :fiches_pratiques, :statut_auto_entrepreneur, :new, :create, :reponse_contactez_nous, :charges_deductibles, :recommandation, :investissement_locatif, :outils, :documents_contrat_bail]

  def home
    # if user_signed_in? && current_user.ville != nil
    #   ville = current_user.ville
    #   # if Annonce.where("statut = ?", "active" ).near("#{ville}",30) == []
    #   #   @annonces = Annonce.where("statut = ?", "active").order(created_at: :desc).limit(3)
    #   # else
    #   #   @annonces = Annonce.where("statut = ?", "active" ).near("#{ville}",30).limit(3)
    #   # end
    #   if Profile.where("statut = ?", "Agent" ).near("#{ville}",50) == []
    #     @profiles = Profile.where("statut = ?", "Agent").limit(10)
    #   else
    #     @profiles = Profile.where("statut = ? AND id != ?", "Agent", current_user.id ).near("#{ville}",50).limit(10)
    #   end
    # else
    # @annonces = Annonce.where("statut = ?", "active").order(created_at: :desc).limit(3)
    @profiles = Profile.where("statut = ?", "Agent").limit(10)
    @contact = Contact.new
    # end
  end

  def new
    skip_authorization
    # @recipients = User.all - [current_user]
    @recipients = []
    # @conversation = params[:conversation_id]
    @recipients << @recipient = User.find(params[:message][:to].to_i)
  end

  def create
    skip_authorization
    recipient = User.where("email = ?", "contact@realbeez.com")[0]
    @sender = params[:email]
    receipt = params
    # Send email
    mail = PageMailer.with(conversation: receipt).contactez_nous
    mail.deliver_now
    redirect_to reponse_contactez_nous_path
  end
end
