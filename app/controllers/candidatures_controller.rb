class CandidaturesController < ApplicationController
  before_action :set_candidature, only: [:edit, :update, :destroy, :show, :accept_candidature, :reject_candidature, :show_proprio, :show_agent]

  def index
    @candidatures = policy_scope(Candidature).order(created_at: :desc)
    @annonces = current_user.annonces
  end

  def candidature_proprio
    authorize @candidatures = policy_scope( Candidature).order(created_at: :desc)
    @annonces = current_user.annonces

    @candidatures = []
    @annonces.each do |annonce|
      annonce.candidatures.each do |candidature|
        @candidatures << candidature
      end
    end
    @candidature_reçue = @candidatures.select{ |c| c.statut == "pending" }
    @candidature_envoyé = @candidatures.select{ |c| c.statut == "request" }
    @candidature_accepté = @candidatures.select{ |c| c.statut == "accepté" }
    @candidature_rejeté = @candidatures.select{ |c| c.statut == "rejeté" || c.statut == "pourvu"}
  end

  # || @candidatures.select{ |c| c.statut == "pourvu" }

  def candidature_agent
    authorize @candidatures = policy_scope(Candidature).order(created_at: :desc)
    @candidature_reçue = Candidature.where("statut = ? AND user_id = ?", "request", current_user)
    @candidature_envoyé = Candidature.where("statut = ? AND user_id = ?", "pending", current_user)
    @candidature_accepté = Candidature.where("statut = ? AND user_id = ?", "accepté", current_user)
    @candidature_rejeté = Candidature.where("statut = ? AND user_id = ?", "rejeté", current_user)
  end

  #&& Candidature.where("statut = ? AND user_id = ?", "pourvu", current_user)

  def show_proprio
    authorize @candidature
    @profile = @candidature.user
    @availabilities = Availability.where("user_id = ?", @candidature.user.id)
    @availability = Availability.where("user_id = ? && jours = ?", @candidature.user.id, params[:jours])
  end

  def show_agent
    authorize @candidature
  end

  def new
    authorize @candidature = Candidature.new
    @annonce = Annonce.find(params[:annonce_id])
    @availabilities = Availability.where("user_id = ?", current_user.id)
    @availability = Availability.where("user_id = ? && jours = ?", current_user.id, params[:jours])
  end

  def create
    if params[:candidature][:annonce_id].present?
      @candidature = Candidature.new
      @candidature.annonce_id = params[:candidature][:annonce_id]
      @candidature.user_id = params[:candidature][:user_id]
      # @candidature.dispo_jours = params[:candidature][:dispo_jours]
      @candidature.statut = "request"
      @availabilities = Availability.where("user_id = ?", @candidature.user_id)
      authorize @candidature
      if @candidature.save
        redirect_to candidature_proprio_path
      else
        render :new
      end
    else
      authorize @candidature = Candidature.new(candidature_params)
      @candidature.user = current_user
      @annonce = Annonce.find(params[:annonce_id])
      @candidature.annonce = @annonce
      # @candidature.dispo_jours = params[:candidature][:dispo_jours]
      @candidature.statut = "pending"
      @availabilities = Availability.where("user_id = ?", current_user.id)
      if @candidature.save
        redirect_to candidature_agent_path
      else
        render :new
      end
    end
  end

  def request_service

  end

  def edit
    authorize @candidature
    @annonce = Candidature.find(params[:id]).annonce
    @availabilities = Availability.where("user_id = ?", current_user.id)
    @availability = Availability.where("user_id = ? && jours = ?", current_user.id, params[:jours])
  end

  def update
    authorize @candidature
    @annonce = Candidature.find(params[:id]).annonce
    if Candidature.update(candidature_params)
      redirect_to candidature_agent_path
    else
      render :edit
    end
  end

  def destroy
    authorize @candidature
    @candidature.destroy
    @candidature.save
    redirect_to request.referrer
  end

  def accept_candidature
    authorize @candidature
    @candidature.statut = "accepté"
    @candidature.annonce.agent_user_id = @candidature.user_id
    @candidature.save
    @candidature.annonce.save

    Annonce.find(@candidature.annonce_id).candidatures.each do |candidature|
      if candidature.statut == "pending" || candidature.statut == "request"
        candidature.statut = "pourvu"
        candidature.save
      end
    end

    if params[:from] == "proprio"
      redirect_to candidature_proprio_path
    else
      redirect_to candidature_agent_path
    end
  end

  def reject_candidature
    authorize @candidature
    @candidature.statut = "rejeté"
    @candidature.save
    if params[:from] == "proprio"
      redirect_to candidature_proprio_path
    else
      redirect_to candidature_agent_path
    end
  end

  private

  def candidature_params
    params.require(:candidature).permit(:durée, :dispo_jours, :dispo_heures, :commentaire)
  end

  def set_candidature
    @candidature = Candidature.find(params[:id])
  end

end
