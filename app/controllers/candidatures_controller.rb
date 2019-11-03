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
    @candidature_reçue = @candidatures.select{ |c| c.statut == "pending" }.sort_by{ |c| c.updated_at }
    @candidature_envoyé = @candidatures.select{ |c| c.statut == "request" }.sort_by{ |c| c.updated_at }
    @candidature_accepté = @candidatures.select{ |c| c.statut == "accepté" }.sort_by{ |c| c.updated_at }
    @candidature_rejeté = @candidatures.select{ |c| c.statut == "rejeté" || c.statut == "pourvu"}.sort_by{ |c| c.updated_at }
  end

  # || @candidatures.select{ |c| c.statut == "pourvu" }

  def candidature_agent
    authorize @candidatures = policy_scope(Candidature).order(created_at: :desc)
    @candidature_reçue = Candidature.where("statut = ? AND user_id = ?", "request", current_user).order(updated_at: :asc)
    @candidature_envoyé = Candidature.where("statut = ? AND user_id = ?", "pending", current_user).order(updated_at: :asc)
    @candidature_accepté = Candidature.where("statut = ? AND user_id = ?", "accepté", current_user).order(updated_at: :asc)
    @candidature_rejeté = Candidature.where("statut = ? AND user_id = ?", "rejeté", current_user).order(updated_at: :asc)
  end

  #&& Candidature.where("statut = ? AND user_id = ?", "pourvu", current_user)

  def show_proprio
    authorize @candidature
    @profile = @candidature.user
    @availabilities = Availability.where("user_id = ?", @candidature.user.id)
    @availability = Availability.where("user_id = ? && jours = ?", @candidature.user.id, params[:jours])
    unless @candidature.user.agent.reviews ==[]
      @sum_ratings = @candidature.user.agent.reviews.inject(0) {|sum, i|  sum + i.rating }.to_f
      @nb_ratings = @candidature.user.agent.reviews.count.to_f
      @average_ratings = (@sum_ratings/@nb_ratings)
      @full_stars = @average_ratings.to_i
      @half_full_stars = (@average_ratings - @full_stars) == 0 ? 0 : 1
      @empty_stars = 5 - @full_stars - @half_full_stars
      @reviews = @candidature.user.agent.reviews.order(created_at: :desc)
    end
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
    # create as a proprio (but user_id will be assigned to agent.id)
    if params[:candidature][:annonce_id].present?
      @candidature = Candidature.new
      @candidature.annonce_id = params[:candidature][:annonce_id]
      @candidature.user_id = params[:candidature][:user_id]
      # @candidature.dispo_jours = params[:candidature][:dispo_jours]
      @candidature.statut = "request"
      @availabilities = Availability.where("user_id = ?", @candidature.user_id)
      authorize @candidature
      if @candidature.save
        # Create a notification
        Notification.create(recipient: @candidature.user, actor: current_user, action: "candidature_create_proprio", notifiable: @candidature)
        # Send email
        mail = CandidatureMailer.with(candidature: @candidature).candidature_create_proprio
        mail.deliver_now
        redirect_to new_candidature_mandat_path(@candidature)
      else
        render :new
      end
    else
      # create as an agent
      authorize @candidature = Candidature.new(candidature_params)
      @candidature.user = current_user
      @annonce = Annonce.find(params[:annonce_id])
      @candidature.annonce = @annonce
      # @candidature.dispo_jours = params[:candidature][:dispo_jours]
      @candidature.statut = "pending"
      @availabilities = Availability.where("user_id = ?", current_user.id)
      if @candidature.save
        # Create a notification
        Notification.create(recipient: @candidature.annonce.user, actor: current_user, action: "candidature_create_agent", notifiable: @candidature)
        # Send email
        mail = CandidatureMailer.with(candidature: @candidature).candidature_create_agent
        mail.deliver_now
        redirect_to new_candidature_mandat_path(@candidature)
      else
        render :new
      end
    end
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
    # In case a candidature is deleted, need to delete also all notification linked to it
    @notifications = Notification.where("notifiable_id = ?", @candidature)
    @notifications.each do |notification|
      notification.destroy
      notification.save
    end
    if params[:from] == "annulation_mandat"
      redirect_to root_path
    else
      redirect_to request.referrer
    end
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
    # Create a notification
    if params[:from] == "proprio"
      # Create a notification
      Notification.create(recipient: @candidature.user, actor: current_user, action: "candidature_accept_proprio", notifiable: @candidature)
      # Send email
      mail = CandidatureMailer.with(candidature: @candidature).candidature_accept_proprio
      mail.deliver_now
    else
      # Create a notification
      Notification.create(recipient: @candidature.annonce.user, actor: current_user, action: "candidature_accept_agent", notifiable: @candidature)
      # Send email
      mail = CandidatureMailer.with(candidature: @candidature).candidature_accept_agent
      mail.deliver_now
    end
    if @candidature.mandat != nil
      redirect_to edit_mandat_path(@candidature.mandat.id)
    else
      if params[:from] == "proprio"
        redirect_to candidature_proprio_path
      else
        redirect_to candidature_agent_path
      end
    end
  end

  def reject_candidature
    authorize @candidature
    @candidature.statut = "rejeté"
    @candidature.annonce.agent_user_id = nil
    @candidature.annonce.save
    @candidature.save
    if params[:from] == "proprio"
      # Create a notification
      Notification.create(recipient: @candidature.user, actor: current_user, action: "candidature_reject_proprio", notifiable: @candidature)
      # Send email
      mail = CandidatureMailer.with(candidature: @candidature).candidature_reject_proprio
      mail.deliver_now
      redirect_to candidature_proprio_path
    else
      # Create a notification
      Notification.create(recipient: @candidature.annonce.user, actor: current_user, action: "candidature_reject_agent", notifiable: @candidature)
      # Send email
      mail = CandidatureMailer.with(candidature: @candidature).candidature_reject_agent
      mail.deliver_now
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
