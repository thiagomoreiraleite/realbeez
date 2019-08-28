class CandidaturesController < ApplicationController
  before_action :set_candidature, only: [:edit, :update, :destroy, :show, :accept_candidature, :reject_candidature]

  def index
    @candidatures = policy_scope(Candidature).order(created_at: :desc)
    @annonces = current_user.annonces
  end

  def new
    authorize @candidature = Candidature.new
    @annonce = Annonce.find(params[:annonce_id])
  end

  def create
    if params[:candidature][:annonce_id].present?
      @candidature = Candidature.new
      @candidature.annonce_id = params[:candidature][:annonce_id]
      @candidature.user_id = params[:candidature][:user_id]
      @candidature.statut = "request"
      authorize @candidature
      if @candidature.save
        redirect_to candidatures_path
      else
        render :new
      end
    else
      authorize @candidature = Candidature.new(candidature_params)
      @candidature.user = current_user
      @annonce = Annonce.find(params[:annonce_id])
      @candidature.annonce = @annonce
      @candidature.statut = "pending"
      if @candidature.save
        redirect_to candidatures_path
      else
        render :new
      end
    end
  end

  def request_service


  end

  def edit
    authorize @candidature
  end

  def update
    authorize @candidature
    @candidature = Candidature.new(candidature_params)
    if @candidature.save
      redirect_to @annonce
    else
      render :edit
    end
  end

  def destroy
    authorize @candidature
    @candidature.status = "annulé"
    @candidature.save
    redirect_to candidatures_path
  end

  def accept_candidature
    authorize @candidature
    @candidature.statut = "accepté"
    @candidature.save
    redirect_to candidatures_path
  end

  def reject_candidature
    authorize @candidature
    @candidature.statut = "rejeté"
    @candidature.save
    redirect_to candidatures_path
  end

  private

  def candidature_params
    params.require(:candidature).permit(:durée, :dispo_jours, :dispo_heures, :commentaire)
  end

  def set_candidature
    @candidature = Candidature.find(params[:id])
  end

end
